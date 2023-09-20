# Development and Deployment Scripts
## Prototype a schema change
```bash
# Build your types
npx prisma generate
# Hit `CTRL + Shift + B` in VSCode to check new typescript types (configured task)
# Update the schema in your dev db
docker compose run --rm dev-app npm run prototype
# Run your app in dev/watch mode (default compose config is dev mode)
docker compose up
# If you want to tear down containers
docker compose down
```

## Create migration to commit prototyped updates
```bash
# Build your types (if you didn't already prototype it)
npx prisma generate
# Hit `CTRL + Shift + B` in VSCode to check new typescript types (configured task)
# Creates a new folder in prisma/migrations
docker compose run --rm dev-app npm run migratedev
# Run it again for last test
docker compose up
# If you want to tear down containers
docker compose down
```

### Removing a migration
```bash
sudo rm -r prisma/migrations/<your migration folder>
```

## Deploy Production Build
```bash
docker compose -f compose.prod.yaml --env-file=./stage.env build
docker compose -f compose.prod.yaml --env-file=./stage.env up
```