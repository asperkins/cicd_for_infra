if [ -f "/etc/ansible/setenv.sh" ]
	then
#	eval $(ansible-vault view /etc/ansible/setenv.sh --vault-password-file=/etc/ansible/vault_password)
  . /etc/ansible/setenv.sh
fi

check_env(){
  : "${DO_PAT?DO_PAT Env var not set}"
  : "${PUB_KEY?PUB_KEY Env var not set}"
  : "${PVT_KEY?PVT_KEY Env var not set}"
  : "${SSH_FINGERPRINT?SSH_FINGERPRINT Env var not set}"
}
WORKSPACE=$2

check_env

terraform $1\
  -var "do_token=\"${DO_PAT}\""\
  -var "pub_key=\"$PUB_KEY\""\
  -var "pvt_key=\"$PVT_KEY\""\
  -var "ssh_fingerprint=\"$SSH_FINGERPRINT\""\
  -var "workspace=\"$WORKSPACE\""\
  $WORKSPACE
