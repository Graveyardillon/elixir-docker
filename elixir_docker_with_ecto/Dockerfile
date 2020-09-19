FROM erlang:23

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.10.4" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/${ELIXIR_VERSION}.tar.gz" \
	&& ELIXIR_DOWNLOAD_SHA256="8518c78f43fe36315dbe0d623823c2c1b7a025c114f3f4adbb48e04ef63f1d9f" \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256  elixir-src.tar.gz" | sha256sum -c - \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean

WORKDIR /app

ENV NODE_VERSION 14.x

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash \
 && apt-get install -y nodejs

RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.1 --force

RUN npm install npm@latest -g

# Project setup
COPY mix.exs mix.exs
COPY mix.lock mix.lock
RUN mix deps.get && mix compile

COPY assets/package.json assets/package.json
COPY assets/package-lock.json assets/package-lock.json
RUN cd assets && npm install

EXPOSE 4000
COPY . .
