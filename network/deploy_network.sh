NETWORK_NAME="my-network"
NETWORK_VERSION="0.0.1"

# create and copy bna file
cd ../application && npm install && cp dist/"$NETWORK_NAME".bna ../network/ && cd ../network

createPeerAdmin () {
    composer card create -p org"$1"/network.json -u PeerAdmin -c crypto-config/peerOrganizations/org"$1".example.com/users/Admin@org"$1".example.com/msp/signcerts/Admin@org"$1".example.com-cert.pem -k crypto-config/peerOrganizations/org"$1".example.com/users/Admin@org"$1".example.com/msp/keystore/*_sk -r PeerAdmin -r ChannelAdmin -f PeerAdmin@"$NETWORK_NAME"-org"$1".card
}

importPeerAdmin () {
    composer card import -f PeerAdmin@"$NETWORK_NAME"-org"$1".card -c PeerAdmin@"$NETWORK_NAME"-org"$1"
}

installNetwork () {
    composer network install -c PeerAdmin@"$NETWORK_NAME"-org"$1" -a "$NETWORK_NAME".bna
}

requestAdmin () {
    composer identity request -c PeerAdmin@"$NETWORK_NAME"-org"$1" -u admin -s adminpw -d admin-org"$1"
}

createAdmin () {
    composer card create -p org"$1"/network.json -u admin-org"$1" -n "$NETWORK_NAME" -c admin-org"$1"/admin-pub.pem -k admin-org"$1"/admin-priv.pem
}

importAdmin () {
    composer card import -f admin-org"$1"@"$NETWORK_NAME".card
}

createPeerAdmin 1
createPeerAdmin 2
createPeerAdmin 3

importPeerAdmin 1
importPeerAdmin 2
importPeerAdmin 3

installNetwork 1
installNetwork 2
installNetwork 3

requestAdmin 1
requestAdmin 2
requestAdmin 3

composer network start -c PeerAdmin@"$NETWORK_NAME"-org1 -n "$NETWORK_NAME" -V "$NETWORK_VERSION" -A admin-org1 -C admin-org1/admin-pub.pem -A admin-org2 -C admin-org2/admin-pub.pem -A admin-org3 -C admin-org3/admin-pub.pem

createAdmin 1
createAdmin 2
createAdmin 3

importAdmin 1
importAdmin 2
importAdmin 3