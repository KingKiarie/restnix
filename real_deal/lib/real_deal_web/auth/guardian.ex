defmodule RealDealWeb.Auth.Guardian do
  use Guardian, otp_app: :real_deal
  alias RealDeal.Accounts

  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  def subject_for_token(_, _) do
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub"=> id}) do
    case Accounts.get_account!(id) do
      nil -> {:error, :not_found}
      resource ->{:ok, resource}
    end
  end

  def resource_from_claims(_) do
    {:error, :no_id_provided}
  end

  def authenticate(email, password)do
    case Accounts.get_account_by_email(email) do
      nil -> {:error, :unauthored}
      account ->
        case validate_password(password, account.hash_password) do
          true -> create_token(account)
            false -> {:error, :unauthorised}

        end
    end
  end

  defp validate_password(password, hash_password)do
  Bcrypt.verify_pass(password, hash_password)
  end


  defp create_token(account)do
    {:ok, token, _claims} = encode_and_sign(account)
    {:ok, account, token}
  end

end
