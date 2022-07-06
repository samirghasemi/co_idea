defmodule CoIdea.Accounts.Guardian do
    use Guardian, otp_app: :co_idea
  
    alias CoIdea.Accounts

    def subject_for_token(user, _claims) do
      sub = to_string(user.id)
      {:ok, sub}
    end


    def resource_from_claims(claims) do
      id = claims["sub"]
      resource = Accounts.get_user_all!(id)
      {:ok,  resource}
    end

  end