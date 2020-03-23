#' OAuth Providers
#' 
#' @export 
FirebaseOauthProviders <- R6::R6Class(
  "FirebaseOauthProviders",
  inherit = Firebase,
  public = list(
#' @details Define provider to use
#' @param provider The provider to user, e.g.: \code{microsoft.com}, \code{yahoo.com} or \code{google.com}.
    set_provider = function(provider){
      if(missing(provider))
        stop("Missing provider", call. = FALSE)

      super$send("set-oauth-provider", list(id = super$unique_id, provider = provider))

      private$.provider <- provider
      invisible(self)
    },
#' @details Launch sign in with Google.
#' @param flow Authentication flow, either popup or redirect.
    launch = function(flow = c("popup", "redirect")){
      private$launch_oauth(match.arg(flow))
      invisible(self)
    }
  ),
  private = list(
    .provider = NULL,
    launch_oauth = function(flow = c("popup", "redirect")){
      call <- paste0("oauth-sign-in-", flow)
      super$send(call, list(id = super$unique_id))
    }
  )
)