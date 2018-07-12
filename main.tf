
resource "null_resource" "composer" {
  provisioner "local-exec" {
    command = "gcloud beta composer environments create ${var.env-name}  --location us-east1 --disk-size 20GB   --zone us-east1-b  --machine-type n1-standard-1  --node-count 3 --labels env=beta"
  }
}

resource "null_resource" "file-copy" {
  provisioner "local-exec" {
    command =    "gcloud beta composer environments storage dags import --environment=${ var.env-name } --location=us-east1 --source=/home/arpitrudra1991/Dataflowdag.py"
    
  }
  depends_on = ["null_resource.composer"]
}

resource "null_resource" "composer-describe" {
  provisioner "local-exec" {
    command = "gcloud beta composer environments describe --location=us-east1 ${var.env-name}| grep airflowUri "
  }
  depends_on = ["null_resource.composer"]
}

