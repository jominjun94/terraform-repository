resource "aws_instance" "test-ec2-bastion" {

# os image - amazon 2
  ami                         = "ami-0f22ac1c12807aefc"
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2a"

  iam_instance_profile        = aws_iam_instance_profile.test-ec2-instance-profile.name
  key_name                    = "key-aws"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"

  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = "0"
  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
  }

  monitoring = "false"

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"

    tags = {
      Name        = "ec2_jenkins-ebs"
    }

    volume_size = "8"
    volume_type = "gp2"
  }

  source_dest_check = "true"


  tags = {
    Name        = "ec2_instance"
  }

  tags_all = {
    Name        = "ec2_jenkins"
  }

  tenancy       = "default"

  subnet_id     = aws_subnet.test-public-subnet2.id
  vpc_security_group_ids = [aws_security_group.ec2_jenkins.id]
}

