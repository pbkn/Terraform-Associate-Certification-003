import {
  # ID of existing EC2
  id = "i-020e6c1e31b65627b"

  # Resource address
  to = aws_instance.ec2
}

import {
  # Name of existing S3 bucket
  id = "poc-tfc-import"

  # Resource address
  to = aws_s3_bucket.s3
}
