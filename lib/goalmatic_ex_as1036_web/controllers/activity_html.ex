defmodule GoalmaticExAs1036Web.ActivityHTML do
  use GoalmaticExAs1036Web, :html

  embed_templates "activity_html/*"

  @doc """
  Renders a activity form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def activity_form(assigns)
end
