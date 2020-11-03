defmodule Discuss.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  @doc """
  From docs: Schema Attributes are supported attributes for configuring the defined schema.
  They must be set after the use Ecto.Schema call and before the schema/2 definition.

  - @primary_key
  - @schema_prefix
  - @foreign_key_type
  - @timestamps_opts
  - @derive
  - @field_source_mapper

  """
  schema "topics" do
    field :title, :string
  end



  @doc """
  Changeset function vs Changeset object
  struct: original record in DB (may not exist yet)
  attrs: a hash table that contains the new properties we want to replace the struct with.
  cast: produces the changeset, tells us how we want to update the database.
  validators: a series of validators applied to the changeset that decides whether the changeset is valid or not.
  """

  @spec changeset(Discuss.Topic, map) :: (Discuss.Topic)
  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end

end
