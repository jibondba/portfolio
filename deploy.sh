
#!/bin/bash
 
set -e 
echo "Deployment Started"
cd /opt/portfolio
git pull origin main
rsync -av --delete \
--exclude=".git" \
./ /var/www/html/portfolio/
 
chown -R nginx:nginx /var/www/html/portfolio
chmod -R 755 /var/www/html/portfolio
systemctl reload nginx
echo "Deployment Completed"

