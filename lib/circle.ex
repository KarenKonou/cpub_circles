defmodule CommonsPub.Circles.Circle do
  @moduledoc """
  """

  use Pointers.Pointable,
    otp_app: :cpub_circles,
    table_id: "C1RC1ESAREAV1S1B111TYSC0PE",
    source: "cpub_circles_circle"

  alias CommonsPub.Circles.Circle
  alias Pointers.{Changesets, Pointer}

  pointable_schema do
  end

  def changeset(circle \\ %Circle{}, attrs, opts \\ []),
    do: Changesets.auto(circle, attrs, opts, [])

end
defmodule CommonsPub.Circles.Circle.Migration do

  use Ecto.Migration
  import Pointers.Migration
  alias CommonsPub.Circles.Circle

  defmacro __using__() do
    quote do
      require CommonsPub.Circles.Circle.Migration
      require Pointers.Migration
    end
  end

  defp create_circle_table() do
      create_pointable_table(Circle) do
      end
  end

  def migrate_circle(dir \\ direction())
  def migrate_circle(:up), do: create_circle_table()
  def migrate_circle(:down), do: drop_pointable_table(Circle)

end
