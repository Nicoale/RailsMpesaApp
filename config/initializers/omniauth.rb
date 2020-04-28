Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "135405742578-caohfjbe4hrogijd8ebp3v1ta14l3khb.apps.googleusercontent.com", "5kN497shlYClgzcUjFZhfzrN"
  end