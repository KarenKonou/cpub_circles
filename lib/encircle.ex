defmodule CommonsPub.Circles.Encircle do
  @moduledoc """
  """

  use Pointers.Pointable,
    otp_app: :cpub_circles,
    table_id: "1NSERTSAP01NTER1NT0AC1RC1E",
    source: "cpub_circles_encircle"

  alias CommonsPub.Circles.{Circle, Encircle}
  alias Pointers.{Changesets, Pointer}

  pointable_schema do
    belongs_to :subject, Pointer
    belongs_to :circle, Circle
  end

  def changeset(encircle \\ %Encircle{}, attrs, opts \\ []),
    do: Changesets.auto(encircle, attrs, opts, [])

end
defmodule CommonsPub.Circles.Encircle.Migration do

  use Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Circles.{Circle, Encircle}

  def create_encircle_table() do
      create_pointable_table(Encircle) do
        add :circle_id,
          strong_pointer(Circle),
          null: false
        add :subject_id,
          strong_pointer(),
          null: false
    end
  end

  def create_encircle_subject_index(opts \\ []) do
    create_if_not_exists index("cpub_circles_encircle", [:subject_id], opts)
  end

  def create_encircle_unique_index(opts \\ []) do
    create_if_not_exists unique_index("cpub_circles_encircle", [:circle_id, :subject_id], opts)
  end

  def migrate_encircle(dir \\ direction())
  def migrate_encircle(:up) do
    create_encircle_table()
    create_encircle_unique_index()
    create_encircle_subject_index()
  end

  def migrate_encircle(:down) do
    drop_if_exists index(Encircle, [:subject_id])
    drop_if_exists unique_index(Encircle, [:circle_id, :subject_id])
    drop_pointable_table(Encircle)
  end

end
