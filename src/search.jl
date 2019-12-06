using StackOverflow, HTTP

function searcherror(intitle::String)
    data = replace(intitle, " " => "%20")
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=$(data)&site=stackoverflow")
    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    if key == "title" || key == "link"
                        println("$(key) $(value)")
                    end
                end
                println("\n")
            end
        end
    end
end
