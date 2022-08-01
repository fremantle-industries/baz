defmodule Baz.CollectionEvents do
  alias Baz.Repo
  alias Baz.CollectionEvents.CollectionEvent
  alias Baz.CollectionEvents.Queries

  @type where_opt :: {:where, [{atom, term}]}
  @type order_opt :: {:order, [atom]}
  @type collection_event :: CollectionEvent.t()

  @type filter_and_order_opts :: [where_opt | order_opt]
  @spec filter_and_order(filter_and_order_opts) :: [collection_event]
  def filter_and_order(opts) do
    opts
    |> Queries.FilterAndOrder.new()
    |> Repo.all()
  end

  @doc """
  Gets a single collection_event.

  Raises `Ecto.NoResultsError` if the CollectionEvent does not exist.

  ## Examples

      iex> get_collection_event!("open_sea")
      %CollectionEvent{}

      iex> get_collection_event!("open_zea")
      ** (Ecto.NoResultsError)

  """
  @spec get_collection_event!(non_neg_integer) :: collection_event
  def get_collection_event!(id), do: Repo.get_by!(CollectionEvent, id: id)

  @spec collection_event_changeset(map) :: Ecto.Changeset.t() | {:error, term}
  def collection_event_changeset(attrs) do
    CollectionEvent.changeset(%CollectionEvent{}, attrs)
  end
end