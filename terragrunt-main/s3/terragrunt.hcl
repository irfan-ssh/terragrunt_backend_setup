terraform {
   source = "git::ssh://git@bitbucket.org/northbay/traveloka.git//modules/s3"
}

inputs = {
  bucket_name = "test2-xyz-frontend-bucket"
  enable_logging = false
}

include {
  path = find_in_parent_folders()
}