# Orquestacion Challenge

## Run Nomad

```
nomad agent -dev
```
> URL `http://127.0.0.1:4646/`

### Run a simple Job

```
nomad job run echo.nomad
```

### Run a cron
```
nomad cron.nomad
```