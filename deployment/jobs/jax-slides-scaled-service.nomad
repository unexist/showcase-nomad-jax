job "todo" {
  datacenters = ["dc1"]

  group "web" {
    count = 5

    task "jax" {
      driver = "java"

      config {
        jar_path = "/Users/christoph.kappel/Projects/showcase-nomad-jax/target/showcase-nomad-jax-0.1-runner.jar"
        jvm_options = [
          "-Xmx256m", "-Xms256m",
          "-Dquarkus.http.port=${NOMAD_PORT_http}"
        ]
      }

      resources {
        memory = 256
      }

      service {
        name = "jax"
        port = "http"

        tags = [
          "urlprefix-/jax",
        ]

        check {
          type     = "http"
          path     = "/"
          interval = "2s"
          timeout  = "2s"
        }
      }
    }

    network {
      port "http" {}
    }
  }
}