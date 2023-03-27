defmodule GoalmaticExAs1036Web.ChallengeControllerTest do
  use GoalmaticExAs1036Web.ConnCase

  import GoalmaticExAs1036.AchievementFixtures

  @create_attrs %{description: "some description", ends_at: ~U[2023-03-26 21:37:00Z], goal: 42, name: "some name", units: "some units"}
  @update_attrs %{description: "some updated description", ends_at: ~U[2023-03-27 21:37:00Z], goal: 43, name: "some updated name", units: "some updated units"}
  @invalid_attrs %{description: nil, ends_at: nil, goal: nil, name: nil, units: nil}

  describe "index" do
    test "lists all challenges", %{conn: conn} do
      conn = get(conn, ~p"/challenges")
      assert html_response(conn, 200) =~ "Listing Challenges"
    end
  end

  describe "new challenge" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/challenges/new")
      assert html_response(conn, 200) =~ "New Challenge"
    end
  end

  describe "create challenge" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/challenges", challenge: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/challenges/#{id}"

      conn = get(conn, ~p"/challenges/#{id}")
      assert html_response(conn, 200) =~ "Challenge #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/challenges", challenge: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Challenge"
    end
  end

  describe "edit challenge" do
    setup [:create_challenge]

    test "renders form for editing chosen challenge", %{conn: conn, challenge: challenge} do
      conn = get(conn, ~p"/challenges/#{challenge}/edit")
      assert html_response(conn, 200) =~ "Edit Challenge"
    end
  end

  describe "update challenge" do
    setup [:create_challenge]

    test "redirects when data is valid", %{conn: conn, challenge: challenge} do
      conn = put(conn, ~p"/challenges/#{challenge}", challenge: @update_attrs)
      assert redirected_to(conn) == ~p"/challenges/#{challenge}"

      conn = get(conn, ~p"/challenges/#{challenge}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, challenge: challenge} do
      conn = put(conn, ~p"/challenges/#{challenge}", challenge: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Challenge"
    end
  end

  describe "delete challenge" do
    setup [:create_challenge]

    test "deletes chosen challenge", %{conn: conn, challenge: challenge} do
      conn = delete(conn, ~p"/challenges/#{challenge}")
      assert redirected_to(conn) == ~p"/challenges"

      assert_error_sent 404, fn ->
        get(conn, ~p"/challenges/#{challenge}")
      end
    end
  end

  defp create_challenge(_) do
    challenge = challenge_fixture()
    %{challenge: challenge}
  end
end
