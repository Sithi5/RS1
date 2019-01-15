rm /var/www/html/index.html
rm -rf /var/www/web_deploy
git clone https://github.com/Sithi5/website-rs1.git /var/www/web_deploy
cp /var/www/web_deploy/index.html /var/www/html/index.html

echo "$_GREEN==================================================================$_DEF\n"
mkdir -p /etc/ssl/localcerts

echo "$_GREEN==================================================================$_DEF\n"
openssl req -new -x509 -days 365 -nodes -out /etc/ssl/localcerts/apache.pem -keyout /etc/ssl/localcerts/apache.key

echo "$_GREEN==================================================================$_DEF\n"
chmod 600 /etc/ssl/localcerts/apache*

echo "$_GREEN==================================================================$_DEF\n"
a2enmod ssl

echo "$_GREEN==================================================================$_DEF\n"
mv /home/malo/ssl.conf /etc/apache2/sites-available/ssl.conf

echo "$_GREEN==================================================================$_DEF\n"
a2ensite ssl.conf

echo "$_GREEN==================================================================$_DEF\n"
a2dissite default-ssl.conf

echo "$_GREEN==================================================================$_DEF\n"
rm /etc/apache2/ports.conf

echo "$_GREEN==================================================================$_DEF\n"
mv /home/malo/ports.conf /etc/apache2/ports.conf

echo "$_GREEN==================================================================$_DEF\n"
systemctl restart apache2