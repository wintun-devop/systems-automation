### Preparing on online machine to deploy at offline
```
npm ci
```
```
npm rebuild bcrypt
```
```
npx prisma migrate dev
```
```
npx prisma db seed
```
```
npx prisma migrate dev
```
```
npx prisma db seed
```
```
npm run build
```
```
tar -czf node_modules.tgz node_modules package.json package-lock.json
```