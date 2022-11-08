# gha-run-cmds

## Description
Run different commands in container.
ℹ The PHP image used can be passed through `docker-image` input or through `PROJECT_IMAGE` env variable.    
**NOTE:** If you use [gha-image-setup](https://github.com/adore-me/gha-image-setup) in a previous step you don't need to worry about it, as it already sets the `PROJECT_IMAGE` 👌    
**Input** takes precedence!

## Inputs 
| Key                          | Required  | Default | Description                                                                                |
|------------------------------|-----------|---------|--------------------------------------------------------------------------------------------|
| **docker-image**             | **true**  | `''`    | Image to use (fully qualified image address. ex: quay.io/adoreme/nginx-fpm-alpine:v0.0.1). |
| **run-laravel-route-cache**  | **false** | `false` | Enable or disable laravel route caching                                                    |
| **custom-cmds**              | **false** | `''`    | Add extra commands separated by new line or in one single line with `&&`                   |

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
      run-laravel-config-cache: true
      custom-cmds: |
        php artisan config:cache
        php artisan route:list
        ls -la
```
