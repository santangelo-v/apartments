# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /apartments-tmp
COPY . /apartments-tmp
WORKDIR /apartments-tmp


# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force

RUN mix local.rebar --force

# Get dependecies
RUN mix deps.get

# Compile the project
RUN mix do compile

CMD ["mix", "phx.server"]