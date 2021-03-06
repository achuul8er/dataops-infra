output "glue_job_summary" { value = module.glue_job.summary }
module "glue_job" {
  source        = "../../components/aws/glue-job"
  name_prefix   = local.name_prefix
  environment   = module.env.environment
  resource_tags = local.resource_tags

  s3_script_bucket_name      = module.data_lake.s3_metadata_bucket
  s3_source_bucket_name      = module.data_lake.s3_data_bucket
  s3_destination_bucket_name = module.data_lake.s3_data_bucket
  local_script_path          = "python/transform.py"
  # s3_script_path             = "python/transform.py"

  /* Optional config here:

  # with_spark = trueS


  */
}
