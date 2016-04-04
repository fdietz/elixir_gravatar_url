defmodule ElixirGravatarUrlTest do
  use ExUnit.Case

  @url "http://gravatar.com/avatar/"
  @secure_url "https://secure.gravatar.com/avatar/"

  @email "jose.valim@plataformatec.com"
  @email_hash "eea2e76fba938de4378e1ffa14a78257"

  @default_image_url "https://example.com/avatar.jpg"

  test "it generates url using secure url by default" do
    assert ElixirGravatarUrl.url(@email) == "#{@secure_url}#{@email_hash}"
  end

  test "it generates url using non secure option" do
    assert ElixirGravatarUrl.url(@email, secure: false) ==
      "#{@url}#{@email_hash}"
  end

  test "it generates url with query string option" do
    assert ElixirGravatarUrl.url(@email, s: 32, r: "g", d: 404) ==
      "#{@secure_url}#{@email_hash}?s=32&r=g&d=404"
  end

  test "it generates url with query string for default image" do
    assert ElixirGravatarUrl.url(@email, d: URI.encode(@default_image_url)) ==
      "#{@secure_url}#{@email_hash}?d=https%3A%2F%2Fexample.com%2Favatar.jpg"
  end

  test "it generates url and removes leading/trailing whitespace" do
    assert ElixirGravatarUrl.url(" #{@email}  ") ==
      "#{@secure_url}#{@email_hash}"
  end

  test "it raises Argument if no email given" do
    assert_raise(ArgumentError, fn ->
      ElixirGravatarUrl.url("test") == "#{@secure_url}#{@email_hash}"
    end)
  end
end
