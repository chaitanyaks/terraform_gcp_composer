provider "google" {
  credentials = "${file("${var.FILE_PATH}")}"
  project     = "${var.PROJECT_NAME}"
  region      = "${var.REGION_NAME}"
}
