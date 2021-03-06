using StackOverflow, HTTP 

"""
    getcomments(sort::string = "creation", order::string = "desc")

    Prints 30 top comments in descending(default)/ascending order of their creation_date(default)/votes on the site.
"""

function getcomments(sort::String = "creation", order::String = "desc")

    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/comments?order=$(order)&sort=$(sort)&site=stackoverflow")

    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)

    for (k, v) in json_obj 

        if occursin("items", k)
            for item in v 
                for (key, value) in item
                    println("$(key) : $(value)")
                end
                println("\n")
            end
        end

    end

end
