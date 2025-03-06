# Intro

Boilerplate to run web app and automated browser test client in separate docker containers

Also provides github actions workflow template

## Motivation

For me, screenshot tests don't match locally with Github Actions. But I am also on a non-standard OS (Qubes OS) which runs linux using Xen hypervisor, so that may be why

I'm doing this to make it easy for me to start a new web app project with reliable test driven functionality

Test driven development is nice and fun to have, and makes refactoring a breeze.
As such I want to make this the core of my development habit as I learn

This tries to help get rid of the tedium of setting up automated testing

Docker is used to make screenshot tests reliable across different machines, e.g. the local dev environment and CI tests in the cloud

It probably won't help with enabling exact screen renderings across different CPU architectures though, from what I've read online, but I don't have experience to say that definitively

# Usage

This is tested in Linux. I have no idea if it may work in Windows

### Installation

This needs Docker installed so that there is access to `docker` and `docker compose`

### Setup

- Specify image and docker repository names for your app and test client in the `docker/.env` file, as indicated by the `docker/env_example` file
- Web app code goes in `app/` dir, and test client goes in `test/` dir. Maybe best to use submodules for those? Idk...
- Environment for your app is specified in `docker/Dockerfile.app`
- Environment for your test client is specified in `docker/Dockerfile.test`

#### Pre-mod
You'll want to delete the if statement in `.github/workflows/test.yml` to actually run the app test

#### Permissions
For the workflow to be able to make pull requests, you need to set permissions.

In your repository, go into `Settings` > `Actions` > `General`

There under `Workflow permissions` check the `Allow GitHub Actions to create and approve pull requests`

### Running

The shell scripts to run the app are in `bin` folder

- Run web app with `./bin/up_app` from repository root dir
  - Can use options to set entrypoint and command for web app container
  - Run `./bin/up_app -h` for usage
- In separate terminal run test client shell with `./bin/run_test`
  - This allows you to run `npm` commands there directly

