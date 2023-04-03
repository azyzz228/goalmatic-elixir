defmodule GoalmaticExAs1036Web.ChallengeHTML do
  use GoalmaticExAs1036Web, :html

  embed_templates "challenge_html/*"

  @doc """
  Renders a challenge form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def challenge_form(assigns)


  attr :for, :any, required: true, doc: "Data structure for the form"
  attr  :rest, :global, include: ~w(autocomplete name rel action enctype mathod novalidate target),
  doc: "thhe arbitrary HTML attributes to apply to the form"
  attr :clear, :any, required: true, doc: "The route to remove the params and show the whole list"

  slot :inner_block
  def search_box(assigns) do
    ~H"""
    <div class="flex flex-row justify-center items-center space-x-4 w-full my-12">
          <.form :let={f} for={@for} {@rest} class="">
              <div class="flex flex-row justify-center items-center space-x-4">
                <.input field={f[:search_term]} placeholder={render_slot(@inner_block)} type="text" required class="" />
                <button type="submit" class="p-2.5 ml-2 text-sm font-medium text-white bg-indigo-700 rounded-lg border border-indigo-700 hover:bg-indigo-800 focus:ring-4 focus:outline-none focus:ring-indigo-300 dark:bg-indigo-600 dark:hover:bg-indigo-700 dark:focus:ring-indigo-800">
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                  <span class="sr-only">Search</span>
                </button>
            </div>
          </.form>

          <.link href={@clear} class="text-zinc-600 hover:text-zinc-800">
              <button class="">Clear</button>
          </.link>
    </div>
    """
  end
end
