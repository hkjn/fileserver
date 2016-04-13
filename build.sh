docker build -t fileserver-build -f Dockerfile.build .
docker run --rm -it -v $(pwd):/build fileserver-build
docker build -t hkjn/fileserver .
docker rmi fileserver-build
