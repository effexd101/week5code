sudo yum install -y httpd 
sudo systemctl start httpd 
sudo systemctl enable httpd 
echo '<h1>This Is My First Terraform Project</h1>' | sudo tee /var/www/html/index.html
sudo groupadd cloudteam
sudo useradd u5bt2024