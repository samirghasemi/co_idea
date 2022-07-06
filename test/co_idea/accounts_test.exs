defmodule CoIdea.AccountsTest do
  use CoIdea.DataCase

  alias CoIdea.Accounts

  describe "users" do
    alias CoIdea.Accounts.User

    import CoIdea.AccountsFixtures

    @invalid_attrs %{fname: nil, name: nil, national_code: nil, student_code: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{fname: "some fname", name: "some name", national_code: "some national_code", student_code: "some student_code"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.fname == "some fname"
      assert user.name == "some name"
      assert user.national_code == "some national_code"
      assert user.student_code == "some student_code"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{fname: "some updated fname", name: "some updated name", national_code: "some updated national_code", student_code: "some updated student_code"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.fname == "some updated fname"
      assert user.name == "some updated name"
      assert user.national_code == "some updated national_code"
      assert user.student_code == "some updated student_code"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "roles" do
    alias CoIdea.Accounts.Role

    import CoIdea.AccountsFixtures

    @invalid_attrs %{description: nil, role_number: nil, title: nil}

    test "list_roles/0 returns all roles" do
      role = role_fixture()
      assert Accounts.list_roles() == [role]
    end

    test "get_role!/1 returns the role with given id" do
      role = role_fixture()
      assert Accounts.get_role!(role.id) == role
    end

    test "create_role/1 with valid data creates a role" do
      valid_attrs = %{description: "some description", role_number: 42, title: "some title"}

      assert {:ok, %Role{} = role} = Accounts.create_role(valid_attrs)
      assert role.description == "some description"
      assert role.role_number == 42
      assert role.title == "some title"
    end

    test "create_role/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_role(@invalid_attrs)
    end

    test "update_role/2 with valid data updates the role" do
      role = role_fixture()
      update_attrs = %{description: "some updated description", role_number: 43, title: "some updated title"}

      assert {:ok, %Role{} = role} = Accounts.update_role(role, update_attrs)
      assert role.description == "some updated description"
      assert role.role_number == 43
      assert role.title == "some updated title"
    end

    test "update_role/2 with invalid data returns error changeset" do
      role = role_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_role(role, @invalid_attrs)
      assert role == Accounts.get_role!(role.id)
    end

    test "delete_role/1 deletes the role" do
      role = role_fixture()
      assert {:ok, %Role{}} = Accounts.delete_role(role)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_role!(role.id) end
    end

    test "change_role/1 returns a role changeset" do
      role = role_fixture()
      assert %Ecto.Changeset{} = Accounts.change_role(role)
    end
  end
end
