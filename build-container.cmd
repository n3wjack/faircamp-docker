:: Build the Docker container.
docker build . -t n3wjack/faircamp:latest

:: Optionally tag the release
if not "%1" == "" (
    docker tag n3wjack/faircamp n3wjack/faircamp:%1
)

