aws secretsmanager create-secret \
  --name fullstack-chatapp \
  --secret-string '{
    "MONGO_INITDB_ROOT_USERNAME":"mongoadmin",
    "MONGO_INITDB_ROOT_PASSWORD":"secret",
    "JWT_SECRET":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...",
    "MONGODB_URI":"mongodb://mongoadmin:secret@mongodb:27017/dbname?authSource=admin"
  }'
