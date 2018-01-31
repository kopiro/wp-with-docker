#!/bin/sh

set -x

rm -rf /app/vendor
ln -svf /composer/vendor /app/vendor

rm -rf /app/public/wordpress
ln -svf /composer/wordpress /app/public/wordpress

ln -svf /app/public/wp-config.php /app/public/wordpress/wp-config.php

chown -R www-data:www-data /app/public/wp-content/uploads

supervisord -c /etc/supervisor/conf.d/supervisord.conf