defmodule ElixirGravatarUrl do
  @host "gravatar.com/avatar/"

  def url(email, opts \\ []) do
    {secure, opts} = Keyword.pop(opts, :secure, true)

    %URI{}
    |> base_url(secure)
    |> email_hash(email)
    |> query(opts)
    |> to_string
  end

  defp base_url(uri, true),  do: %URI{uri | scheme: "https", host: "secure.#{@host}"}
  defp base_url(uri, false), do: %URI{uri | scheme: "http", host: @host}

  # as described at https://en.gravatar.com/site/implement/hash/
  defp email_hash(uri, email) do
    unless String.contains?(email, "@") do
      raise ArgumentError, "Email must contain @"
    end

    # TODO: validate if contains @
    email = email |> String.strip |> String.downcase
    hash  = :crypto.hash(:md5, email) |> Base.encode16(case: :lower)
    %URI{uri | path: hash}
  end

  defp query(uri, []), do: %URI{uri | query: nil}
  defp query(uri, opts), do: %URI{uri | query: URI.encode_query(opts)}

end
