#/bin/bash
set -x

# PREPARE DIRECTORY STRUCTURE
mkdir -p opt/{configs,images,profiles,sshkeys}

# VERSIONS=${VERSIONS:-`("1191.1.0")`}
VERSIONS=("1192.2.0" "1122.0.0")
PROFILES=("your-vm-mac" "08-00-27-95-1d-f8")

# Download Images
for VERSION in "${VERSIONS[@]}"
do
  echo "Downloading file for version $VERSION"
  mkdir -p opt/images/amd64-usr/$VERSION
  wget -nc -c https://storage.core-os.net/coreos/amd64-usr/$VERSION/coreos_production_pxe_image.cpio.gz -P opt/images/amd64-usr/$VERSION 
  wget -nc -c https://storage.core-os.net/coreos/amd64-usr/$VERSION/coreos_production_pxe.vmlinuz -P opt/images/amd64-usr/$VERSION 
done

# Setup user rsa.pub
COREOS_PUB=`cat ~/.ssh/id_rsa.pub`
echo $COREOS_PUB > opt/sshkeys/coreos.pub

cat > opt/configs/plain.yml <<EOF
#cloud-config
ssh_authorized_keys:
  - $COREOS_PUB
EOF

for PROFILE in "${PROFILES[@]}"
do
  cat > opt/profiles/${PROFILE}.json <<EOF
{
  "cloud_config": "plain",
  "rootfstype": "btrfs",
  "sshkey": "coreos",
  "version": "${VERSIONS[0]}"
}
EOF
done
