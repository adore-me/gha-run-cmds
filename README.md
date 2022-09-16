# gha-php-run-cmds

## Description
Run different commands in container.

## Inputs 
| Key                         | Required  | Default | Description                                                                                    |
|-----------------------------|-----------|---------|------------------------------------------------------------------------------------------------|
| **php-image**               | **true**  | `N/A`   | PHP image to use (fully qualified image address. ex: quay.io/adoreme/nginx-fpm-alpine:v0.0.1). |
| **run-laravel-route-cache** | **false** | `false` | Enable or disable laravel route caching                                                        |
| **custom-cmds**             | **false** | `N/A`   | Add extra commands separated by new line or in one single line with `&&`                       |

## Outputs
None.

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Run commands'
    uses: adore-me/gha-post-install-cmds@master
    with:
      php-image: SOME_PHP_IMAGE
      run-laravel-route-cache: true
      custom-cmds: |
        php artisan config:cache
        php artisan route:list
        ls -la
```
