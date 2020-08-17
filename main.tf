terraform {
  required_version = "13"
}

provider "heroku" {
  email   = var.email
  api_key = var.heroku_api_key
  version = "2.6"
  alias   = "second_station_app"
}

resource "heroku_app" "hojeehdiaderua" {
  name     = var.application_name
  provider = heroku.second_station_app
  region   = var.application_region

  #config_vars = var.application_config_vars

  buildpacks = var.application_buildpacks
}

resource "heroku_build" "hojeehdiaderua_build" {
  app      = heroku_app.hojeehdiaderua.id
  provider = heroku.second_station_app

  source = {
    url     = "${var.build_url}${var.build_project_version}.tar.gz"
    version = var.build_project_version
  }
}

resource "heroku_formation" "second_station_formation" {
  app      = heroku_app.hojeehdiaderua.id
  provider = heroku.second_station_app
  type     = var.formation_type
  quantity = var.formation_quantity
  size     = var.formation_size

  depends_on = [
    heroku_build.hojeehdiaderua_build
  ]
}
