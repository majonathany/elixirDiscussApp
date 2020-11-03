# Discuss

To build from phoenix-alpine-elixir:
docker build --add-host discuss.local:127.0.0.1 --rm --no-cache --tag 0.0.0 -P --network "host" .


To start db docker file:
docker run -e POSTGRES_PASSWORD=Secure123 --network="host" -p 11000:5432 --privileged --name discuss_dev_db

To start phoenix docker:
docker run -e POSTGRES_PASSWORD="Secure123" --network="host" --add-host="discuss.local:127.0.0.1" -P 65459dba807f

Error: Connection refused: check credentials, check access to network through --network="host", ensure ports are exposed

----------------------------------------------------------
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
