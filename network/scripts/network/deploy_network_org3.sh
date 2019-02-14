composer card create -p org3/network.json -u PeerAdmin -c crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp/signcerts/Admin@org3.example.com-cert.pem -k crypto-config/peerOrganizations/org3.example.com/users/Admin@org3.example.com/msp/keystore/8f954b82fe04d6aa26c949992ffe8893339fcdc0becc3f7f4130e8f905df9614_sk -r PeerAdmin -r ChannelAdmin -f PeerAdmin@network-org3.card
composer card import -f PeerAdmin@network-org3.card -c PeerAdmin@network-org3
composer network install -c PeerAdmin@network-org3 -a "$1".bna
composer network start --networkName "$1" --networkVersion "$2" -A admin -S adminpw -c PeerAdmin@network-org3 -f admin@"$1"-org3.card
composer card import -f admin@"$1"-org3.card -c admin@"$1"-org3
