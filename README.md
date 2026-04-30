Basic Docker deployment for Dummies ;)

👋Hi from highly-tuned Linux dear Jay!

# HowTo

# Build image
docker build -t db-test .

# Run container
with alternative ports(0.0.0.0:3696->80/tcp) due to collision in network

docker run -d -p 3696:80 -p 3306:3306 --name database-php-test db-test


DevOps admin Martino 2022-2026
