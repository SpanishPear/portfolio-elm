module Post.Posts exposing (posts)
import Types exposing (Content)


fetchMarkdown : String -> String
fetchMarkdown a = a

helloWorld : Content
helloWorld = 
    {
    title = "Hello world!"
    ,name="Hello world!"
    ,slug="/hello-world"
    ,markdown = fetchMarkdown "hello-world.md"
    ,intro = "testing this shit works"
    }

posts : List Content
posts = [helloWorld]