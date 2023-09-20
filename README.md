# Common Scripts
## Prototype a schema change
```bash
# Build your types
npx prisma generate
# Update the schema in your dev db
docker compose run --rm dev-prisma-postgres-api npm run prototype
# Run your app in dev/watch mode (default compose config is dev mode)
docker compose up
# If you want to tear down containers
docker compose down
```

## Create migration to commit prototyped updates
```bash
# Build your types (if you didn't already prototype it)
npx prisma generate
# Creates a new folder in prisma/migrations
docker compose run --rm dev-prisma-postgres-api npm run migratedev
# Run it again for last test
docker compose up
# If you want to tear down containers
docker compose down
```

### Removing a migration
```bash
sudo rm -r prisma/migrations/<your migration folder>
```
