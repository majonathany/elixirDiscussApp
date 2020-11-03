require IEx
import Ecto.Query, only: [from: 2, order_by: 3]

defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.{Topic, Repo}

  def index(conn, params) do
    query = from t in Discuss.Topic, order_by: t.id
    queries = Repo.all(query)
    render conn, "index.html", queries: queries
  end

  def show(conn, changeset) do
    render conn, "show.html", changeset: changeset

  end

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  # Repo is responsible for writing to database. Ecto provides changeset (event), and repo (mapper)
  def create(conn, changeset) do

    %{
      "topic" => %{
        "title" => input
      }
    } = changeset

    # Make a changeset from a blank changeset and a set of params
    changeset = Topic.changeset(%Topic{}, %{"title" => input})

    case Repo.insert(changeset) do
      {:ok, _topic} -> conn
                       |> put_flash(:info, "Topic Created")
                       |> redirect(to: Routes.topic_path(conn, :index))
      {:error, changeset} -> render conn, "new.html", changeset: changeset
    end
  end


  def edit(conn, params) do
    %{"id" => topic_id} = params
    topic = Repo.get Topic, topic_id

    #changeset is an entity that forms can use
    changeset = Topic.changeset topic

    #render form using changeset
    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, changeset) do
    %{"id" => topic_id, "topic" => topic} = changeset
    changeset = Repo.get(Topic, topic_id)
                |> Topic.changeset(topic)
    case Repo.update changeset do
      {:ok, _topic} -> conn
                       |> put_flash(:info, "Topic Updated")
                       |> redirect(to: Routes.topic_path(conn, :index))
      {:error, changeset} -> render conn, "edit.html", changeset: changeset
    end
  end

  def delete(conn, changeset) do
    %{"id" => topic_id} = changeset
    Repo.get!(Topic, topic_id) |> Repo.delete!

    conn
      |> put_flash(:info, "Topic Deleted")
      |> redirect(to: Routes.topic_path(conn, :index))
  end
end