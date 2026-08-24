# Execucao sem AWS

Este modo permite estudar Terraform e executar a pipeline sem criar recursos em uma conta AWS.

## O que foi alterado

### Provider local

`infra/provider.tf` deixou de declarar o provider `aws` e passou a usar `hashicorp/local`.

Motivo: o projeto nao precisa mais autenticar em uma conta cloud. O provider local cria arquivos no ambiente onde o Terraform esta sendo executado.

### Estado local

`infra/backend.tf` agora usa o backend `local`, com o arquivo `terraform.tfstate`.

Motivo: o backend S3 e o lock via DynamoDB eram dependencias exclusivas da AWS. Os workspaces continuam disponiveis; localmente, os estados dos workspaces ficam sob `terraform.tfstate.d/`.

### Bucket simulado

`infra/main.tf` troca `aws_s3_bucket` por `local_file`. Para cada ambiente, o Terraform cria um arquivo chamado `bucket-<nome>.txt` contendo o nome do bucket simulado.

Motivo: sem um provedor de armazenamento, nao existe bucket real para criar. O arquivo preserva o objetivo didatico de demonstrar um recurso gerenciado pelo Terraform.

### GitHub Actions

Os workflows removem:

- credenciais OIDC e a action `configure-aws-credentials`;
- parametros de role, regiao, bucket S3 e tabela DynamoDB;
- configuracao de backend remoto AWS.

O workflow reutilizavel continua executando `init`, `validate`, `plan`, `apply` e `destroy` para `dev` e `prod`. A validacao passou a executar dentro de `infra`, onde ficam os arquivos Terraform.

## Execucao local

Na raiz do repositorio:

```powershell
cd infra
terraform init
terraform workspace new dev
terraform plan -var-file="envs/dev/terraform.tfvars"
terraform apply -var-file="envs/dev/terraform.tfvars"
```

Para o ambiente de producao, use `prod` no workspace e no arquivo de variaveis:

```powershell
terraform workspace new prod
terraform apply -var-file="envs/prod/terraform.tfvars"
```

Para remover o arquivo criado:

```powershell
terraform destroy -var-file="envs/dev/terraform.tfvars"
```

## Execucao no GitHub

- Push na branch `develop` executa o ambiente `dev`.
- Push na branch `main` executa o ambiente `prod`.
- O runner do GitHub e efemero. Como o backend agora e local, o state nao e compartilhado entre execucoes e nao deve ser usado para infraestrutura persistente.
- Para um projeto real, mantenha o backend em um servico com armazenamento e locking, como Terraform Cloud, ou use um backend compativel com S3 oferecido por outro provedor.

## Limites desta versao

Esta configuracao nao cria um bucket, uma VM ou qualquer outro recurso cloud. Ela e adequada para aprendizado, testes da sintaxe do Terraform e demonstracao da pipeline. Para provisionar infraestrutura real sem AWS, substitua o recurso `local_file` por um provider de Azure, Google Cloud, Oracle Cloud, Hetzner, MinIO ou outro servico escolhido.
