Basic Docker deployment for Dummies ;)

👋Hi from highly-tuned Linux dear Jay!

# HowTo

# Build image
docker build -t db-test .

# Run container
docker run -d -p 3696:80 -p 3306:3306 --name database-php-test db-test

** alternative port is used :3696 instead of :80(0.0.0.0:3696->80/tcp)
due to possible collision in network **

DevOps Martino 2022-2026
