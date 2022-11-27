module "alb" {
  source = "github.com/terraform-aws-modules/terraform-aws-alb?ref=master"
  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = "vpc-CHANGEME"
  subnets            = ["subnet-CHANGEME", "subnet-CHANGEME"]
  security_groups    = ["CHANGEME"]

  access_logs = {
    bucket = "CHANGEME"
  }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTPS"
      backend_port     = 443
      target_type      = "instance"
    }
  ]

  https_listeners = [
    {
      port                 = 443
      protocol             = "HTTPS"
      certificate_arn      = "arn:aws:iam::CHANGEME:server-certificate/cert-CHANGEME"
      action_type          = "authenticate-cognito"
      target_group_index   = 0
    }
  ]
  https_listener_rules = [
    {
      https_listener_index = 0

      actions = [{
        type        = "redirect"
        status_code = "HTTP_302"
        host        = "www.youtube.com"
        path        = "/watch"
        query       = "v=dQw4w9WgXcQ"
        protocol    = "HTTPS"
      }]

      conditions = [{
        http_headers = [{
          http_header_name = "X-Forwarded-For"
          values = ["192.168.1.*"]
        }]
      }]
    }
  ]

  http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

}

