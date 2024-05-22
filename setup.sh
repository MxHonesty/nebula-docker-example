mkdir bin
cd ./bin
wget "https://github.com/slackhq/nebula/releases/download/v1.9.0/nebula-linux-amd64.tar.gz"
tar -xzf nebula-linux-amd64.tar.gz
rm nebula-linux-amd64.tar.gz
cd ..

mkdir cert
cd ./cert
../bin/nebula-cert ca -name "HonestyCorp"
../bin/nebula-cert sign -name "lighthouse1" -ip "192.168.100.1/24"
../bin/nebula-cert sign -name "laptop" -ip "192.168.100.5/24" -groups "laptop,ssh"
../bin/nebula-cert sign -name "server" -ip "192.168.100.9/24" -groups "servers"

cp ./lighthouse1.key ../lighthouse-config/
cp ./lighthouse1.crt ../lighthouse-config/
cp ./ca.crt ../lighthouse-config/

cp ./ca.crt ../laptop-config/
cp ./laptop.key ../laptop-config/
cp ./laptop.crt ../laptop-config/

cp ./ca.crt ../server-config/
cp ./server.key ../server-config/
cp ./server.crt ../server-config/

