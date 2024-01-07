# Docker Faircamp

## About

This project allows you to use the Faircamp app, using Docker. This makes it possible to use Faircamp on operating systems that currently have no easy installation option.

Since there are no build for Windows that make it easy to run Faircamp locally at the time, this project hopes to make it easy for anyone to use Faircamp to build their own music catalog. This also allows you to use this on a Mac, with some command line fiddling.

Faircamp is an open source static site generator to represent your music on the internet.
- https://simonrepp.com/faircamp/

## Requirements

You need to be able to run Docker containers on your system.
The easiest option is to install Docker Desktop, which is free and has a simple installation procedure for Windows, Mac and Linux.
- https://www.docker.com/get-started/

## Usage

### Windows

1. Install [Docker Desktop](https://www.docker.com/get-started/).
2. From this repository, get the `run-faircamp.cmd` script and put it in a folder somewhere, e.g. `/faircamp`.
   - Right-click [this link to the script](https://github.com/n3wjack/faircamp-docker/raw/main/run-faircamp.cmd), and save the file in your preferred working folder.
3. Windows will not trust this file by default, because it was downloaded over the internet. To be able to use it, you'll need to remove this protection.
   You do this by:
   - Right-clicking the file.
   - Select **Properties**
   - In the first tab, check the **Unblock** box.
   - Finish by clicking the **OK** button.
3. Create a subfolder with the name `data` in the folder where you stored the script. This is where your music will go.
4. Put the files Faircamp needs to build your catalog in this data folder (your mp3's, etc.) See the [getting started guide on the Faircamp site](https://simonrepp.com/faircamp/manual/getting-started.html) for more info.
   Basically, you can get started with a folder per album ("My Greatest Hits") and putting your mp3s in there.
   So it would look something like this:

        c:\users\johnmastodon\faircamp\data\greatest hits\...

5. Build your catalog by running the `run-faircamp.cmd` script. You can do that by simply double-clicking the file, or run it from a shell. It will use the files in the `data` folder automatically.
   
   Note that the first time this could take a while, as it will be downloading the Docker container needed to run Faircamp, which is quite big.
6. The script runs in a loop, to allow you to keep regenerating the sites. To quit, enter anything but "y", followed by the Enter key.

The script will generate 2 versions of your website. One that can be browsed locally, and one that can be uploaded as your Faircamp website.
The local browsable version will automatically open in a browser at the end of the build process.

You can find these 2 versions in your data folder:
- `.faircamp_build` : the version to upload to your site.
- `.faircamp_build_browsable` : the local browsable version.

### Other platforms

You can also use the Docker container to build on any other platform capable of running a Docker container. Any extra arguments you pass in when running the container, will be passed on to the Faircamp executable, so you don't need the .cmd script provided for Windows. You can use it to see the command line statement used, which is something like this:

    docker run -ti -v <path to your data folder>:/data --rm n3wjack/faircamp <extra arguments>

## Build the container yourself 

Using this project, you can also build the container yourself.
Here's how to do that:

1. Clone this repository using `git clone https://github.com/n3wjack/faircamp-docker`.
2. Run the `build-container.cmd` script to build the container, or peek inside the script to get the command line statement to build the container.
3. Sit back and watch Docker do its thing.
4. You can now run the locally built container, using the same `run-faircamp.cmd` script, or by manually running it using the docker command line.

## Docker container info

The Docker container used to run Faircamp can be found at [n3wjack/faircamp](https://hub.docker.com/r/n3wjack/faircamp).

The image is quite big, due to the dependencies it needs (ffmpeg and libvips42). Still, it runs pretty fast once downloaded.

## License

This project is licensed under the [MIT license](https://github.com/n3wjack/faircamp-docker/blob/main/LICENSE).

