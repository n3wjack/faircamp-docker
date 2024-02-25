:: Build the Docker container.

if not "%1" == "" (
    set tag=:%1
) 

docker build . -t n3wjack/faircamp%tag% -t n3wjack/faircamp:latest

