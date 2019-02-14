composer card create -p org1/network.json -u PeerAdmin -c crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/f72948453ebca7082272fb97403e006c66d955c081ed08afb294003d765e6f1f_sk -r PeerAdmin -r ChannelAdmin -f PeerAdmin@network-org1.card
composer card import -f PeerAdmin@network-org1.card -c PeerAdmin@network-org1
composer network install -c PeerAdmin@network-org1 -a "$1".bna
composer network start --networkName "$1" --networkVersion "$2" -A admin -S adminpw -c PeerAdmin@network-org1 -f admin@"$1"-org1.card
composer card import -f admin@"$1"-org1.card -c admin@"$1"-org1
