FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN mkdir assets

COPY assets/package.json assets
COPY assets/package-lock.json assets

COPY lib lib

COPY config config

COPY debug debug

COPY priv priv

COPY .env .env

CMD mix deps.get && cd assets && npm install && cd .. && mix ecto.migrate && mix phx.server
