# gha-run-cmds

## Description
Run different commands in container.

## Inputs 
| Key                         | Required  | Default | Description                                                                                |
|-----------------------------|-----------|---------|--------------------------------------------------------------------------------------------|
| **docker-image**            | **true**  | `N/A`   | Image to use (fully qualified image address. ex: quay.io/adoreme/nginx-fpm-alpine:v0.0.1). |
| **run-laravel-route-cache** | **false** | `false` | Enable or disable laravel route caching                                                    |
| **custom-cmds**             | **false** | `N/A`   | Add extra commands separated by new line or in one single line with `&&`                   |

## Outputs
None.

## Notes
ℹ Even though it's built with PHP in mind and has some built in opinionated cmds (`run-laravel-route-cache`) you can use this to run basically any command in any container you need to by using the `custom-cmds` and passing any container you need through `docker-image`

### Example of step configuration and usage:
```yaml
steps:
  - name: 'Run commands'
    uses: adore-me/gha-run-cmds@master
    with:
      docker-image: SOME_DOCKER_IMAGE
      run-laravel-route-cache: true
      custom-cmds: |
        php artisan config:cache
        php artisan route:list
        ls -la
```
