# Docker Robot WebUI demo

Simple project for creating an ubuntu docker image with necessary tools to execute a robot framework webui test in a container.

Modifications to run on RaspberryPi4 

__Prerequisites:__
- Docker installed

__Instructions:__
- Clone project from GitLab
- Navigate inside the local repo folder with a command line tool
- Build the docker image with "__docker build -t robot-webui-test .__"
  - -t gives a name for the image, so it's easier to run the correct one
  - . references to the current path where to read the build instructions
- Run the tests with "__docker run -it -v <path_to_local_repo_folder>:/usr/src/project robot-webui-test <optional_arg>__"
  - -it shows an interactive shell output with colors
  - -v mounts a directory on PC to container directory, which has the test files
  - If given a specific file path as optional argument, e.g. "suites/02-SeleniumSmoke.robot", only that suite will be executed instead of all tests in the suites folder

__Issues:__
- Demo only works if PC language is set to Finnish, as it checks the finnish text to agree to google's terms
- If terms have been previously accepted, the suite will fail as it expects the buttons to show
