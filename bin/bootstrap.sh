TERRAFORM_VERSION=0.7.1
TERRAFORM_FILE="terraform_"$TERRAFORM_VERSION"_linux_amd64.zip"
TERRAFORM_URL=https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/$TERRAFORM_FILE

if [ ! -f "$TERRAFORM_FILE" ]
then 
  echo "Downloading $TERRAFORM_URL"
  curl -O ${TERRAFORM_URL}
  unzip -o $TERRAFORM_FILE
fi
export PATH=`pwd`:$PATH

echo "Create Jenkins Instance"
./tf.sh plan ../jenkins/infra/terraform
echo -n "Press ENTER to continue:"
read input
./tf.sh apply ../jenkins/infra/terraform