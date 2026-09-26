# Docker Faircamp

## About

This project allows you to use the Faircamp app, using Docker. This makes it possible to use Faircamp on operating systems that currently have no easy installation option.
This project hopes to make it easy for anyone to use Faircamp to build their own music catalog. 

The provided batch script is for the Windows OS, as there wasn't an option to install the Faircamp application on Windows with earlier versions. There is now, so if you want to install Faircamp directly, see the download options on the website instead: https://faircamp.org/

Faircamp is an open source static site generator to represent your music on the internet.
- https://faircamp.org/

## Faircamp v1 vs v2 script

In Faircamp v2 the command line interface changed, breaking backwards compatiblity.
This means the `build-container.cmd` script is now also version dependend.

So be sure to:
- Run v2.x Faircamp container versions with the latest version of the script.
- Run v1.x Faircamp container versions with the previous version of the script. 
  - You can find this in releases: https://github.com/n3wjack/faircamp-docker/releases/tag/v1.0
  - Or using the v1 Git tag: https://github.com/n3wjack/faircamp-docker/tree/v1.0
  - Or directly here: https://github.com/n3wjack/faircamp-docker/blob/v1.0/run-faircamp.cmd

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
4. Put the files Faircamp needs to build your catalog in this data folder (your mp3's, etc.) See the [getting started guide on the Faircamp site](https://faircamp.org/docs/latest/guide/getting-started/index.html) for more info.
   Basically, you can get started with a folder per album ("My Greatest Hits") and putting your music files in there.
   So it would look something like this:

        c:\users\johnmastodon\faircamp\data\greatest hits\...

5. Build your catalog by running the `run-faircamp.cmd` script. You can do that by simply double-clicking the file, or run it from a shell. It will use the files in the `data` folder automatically.
   
   Note that the first time this could take a while, as it will be downloading the Docker container needed to run Faircamp, which is quite big.
6. The script runs in a loop, to allow you to keep regenerating the sites. To quit, enter anything but "y", followed by the Enter key.

The local version of your Faircamp site will automatically open in a browser at the end of the build process.

You can find the data folder in `data\.faircamp_build`

### Other platforms

You can use the Docker container to build on any other platform capable of running a Docker container. Any extra arguments you pass in when running the container, will be passed on to the Faircamp executable, so you don't need the .cmd script provided for Windows. You can use it to see the command line statement used, which is something like this:

    docker run -ti -v <path to your data folder>:/data --rm n3wjack/faircamp <extra arguments>

### Running a specific version of Faircamp

It's possible to run a specific version of Faircamp by passing in an extra parameter to the `run-faircamp.cmd` script.
This version must be an existing Docker tag, which match the Faircamp version in the container. You can see the [available tags here](https://hub.docker.com/repository/docker/n3wjack/faircamp/tags).

For example, to run version 2.0.0 of Faircamp:

      .\run-faircamp.cmd 2.0.0

### Run only once

By default the `run-faircamp.cmd` script will run in a loop, until you tell it to stop.
The idea is that you might be tweaking your Faircamp site configuration, while you have the command running in a shell continuously.

If you only want it to run once, you can pass the command line argument `-singlerun`, like this:

      .\run-faircamp.cmd -singlerun

You can also combine this with a specific version numbern as mentioned earlier.

      .\run-faircamp.cmd 1.1 -singlerun

## Build the container yourself 

Using this project, you can also build the container yourself.
Here's how to do that:

1. Clone this repository using `git clone https://github.com/n3wjack/faircamp-docker`.
2. Run the `build-container.cmd <version>` script to build the container, or peek inside the script to get the command line statement to build the container.
   You have to pass in the Faircamp version as the first argument to build a container for that version.
3. Sit back and watch Docker do its thing.
4. You can now run the locally built container, using the same `run-faircamp.cmd` script, or by manually running it using the Docker CLI.

## Docker container on Docker HUB

The Docker container used to run Faircamp can be found at [n3wjack/faircamp](https://hub.docker.com/r/n3wjack/faircamp).

The image is quite big, due to the dependencies it needs (ffmpeg and libvips42). Still, it runs pretty fast once downloaded.

## License

This project is licensed under the [MIT license](https://github.com/n3wjack/faircamp-docker/blob/main/LICENSE).

