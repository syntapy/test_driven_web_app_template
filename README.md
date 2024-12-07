# Intro

Runs web app and automated browser test client in separate docker containers

Basically this sets up the boilerplate code for automated screenshot tests for a new app

Also provides github actions workflow template as well

## Motivation

Apparently for me, screenshot tests don't match locally with Github Actions. But I am also on a non-standard OS (Qubes OS) which runs linux using Xen hypervisor

So basically doing this for myself since I wanted to make it easy to start a new React project with reliable test driven functionality

Test driven development is nice and fun to have, and makes refactoring a breeze.
As such I want to make this the core of my development habit as I learn

But setting up automated tests for a web app seems kinda tedious, so this tries to help get rid of the tedium

The use of docker is to help make screenshot tests reliable across different machines, e.g. the local dev environment and CI tests in the cloud

It probably won't help with enabling exact screen renderings across different CPU architectures though, from what I've read online, but I don't have experience to say that definitively

# Usage

Disclaimer: I have no idea how this works on windows based system.
I use Linux command line for everything

## Installation

Make sure you have Docker installed so that you have access to `docker` and `docker compose`

## Setup

1. Specify image and docker repository names for your app and test client in a `.env` file, as indicated by the `env_example` file
  - The `.env` goes *in the `docker/` folder*, not the root
1. Your app code goes in `src/app` and test client goes in `src/test`. Maybe best to use submodules for those? Idk...
1. Environment for your app is specified in `docker/Dockerfile.app`
1. Environment for your test client is specified in `docker/Dockerfile.test`

## Running

I provide shell scripts to run the app in `bin` folder

Ultimately the app needs to be run using `docker compose up` instead of `docker compose run`.
Because otherwise I had issues with spinning up the test client on the same network.
Which I can't remember exactly what those were.

1. Run the app with `./bin/up_app` in one terminal
1. In separate terminal run test client shell with `./bin/run_test`
  - This allows you to run `npm` commands there directly
