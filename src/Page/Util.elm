module Page.Util exposing (jumpToBottomOfId, resetViewport)
import Types exposing (Msg(..))
import Task exposing (Task)
import Browser.Dom as Dom



--  doesnt work fml
-- Scroll to bottom of div with given ID
-- https://package.elm-lang.org/packages/elm/browser/latest/Browser-Dom#setViewportOf
jumpToBottomOfId : String -> Cmd Msg
jumpToBottomOfId id =
    Dom.getViewportOf id
        |> Task.andThen (\info -> Dom.setViewportOf id 10 info.scene.height)
        |> Task.attempt (\_ -> NoOp)


-- Scroll to top of viewport 
-- https://package.elm-lang.org/packages/elm/browser/latest/Browser-Dom#setViewport
resetViewport : Cmd Msg
resetViewport =
    Task.perform (\_ -> NoOp) (Dom.setViewport 0 0)