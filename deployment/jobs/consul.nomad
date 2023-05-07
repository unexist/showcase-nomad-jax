job "consul" {
  datacenters = ["dc1"]

  group "consul" {
    count = 1

    task "consul" {
      driver = "raw_exec"

      config {
        command = "consul"
        args    = ["agent", "-dev"]
      }

      artifact {
        #source = "https://releases.hashicorp.com/consul/1.12.3/consul_1.12.3_darwin_amd64.zip"
        source = "file:///Users/christoph.kappel/Projects/showcase-nomad-jax/deployment/artifacts/consul_1.12.3_darwin_amd64.zip"
      }
    }
  }
}
