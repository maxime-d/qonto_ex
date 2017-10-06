defmodule QontoEx do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://thirdparty.qonto.eu/v1"
  plug Tesla.Middleware.Headers, %{ "User-Agent" => "QontoEx " <> QontoEx.Mixfile.project[:version] }
  plug Tesla.Middleware.Headers, %{ "Content-Type" => "application/json" }
  plug Tesla.Middleware.JSON

  def slug, do: Application.get_env :qonto_ex, :slug
  def secret_key, do: Application.get_env :qonto_ex, :secret_key

  def client do
    Tesla.build_client([
      { Tesla.Middleware.Headers, %{ "Authorization" => slug <> ":" <> secret_key } }
    ])
  end

  def organization do
    get(client, "/organizations/" <> slug)
  end

  def transactions(params) do
    get(
      client, "/transactions",
      query: [slug: slug, iban: params[:iban], current_page: params[:current_page] || 1]
    )
  end
end
