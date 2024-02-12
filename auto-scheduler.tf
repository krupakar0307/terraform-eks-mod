data "aws_autoscaling_groups" "asg_names" {}

# Define scheduled actions for node 1
locals {
  scheduled_actions_node_1 = {
    "scale-up-action-1" = {
      min_size         = 1
      desired_capacity = 1
      max_size         = 3
      recurrence       = "0 9 * * *"
    }
    "scale-up-action-2" = {
      min_size         = 1
      max_size         = 4
      desired_capacity = 1
      recurrence       = "0 2 * * *"
    }
    "scale-up-action-3" = {
      min_size         = 1
      max_size         = 5
      desired_capacity = 1
      recurrence       = "0 15 * * *"
    }
  }
}

# Define scheduled actions for node 2
locals {
  scheduled_actions_node_2 = {
    "scale-up-action-1" = {
      min_size         = 1
      max_size         = 4
      desired_capacity = 2
      recurrence       = "0 8 * * *"
    }
    "scale-up-action-2" = {
      min_size         = 1
      max_size         = 3
      desired_capacity = 1
      recurrence       = "0 12 * * *"
    }
    "scale-up-action-3" = {
      min_size         = 1
      desired_capacity = 3
      max_size         = 4
      recurrence       = "0 5 * * *"
    }
  }
}

# Define scheduled actions for node 3
locals {
  scheduled_actions_node_3 = {
    "scale-up-action-1" = {
      min_size         = 1
      desired_capacity = 1
      max_size         = 2
      recurrence       = "0 8 * * *"
    }
    "scale-up-action-2" = {
      min_size         = 1
      desired_capacity = 1
      max_size         = 4
      recurrence       = "0 12 * * *"
    }
    "scale-up-action-3" = {
      min_size         = 1
      desired_capacity = 1
      max_size         = 6
      recurrence       = "0 15 * * *"
    }
  }
}

# Create scheduled actions dynamically for node 1
resource "aws_autoscaling_schedule" "node-1" {
  for_each = local.scheduled_actions_node_1

  scheduled_action_name = each.key
  min_size              = each.value.min_size
  max_size              = each.value.max_size
  desired_capacity      = each.value.desired_capacity
  recurrence            = each.value.recurrence

  autoscaling_group_name = data.aws_autoscaling_groups.asg_names.names[0]
}

# Create scheduled actions dynamically for node 2
resource "aws_autoscaling_schedule" "node-2" {
  for_each = local.scheduled_actions_node_2

  scheduled_action_name = each.key
  min_size              = each.value.min_size
  max_size              = each.value.max_size
  desired_capacity      = each.value.desired_capacity
  recurrence            = each.value.recurrence

  autoscaling_group_name = data.aws_autoscaling_groups.asg_names.names[1]
}

# Create scheduled actions dynamically for node 3
resource "aws_autoscaling_schedule" "node-3" {
  for_each = local.scheduled_actions_node_3

  scheduled_action_name = each.key
  min_size              = each.value.min_size
  max_size              = each.value.max_size
  desired_capacity      = each.value.desired_capacity
  recurrence            = each.value.recurrence

  autoscaling_group_name = data.aws_autoscaling_groups.asg_names.names[2]
}
