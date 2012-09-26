# (old) SSL secure.wm host
# https://secure.wikimedia.org | http://en.wikipedia.org/wiki/Wikipedia:Secure_server
class misc::secure {
	system_role { "misc::secure": description => "secure.wikimedia.org" }

	apache_module { rewrite: module => "rewrite" }
	apache_module { proxy: module => "proxy" }
	apache_module { proxy_http: module => "proxy_http" }

	apache_site { secure: name => "secure.wikimedia.org" }
}
