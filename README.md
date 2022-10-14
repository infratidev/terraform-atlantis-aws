[![Blog](https://img.shields.io/website?down_color=blue&down_message=infrati.dev&label=Blog&logo=ghost&logoColor=green&style=for-the-badge&up_color=blue&up_message=infrati.dev&url=https%3A%2F%2Finfrati.dev)](https://infrati.dev)

### Configurações do Terraform para executar o Atlantis no AWS Fargate

```
https://registry.terraform.io/modules/terraform-aws-modules/atlantis/aws/latest
```

### Atlantis

Atlantis é uma aplicação para automatizar o terraform por meio de pull requests. 
O Atlantis ouve o webhook do GitHub e retorna o output dos comandos ```terraform plan``` e ```terraform apply``` através dos comentários.

### Requirements

* Será utilizado o módulo abaixo para provisionar a infraestrutura do Atlantis no AWS Fargate.

``` 
https://registry.terraform.io/modules/terraform-aws-modules/atlantis/aws/latest 
```

* Terraform instalado, nesse caso utilizado v1.3.2
* Credenciais de acesso já criadas no IAM com as permissões necessárias para os recursos na AWS. A documentação discrimina os recursos utilizados:
~~~
    - Virtual Private Cloud (VPC)
    - SSL certificate using Amazon Certificate Manager (ACM)
    - Application Load Balancer (ALB)
    - Domain name using AWS Route53 which points to ALB
    - AWS Elastic Container Service (ECS) and AWS Fargate running Atlantis Docker image
    - AWS Parameter Store to keep secrets and access them in ECS task natively
~~~

* aws_access_key_id e aws_secret_access_key geradas.
* Geração do token no github com permissão ao respositório. Instruções abaixo criação:

```
https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
```

* Hosted zone criada no AWS Route 53, nesse exemplo vou utilizar o domínio de teste pessoal ```sres.dev```

### Repositório

#### Estrutura a ser provisionado no PR utilizando Atlantis

```
- terraform-atlantis-aws
    * ec2.tf
    * ig.tf
    * sg.tf
    * subnet-route.tf
    * vpc.tf
    * provider.tf
    * output.tf
    * variables.tf
```

#### Estrutura a ser provisionado para deploy do Atlantis

```
- terraform-atlantis-aws
    - infra-atlantis
        * atlantis.tf
        * provider.tf
        * dynamo-tfstate-lock.tf
        * s3-tfstate.tf
        * terraform.tfvar
        * variables.tf
```

[![Blog](https://img.shields.io/website?down_color=blue&down_message=infrati.dev&label=Blog&logo=ghost&logoColor=green&style=for-the-badge&up_color=blue&up_message=infrati.dev&url=https%3A%2F%2Finfrati.dev)](https://infrati.dev)


