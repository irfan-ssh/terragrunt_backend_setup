terraform {
   source = "../../terraform-modules/s3"
}

inputs = {
  bucket_sufixx = "backend"
}

include {
  path = find_in_parent_folders()
}