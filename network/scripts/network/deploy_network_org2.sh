composer card create -p org2/network.json -u PeerAdmin -c crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem -k crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/8325408e461a00b8e1179039014946baec1007eeb4dd0756e1819bd2f26d5df5_sk -r PeerAdmin -r ChannelAdmin -f PeerAdmin@network-org2.card
composer card import -f PeerAdmin@network-org2.card -c PeerAdmin@network-org2
composer network install -c PeerAdmin@network-org2 -a "$1".bna
composer network start --networkName "$1" --networkVersion "$2" -A admin -S adminpw -c PeerAdmin@network-org2 -f admin@"$1"-org2.card
composer card import -f admin@"$1"-org2.card -c admin@"$1"-org2
