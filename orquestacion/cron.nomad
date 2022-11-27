job "cron" {
  datacenters = ["dc1"]
  type        = "batch"

  periodic {
    cron  = "0 * * * *"
    prohibit_overlap = true
  }

  group "group" {
    task "payload" {
      driver = "exec"

      config {
        command = "bash"
        args    = [ "-c","echo \"Sleeping 1 minute...\"; sleep 60" ]
      }
    }
  }
}
