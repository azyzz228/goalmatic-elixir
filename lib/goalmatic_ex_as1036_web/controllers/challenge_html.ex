defmodule GoalmaticExAs1036Web.ChallengeHTML do
  use GoalmaticExAs1036Web, :html

  embed_templates "challenge_html/*"

  @doc """
  Renders a challenge form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def challenge_form(assigns)
end
