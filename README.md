# concourse-playground
A way to quick start working with concourse + vault as Credential Manager

``` bash
source concourse-vault-init.sh
```

vault write concourse/main/docker-hub-username value='registry:5000'

cd pipeline-example/
fly -t tutorial sp -p node-linter -c docker-image-linter.yml
fly -t tutorial up -p node-linter
