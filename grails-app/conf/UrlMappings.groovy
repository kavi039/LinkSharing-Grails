class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"home/index")
        "/"( controller: "home" ,action:"index")
        "500"(view:'/errorPage500')
        "404"(view:'/errorPage404')
	}
}
