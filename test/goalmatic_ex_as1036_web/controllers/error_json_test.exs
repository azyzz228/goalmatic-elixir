defmodule GoalmaticExAs1036Web.ErrorJSONTest do
  use GoalmaticExAs1036Web.ConnCase, async: true

  test "renders 404" do
    assert GoalmaticExAs1036Web.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert GoalmaticExAs1036Web.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
