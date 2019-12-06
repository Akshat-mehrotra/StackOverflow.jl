module StackOverflow

using HTTP
using CodecZlib
using JSON

include("questions.jl")
export
    getrecentquestionsfortag

include("privileges.jl")
export
    checkmyprivileges,
    getprivileges

include("utils.jl")
export
    convert_HTTP_Response_To_JSON

include("answers.jl")
export
    getquestions

include("badges.jl")
export 
    getrecentbadgerecipients

include("siteinfo.jl")
export 
    getsiteinfo

end # module
