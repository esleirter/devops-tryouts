job "echo" {
  datacenters = ["dc1"]

  group "alloc" {
    count = 2
    task "alpine" {
      driver = "docker"

      config {
        image = "alpine:3.17"
        command = "sh"
        args = ["-c", "while true; do echo $HOSTNAME && sleep 100; done"]

      }

      resources {
        cpu    = 200
        memory = 256
      }
    }
  }
}
