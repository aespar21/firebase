% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-email-link.R
\name{FirebaseEmailLink}
\alias{FirebaseEmailLink}
\title{Email Link}
\description{
Sign in the user by emailing them a link.
}
\note{
Other methods to pick up whether user signs in still apply. This
is for added security measures.
}
\examples{
library(shiny)
library(firebase)

options(shiny.port = 3000) 

ui <- fluidPage(
  useFirebase(),
  textInput("email", "Your email"),
  actionButton("submit", "Submit")
)

server <- function(input, output){

  f <- FirebaseEmailLink$
    new()$
    config(url = "http://127.0.0.1:3000")

  observeEvent(input$submit, {
    if(input$email == "")
      return()
    
    f$send(input$email)
  })

  observeEvent(f$get_email_sent(), {
    sent <- f$get_email_sent()

    if(sent$success)
      showNotification("Email sent", type = "message")
  })

  observeEvent(f$get_email_verification(), {
    print(f$get_email_verification())
  })

}

\dontrun{shinyApp(ui, server)}


## ------------------------------------------------
## Method `FirebaseEmailLink$config`
## ------------------------------------------------

\dontrun{
f <- FirebaseEmailLink$
 new()$ # create
 config(url = "https://me.shinyapps.io/myApp/")
}

## ------------------------------------------------
## Method `FirebaseEmailLink$send`
## ------------------------------------------------

\dontrun{
f <- FirebaseEmailLink$
 new()$ # create
 config(url = "https://me.shinyapps.io/myApp/")$
 send("user@email.com")
}

}
\section{Super class}{
\code{\link[firebase:Firebase]{firebase::Firebase}} -> \code{FirebaseEmailLink}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{email_verification}}{Email verification results}

\item{\code{email_sent}}{Email send results}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-config}{\code{FirebaseEmailLink$config()}}
\item \href{#method-send}{\code{FirebaseEmailLink$send()}}
\item \href{#method-get_email_sent}{\code{FirebaseEmailLink$get_email_sent()}}
\item \href{#method-get_email_verification}{\code{FirebaseEmailLink$get_email_verification()}}
\item \href{#method-clone}{\code{FirebaseEmailLink$clone()}}
}
}
\if{html}{
\out{<details ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="delete_user">}\href{../../firebase/html/Firebase.html#method-delete_user}{\code{firebase::Firebase$delete_user()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="get_access_token">}\href{../../firebase/html/Firebase.html#method-get_access_token}{\code{firebase::Firebase$get_access_token()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="get_delete_user">}\href{../../firebase/html/Firebase.html#method-get_delete_user}{\code{firebase::Firebase$get_delete_user()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="get_sign_out">}\href{../../firebase/html/Firebase.html#method-get_sign_out}{\code{firebase::Firebase$get_sign_out()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="get_signed_in">}\href{../../firebase/html/Firebase.html#method-get_signed_in}{\code{firebase::Firebase$get_signed_in()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="get_signed_up">}\href{../../firebase/html/Firebase.html#method-get_signed_up}{\code{firebase::Firebase$get_signed_up()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="initialize">}\href{../../firebase/html/Firebase.html#method-initialize}{\code{firebase::Firebase$initialize()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="is_signed_in">}\href{../../firebase/html/Firebase.html#method-is_signed_in}{\code{firebase::Firebase$is_signed_in()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="print">}\href{../../firebase/html/Firebase.html#method-print}{\code{firebase::Firebase$print()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="req_sign_in">}\href{../../firebase/html/Firebase.html#method-req_sign_in}{\code{firebase::Firebase$req_sign_in()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="req_sign_out">}\href{../../firebase/html/Firebase.html#method-req_sign_out}{\code{firebase::Firebase$req_sign_out()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="set_language_code">}\href{../../firebase/html/Firebase.html#method-set_language_code}{\code{firebase::Firebase$set_language_code()}}\out{</span>}
\item \out{<span class="pkg-link" data-pkg="firebase" data-topic="Firebase" data-id="sign_out">}\href{../../firebase/html/Firebase.html#method-sign_out}{\code{firebase::Firebase$sign_out()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-config"></a>}}
\if{latex}{\out{\hypertarget{method-config}{}}}
\subsection{Method \code{config()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FirebaseEmailLink$config(url, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{url}}{The link is handled in the web action widgets,
this is the deep link in the continueUrl query parameter.
Likely, your shiny application link.}

\item{\code{...}}{Any other parameter from the
\href{https://firebase.google.com/docs/auth/web/passing-state-in-email-actions?authuser=0#passing_statecontinue_url_in_email_actions}{official documentation}.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Configure
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{
f <- FirebaseEmailLink$
 new()$ # create
 config(url = "https://me.shinyapps.io/myApp/")
}
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-send"></a>}}
\if{latex}{\out{\hypertarget{method-send}{}}}
\subsection{Method \code{send()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FirebaseEmailLink$send(email)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{email}}{Email to send verification to.}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Send email verification link.
}

\subsection{Returns}{
self
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{
f <- FirebaseEmailLink$
 new()$ # create
 config(url = "https://me.shinyapps.io/myApp/")$
 send("user@email.com")
}

}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_email_sent"></a>}}
\if{latex}{\out{\hypertarget{method-get_email_sent}{}}}
\subsection{Method \code{get_email_sent()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FirebaseEmailLink$get_email_sent()}\if{html}{\out{</div>}}
}

\subsection{Details}{
Get whether email verification was correctly sent.
}

\subsection{Returns}{
A list of length 2 containing \code{success} a boolean
indicating wherther sending the email was successful and \code{response}
containing the email used to sign in or the error if sending failed.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-get_email_verification"></a>}}
\if{latex}{\out{\hypertarget{method-get_email_verification}{}}}
\subsection{Method \code{get_email_verification()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FirebaseEmailLink$get_email_verification()}\if{html}{\out{</div>}}
}

\subsection{Details}{
Get whether user is signing in from email verification.
}

\subsection{Returns}{
A list of length 2 containing \code{success} a boolean
indicating wherther signing in from the verification link was successful and \code{response}
containing the result of the sign in or the error if signing in failed.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{FirebaseEmailLink$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
