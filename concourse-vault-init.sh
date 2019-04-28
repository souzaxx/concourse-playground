#!/bin/bash
# TODO figureout a way to create selfsigned certificates for vault

docker-compose up -d vault

sleep 1

#VAULT_CACERT=${PWD}/concourse-vault/vault-certs/vault-ca.crt
VAULT_ADDR=http://127.0.0.1:8200

#vault operator init -format json &> ${PWD}/concourse-vault/vault-init.json

echo "Vault started"

#vault operator unseal $(jq -r .unseal_keys_b64[0] ${PWD}/concourse-vault/vault-init.json)
#vault operator unseal $(jq -r .unseal_keys_b64[1] ${PWD}/concourse-vault/vault-init.json)
#vault operator unseal $(jq -r .unseal_keys_b64[2] ${PWD}/concourse-vault/vault-init.json)

#vault login $(jq -r .root_token ${PWD}/concourse-vault/vault-init.json)
vault login root

vault secrets enable -version=1 -path=concourse kv
#vault policy write concourse ${PWD}/concourse-vault/concourse-policy.hcl

#vault token create -format json --policy concourse --period 1h &> ${PWD}/concourse-vault/concourse-token.json

#CONCOURSE_TOKEN=$(jq -r .auth.client_token ${PWD}/concourse-vault/concourse-token.json)

#sed -i '' -E 's/(CONCOURSE_VAULT_CLIENT_TOKEN=)(.*$)/\1'"${CONCOURSE_TOKEN}"'/g' docker-compose.yml

docker-compose up -d

#export VAULT_CACERT
export VAULT_ADDR
