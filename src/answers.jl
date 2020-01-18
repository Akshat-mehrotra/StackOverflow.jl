using StackOverflow


"""
    getquestions(sort::string = "creation", order::String = "desc")

Prints and returns 30 most recent answers given a certain sort parameter.
"""
function getanswers(sort::String = "creation", order::String = "desc")
    r = HTTP.request("GET", "https://api.stackexchange.com/2.2/answers?order=$(order)&sort=$(sort)&site=stackoverflow")

    json_obj = StackOverflow.convert_HTTP_Response_To_JSON(r)
    answers = makeanswersarray(json_obj)
    for (k, v) in json_obj
        if occursin("items", k)
            for item in v
                for (key, value) in item
                    println("$(key): $(value)")
                end
                println("\n")
            end
        end
    end
    answers
end
