FABRIC_DIR="fabric"

if [ ! -d "$FABRIC_DIR" ]; then
    git clone https://github.com/hyperledger/fabric "$FABRIC_DIR"
fi

./scripts/network/deploy_services_kafka.sh
./scripts/network/deploy_services_org1.sh
./scripts/network/deploy_services_org2.sh
./scripts/network/deploy_services_org3.sh


