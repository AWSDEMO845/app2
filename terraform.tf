

resource "aws_wafv2_rule_group" "example" {
  name        = "example"
  scope       = "REGIONAL"
  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name = "example"
    sampled_requests_enabled = true
  }
  rules {
    name = "example"
    priority = 1
    statement {
      sqli_match_statement {
        field_to_match {
          uri { }
        }
        text_transformation {
          priority = 1
          type = "NONE"
        }
      }
    }
    action {
      block { }
    }
  }
}

