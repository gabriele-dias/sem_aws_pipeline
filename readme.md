<p align="center" width="100%">
    <img width="50%" src="https://github.com/buildrun-tech/buildrun-infra-terraform-pipeline/blob/main/images/thumbnail.png"> 
</p>


<h3 align="center">
  Pipeline de Infraestrutura (Terraform + Github Actions + Multi Env)
</h3>

<p align="center">

  <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-%2304D361">
  <img alt="Version: 1.0" src="https://img.shields.io/badge/version-1.0-yellowgreen">

</p>

[Se inscreva em nosso canal no Youtube!](https://www.youtube.com/@buildrun-tech?sub_confirmation=1)

Para um maior entendimento do código deste repositório, [assista nosso vídeo no Youtube, clique aqui.](https://www.youtube.com/watch?v=1TNAUW7_bC0)

## Fluxo da Pipeline

<p align="center" width="100%">
    <img width="100%" src="https://github.com/buildrun-tech/buildrun-infra-terraform-pipeline/blob/main/images/fluxo.png"> 
</p>

<p align="center" width="100%">
    <img width="100%" src="https://github.com/buildrun-tech/buildrun-infra-terraform-pipeline/blob/main/images/fluxo-detail.png"> 
</p>

## Como começar?
- Instale o Terraform
- Clone este repositório
- Execute `terraform init` dentro de `infra`
- Escolha o workspace `dev` ou `prod`
- Execute `terraform plan` e `terraform apply` usando o arquivo de variáveis do ambiente

Esta versão executa sem AWS: o estado fica localmente e o bucket é representado por um arquivo local.
Consulte [docs/sem-aws.md](docs/sem-aws.md) para entender todas as alterações, comandos e limitações.

:mag: Baixe o projeto e teste você mesmo na prática.

[Conheça mais sobre o nosso trabalho 😀](https://www.instagram.com/buildrun.tech/)

Developed by Build & Run

### Referências

- [Documentação do Terraform](https://developer.hashicorp.com/terraform/docs)