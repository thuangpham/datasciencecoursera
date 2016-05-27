library(httr)
library(jsonlite)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
ThuanGPhamTest <- oauth_app("github",
                   key = "149473e80fa8db2b57a5",
                   secret = "9ead6717b30f502799e7457d6780c6d2eb4395f0")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), ThuanGPhamTest)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
ob = jsonlite::fromJSON(toJSON(content(req)))
js2<-ob[ob$full_name=="jtleek/datasharing",]
js2$created_at


