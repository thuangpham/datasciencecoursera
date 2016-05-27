install.packages(c('jsonlite','httpuv','httr'))
library(jsonlite)
library(httpuv)
library(httr)

oauth_endpoints("github")

w2Q <- oauth_app("github",
                   key = "d9243e73cbc55ddc6730",
                   secret = "25eea5330493b26fe45eba23eb0adbb445b0fecf")

github_token <- oauth2.0_token(oauth_endpoints("github"), w2Q)

gtoken <- config(token = github_token)