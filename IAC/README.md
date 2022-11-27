# IAC Challenge

# EC2
```
cd EC2
terraform init
terraform apply -var="project=tryouts"
```

# ALB

For this step I recommend use an existing solution that meets all the requirenments
> `https://github.com/terraform-aws-modules/terraform-aws-alb`
```
cd ALB
terraform init
terraform apply
```