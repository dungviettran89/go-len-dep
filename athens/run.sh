wget https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz -O go.tar.gz
tar -xzf go.tar.gz
export PATH=$PATH:$(pwd)/go/bin
echo $PATH
./athens