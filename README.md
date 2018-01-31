## wp-with-docker

Wordpress containerized in a single Docker image.

* OS Alpine
* PHP 7.1
* NGINX with PHP-FPM
* Installation of Wordpress via Composer
* Support for HTTPS
* NGINX fastcgi-caching enabled

### Development

```
cp .env.example .env
docker-compose up
```

### License

MIT