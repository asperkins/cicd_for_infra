terraform apply\
  -var "do_token=\"${DO_PAT}\""\
  -var "pub_key=\"$WORKSPACE/.infra/keys/id_rsa.pub\""\
  -var "pvt_key=\"$WORKSPACE/.infra/keys/id_rsa\""\
  -var "ssh_fingerprint=\"$SSH_FINGERPRINT\""\
  .infra/terraform