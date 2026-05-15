```
sudo apt install -y build-essential libxml2-dev libssl-dev libcurl4-openssl-dev \
libjpeg-dev libpng-dev libonig-dev libzip-dev pkg-config
```
```
wget https://www.php.net/distributions/php-8.3.6.tar.gz
```
```
tar -xvf php-8.3.6.tar.gz
```
```
cd php-8.3.6
```
```
./configure --prefix=/usr/local/php8.3 --with-apxs2=/usr/bin/apxs --enable-mbstring --with-curl --with-zlib
make -j$(nproc)
```
```
sudo make install
```
