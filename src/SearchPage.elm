module SearchPage exposing (getGroupsFromIds, view)

import AssocList as Dict
import Colors
import Description
import Element exposing (Element)
import Element.Border
import Element.Font
import Group exposing (Group)
import GroupName
import Id exposing (GroupId)
import Route exposing (Route(..))
import Types exposing (FrontendMsg, GroupCache(..), LoadedFrontend)
import Ui


getGroupsFromIds : List GroupId -> LoadedFrontend -> List ( GroupId, Group )
getGroupsFromIds groups model =
    List.filterMap
        (\groupId ->
            Dict.get groupId model.cachedGroups
                |> Maybe.andThen
                    (\group ->
                        case group of
                            GroupFound groupFound ->
                                Just ( groupId, groupFound )

                            GroupNotFound ->
                                Nothing

                            GroupRequestPending ->
                                Nothing
                    )
        )
        groups


view : String -> LoadedFrontend -> Element FrontendMsg
view searchText model =
    Element.column
        [ Element.padding 8
        , Ui.contentWidth
        , Element.centerX
        , Element.spacing 8
        ]
        [ if searchText == "" then
            Element.paragraph [] [ Element.text <| "Search results for \" \"" ]

          else
            Element.paragraph [] [ Element.text <| "Search results for \"" ++ searchText ++ "\"" ]
        , Element.column
            [ Element.width Element.fill, Element.spacing 16 ]
            (getGroupsFromIds model.searchList model
                |> List.map (\( groupId, group ) -> groupView groupId group)
            )
        ]


groupView : GroupId -> Group -> Element msg
groupView groupId group =
    Element.link
        (Element.width Element.fill
            :: Ui.inputFocusClass
            :: Ui.cardAttributes
            ++ [ Element.Border.color Colors.darkGrey ]
        )
        { url = Route.encode (GroupRoute groupId (Group.name group))
        , label =
            Element.column
                [ Element.width Element.fill, Element.spacing 8 ]
                [ Group.name group
                    |> GroupName.toString
                    |> Element.text
                    |> List.singleton
                    |> Element.paragraph [ Element.Font.bold ]
                , Group.description group |> Description.toParagraph
                ]
        }