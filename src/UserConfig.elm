module UserConfig exposing (..)

import Colors exposing (fromHex)
import Duration exposing (Duration)
import Element exposing (Color)
import Env
import Quantity
import Time
import TimeExtra exposing (removeTrailing0s)


type alias UserConfig =
    { theme : Theme
    , texts : Texts
    }


type alias Theme =
    { defaultText : Color
    , mutedText : Color
    , error : Color
    , submit : Color
    , link : Color
    , errorBackground : Color
    , lightGrey : Color
    , grey : Color
    , textInputHeading : Color
    , darkGrey : Color
    , invertedText : Color
    , background : Color
    , heroSvg : String
    }


darkTheme : Theme
darkTheme =
    { defaultText = fromHex "#e8ecf1"
    , mutedText = fromHex "#c7ccd3"
    , error = fromHex "#f1484e"
    , submit = fromHex "#54c0ad"
    , link = fromHex "#5aaff5"
    , errorBackground = Element.rgb 0.349 0.2745 0.2745
    , lightGrey = fromHex "#4c4d4d"
    , grey = fromHex "#6e7072"
    , textInputHeading = fromHex "#8db8ef"
    , darkGrey = fromHex "#7e858d"
    , invertedText = fromHex "#151515"
    , background = fromHex "#252525"
    , heroSvg = "/homepage-hero-dark.svg"
    }


lightTheme : Theme
lightTheme =
    { defaultText = fromHex "#022047"
    , mutedText = fromHex "#4A5E7A"
    , error = fromHex "#F8777B"
    , submit = fromHex "#55CCB6"
    , link = fromHex "#509CDB"
    , errorBackground = Element.rgb 1 0.9059 0.9059
    , lightGrey = fromHex "#f4f6f8"
    , grey = fromHex "#E0E4E8"
    , textInputHeading = fromHex "#4A5E7A"
    , darkGrey = fromHex "#AEB7C4"
    , invertedText = fromHex "#FFF"
    , background = fromHex "#FFF"
    , heroSvg = "/homepage-hero.svg"
    }


default : UserConfig
default =
    { theme = lightTheme
    , texts = englishTexts
    }


type alias Texts =
    { aPlaceToJoinGroupsOfPeopleWithSharedInterests : String
    , aLoginEmailHasBeenSentTo : String
    , buttonOnAGroupPage : String
    , codeOfConduct : String
    , codeOfConduct1 : String
    , codeOfConduct2 : String
    , codeOfConduct3 : String
    , codeOfConduct4 : String
    , codeOfConduct5 : String
    , creatingOne : String
    , creditGoesTo : String
    , daysUntilEvent : Int -> String
    , dontBeAJerk : String
    , enterYourEmailAddress : String
    , eventCantBeMoreThan : String
    , eventDurationText : Bool -> String -> String -> String
    , faq : String
    , faq1 : String
    , faq2 : String
    , faq3 : String
    , faqQuestion1 : String
    , faqQuestion2 : String
    , faqQuestion3 : String
    , forHelpingMeOutWithPartsOfTheApp : String
    , frequentQuestions : String
    , goToHomepage : String
    , group1 : String
    , groupNotFound : String
    , hoursLong : String
    , inPersonEvent : String
    , invalidInput : String
    , invalidValueChooseAnIntegerLike5Or30OrLeaveItBlank : String
    , isItI : String
    , itsTakingPlaceAt : Bool -> String
    , login : String
    , logout : String
    , moderationHelpRequest : String
    , myGroups : String
    , newGroup : String
    , noGroupsYet : String
    , numberOfHours : String -> String
    , numberOfMinutes : String -> String
    , onlineAndInPersonEvent : String
    , onlineEvent : String
    , oopsSomethingWentWrongRenderingThisPage : String
    , or : String
    , privacy : String
    , privacyNotice : String
    , profile : String
    , readMore : String
    , search : String
    , searchForGroups : String
    , searchingForOne : String
    , theLinkYouUsedIsEitherInvalidOrHasExpired : String
    , theMostImportantRuleIs : String
    , thisEventDoesnTExist : String
    , title : String
    , tos : String
    , twoPeopleOnAVideoConference : String
    , userNotFound : String
    , valueMustBeGreaterThan0 : String
    , weDontSellYourDataWeDontShowAdsAndItsFree : String
    , welcomePage : String
    , youCanDoThatHere : String
    , youHavenTCreatedAnyGroupsYet : String
    , youNeedToAllowAtLeast2PeopleToJoinTheEvent : String
    , tosMarkdown : String -> String -> String
    , privacyMarkdown : String -> String
    , checkYourSpamFolderIfYouDonTSeeIt : String
    , signInAndWeLlGetYouSignedUpForThe : String -> String
    , signInAndWeLlGetYouSignedUpForThatEvent : String
    , byContinuingYouAgreeToThe : String
    , terms : String
    , cancel : String
    , enterYourEmailFirst : String
    , invalidEmailAddress : String
    , imageEditor : String
    , uploadImage : String
    , yourEmailAddress : String
    , keepItBelowNCharacters : Int -> String
    , yourNameCantBeEmpty : String
    , yourName : String
    , belowNCharactersPlease : Int -> String
    , whatDoYouWantPeopleToKnowAboutYou : String
    , anAccountDeletionEmailHasBeenSentTo : String
    , pressTheLinkInItToConfirmDeletingYourAccount : String
    , ifYouDontSeeTheEmailCheckYourSpamFolder : String
    , deleteAccount : String
    , saving : String
    , searchResultsFor : String
    , addressTooShort : Int -> Int -> String
    , addressTooLong : Int -> Int -> String
    , invalidUrlLong : String
    , nameMustBeAtLeast : Int -> String
    , nameMustBeAtMost : Int -> String
    , groupName : String
    , reset : String
    , save : String
    , edit : String
    , stopNotifyingMeOfNewEvents : String
    , organizer : String
    , notifyMeOfNewEvents : String
    , subscribedGroups : String
    , groupDescription : String
    , description : String
    , ongoingEvent : String
    , futureEvents : String
    , showFirst : String
    , showAll : String
    , addEvent : String
    , noNewEventsHaveBeenPlannedYet : String
    , pastEvents : String
    , info : String
    , thisGroupWasCreatedOn : String
    , makeGroupUnlisted : String
    , makeGroupPublic : String
    , deleteGroup : String
    , dateValueMissing : String
    , timeValueMissing : String
    , theEventCanTStartInThePast : String
    , invalidTimeFormatExpectedSomethingLike_22_59 : String
    , invalidDateFormatExpectedSomethingLike_2020_01_31 : String
    , noOnePlansOnAttending : String
    , onePersonIsAttendingItSYou : String
    , onePersonIsAttending : String
    , theEventIsTakingPlaceNowAt : String
    , noOneAttended : String
    , onePersonAttendedItWasYou : String
    , onePersonAttended : String
    , just_1AnonymousAttendee : String
    , andOneNanonymousNattendee : String
    , hideU_00A0Attendees : String
    , showU_00A0Attendees : String
    , endsIn : String
    , beginsIn : String
    , ended : String
    , onePersonPlansOnAttendingItSYou : String
    , onePersonPlansOnAttending : String
    , theEventWillTakePlaceAt : String
    , thisEventWasCancelled : String
    , editEvent : String
    , failedToLeaveEvent : String
    , failedToJoinThisEventDoesnTExistTryRefreshingThePage : String
    , failedToJoinEventThereArenTAnySpotsLeft : String
    , leaveEvent : String
    , joinEvent : String
    , eventName : String
    , eventDescriptionOptional : String
    , thisEventWillBeOnline : String
    , thisEventWillBeInPerson : String
    , thisEventWillBeOnlineAndInPerson : String
    , linkThatWillBeShownWhenTheEventStartsOptional : String
    , meetingAddressOptional : String
    , whenDoesItStart : String
    , theStartTimeCanTBeChangedSinceTheEventHasAlreadyStarted : String
    , howManyHoursLongIsIt : String
    , howManyPeopleCanJoinLeaveThisEmptyIfThereSNoLimit : String
    , saveChanges : String
    , cancelChanges : String
    , eventCanTStartInThePast : String
    , eventOverlapsOtherEvents : String
    , youCanTEditEventsThatHaveAlreadyHappened : String
    , youCanTEditTheStartTimeOfAnEventThatIsOngoing : String
    , thisEventSomehowDoesnTExistTryRefreshingThePage : String
    , uncancelEvent : String
    , recancelEvent : String
    , cancelEvent : String
    , newEvent : String
    , copyPreviousEvent : String
    , chooseWhatTypeOfEventThisIs : String
    , createEvent : String
    , eventsCanTStartInThePast : String
    , eventOverlapsWithAnotherEvent : String
    , thisGroupHasTooManyEvents : String
    , peopleAreAttending : Int -> Bool -> String
    , peopleAttended : Int -> Bool -> String
    , timeDiffToString : Time.Posix -> Time.Posix -> String
    , nextEventIsIn : String
    , justNanonymousNattendees : Int -> String
    , andNanonymousNattendees : Int -> String
    , createGroup : String
    , whatSTheNameOfYourGroup : String
    , describeWhatYourGroupIsAboutYouCanFillOutThisLater : String
    , iWantThisGroupToBeUnlistedPeopleCanOnlyFindItIfYouLinkItToThem : String
    , iWantThisGroupToBePubliclyVisible : String
    , pickAVisibilitySetting : String
    , sinceThisIsYourFirstGroupWeRecommendYouReadThe : String
    , submit : String
    , sorryThatGroupNameIsAlreadyBeingUsed : String
    , loading : String
    , descriptionTooLong : Int -> Int -> String
    }


englishTexts : Texts
englishTexts =
    { aPlaceToJoinGroupsOfPeopleWithSharedInterests = "A place to join groups of people with shared interests"
    , descriptionTooLong =
        \descriptionLength maxLength ->
            "Description is "
                ++ String.fromInt descriptionLength
                ++ " characters long. Keep it under "
                ++ String.fromInt maxLength
                ++ "."
    , loading = "Loading"
    , sorryThatGroupNameIsAlreadyBeingUsed = "Sorry, that group name is already being used."
    , whatSTheNameOfYourGroup = "What's the name of your group?"
    , describeWhatYourGroupIsAboutYouCanFillOutThisLater = "Describe what your group is about (you can fill out this later)"
    , iWantThisGroupToBeUnlistedPeopleCanOnlyFindItIfYouLinkItToThem = "I want this group to be unlisted (people can only find it if you link it to them)"
    , iWantThisGroupToBePubliclyVisible = "I want this group to be publicly visible"
    , pickAVisibilitySetting = "Pick a visibility setting"
    , sinceThisIsYourFirstGroupWeRecommendYouReadThe = "Since this is your first group, we recommend you read the "
    , submit = "Submit"
    , createGroup = "Create group"
    , justNanonymousNattendees =
        \attendeeCount ->
            if attendeeCount == 1 then
                "• Just one anonymous attendee"

            else
                "• Just "
                    ++ String.fromInt attendeeCount
                    ++ " anonymous attendees"
    , andNanonymousNattendees =
        \attendeeCount ->
            if attendeeCount == 1 then
                "And one\nanonymous\nattendee"

            else
                "And "
                    ++ String.fromInt attendeeCount
                    ++ "\nanonymous\nattendees"
    , nextEventIsIn = "Next event is in "
    , peopleAreAttending =
        \attendeeCount isAttending ->
            if attendeeCount == 1 then
                if isAttending then
                    "• One person is attending (including you)"

                else
                    "• One person is attending"

            else
                "• "
                    ++ String.fromInt attendeeCount
                    ++ " people are attending"
                    ++ (if isAttending then
                            " (including you)"

                        else
                            ""
                       )
    , peopleAttended =
        \attendeeCount isAttending ->
            if attendeeCount == 1 then
                if isAttending then
                    "• One person attended (including you)"

                else
                    "• One person attended"

            else
                "• "
                    ++ String.fromInt attendeeCount
                    ++ " people attended"
                    ++ (if isAttending then
                            " (including you)"

                        else
                            ""
                       )
    , noOnePlansOnAttending = "• No one plans on attending"
    , onePersonIsAttendingItSYou = "• One person is attending (it's you)"
    , onePersonIsAttending = "• One person is attending"
    , theEventIsTakingPlaceNowAt = "• The event is taking place now at "
    , noOneAttended = "• No one attended 💔"
    , onePersonAttendedItWasYou = "• One person attended (it was you)"
    , onePersonAttended = "• One person attended"
    , just_1AnonymousAttendee = "• Just 1 anonymous attendee"
    , andOneNanonymousNattendee = "And one\nanonymous\nattendee"
    , hideU_00A0Attendees = "(Hide\u{00A0}attendees)"
    , showU_00A0Attendees = "(Show\u{00A0}attendees)"
    , endsIn = "Ends in "
    , beginsIn = "Begins in "
    , ended = "Ended "
    , onePersonPlansOnAttendingItSYou = "• One person plans on attending (it's you)"
    , onePersonPlansOnAttending = "• One person plans on attending"
    , theEventWillTakePlaceAt = "• The event will take place at "
    , thisEventWasCancelled = "This event was cancelled "
    , editEvent = "Edit event"
    , failedToLeaveEvent = "Failed to leave event"
    , failedToJoinThisEventDoesnTExistTryRefreshingThePage = "Failed to join, this event doesn't exist (try refreshing the page?)"
    , failedToJoinEventThereArenTAnySpotsLeft = "Failed to join event, there aren't any spots left."
    , leaveEvent = "Leave event"
    , joinEvent = "Join event"
    , eventName = "Event name"
    , eventDescriptionOptional = "Event description (optional)"
    , thisEventWillBeOnline = "This event will be online"
    , thisEventWillBeInPerson = "This event will be in person"
    , thisEventWillBeOnlineAndInPerson = "This event will be online and in person"
    , linkThatWillBeShownWhenTheEventStartsOptional = "Link that will be shown when the event starts (optional)"
    , meetingAddressOptional = "Meeting address (optional)"
    , whenDoesItStart = "When does it start?"
    , theStartTimeCanTBeChangedSinceTheEventHasAlreadyStarted = "The start time can't be changed since the event has already started."
    , howManyHoursLongIsIt = "How many hours long is it?"
    , howManyPeopleCanJoinLeaveThisEmptyIfThereSNoLimit = "How many people can join (leave this empty if there's no limit)"
    , saveChanges = "Save changes"
    , cancelChanges = "Cancel changes"
    , eventCanTStartInThePast = "Event can't start in the past"
    , eventOverlapsOtherEvents = "Event overlaps other events"
    , youCanTEditEventsThatHaveAlreadyHappened = "You can't edit events that have already happened"
    , youCanTEditTheStartTimeOfAnEventThatIsOngoing = "You can't edit the start time of an event that is ongoing"
    , thisEventSomehowDoesnTExistTryRefreshingThePage = "This event somehow doesn't exist. Try refreshing the page?"
    , uncancelEvent = "Uncancel event"
    , recancelEvent = "Recancel event"
    , cancelEvent = "Cancel event"
    , newEvent = "New event"
    , copyPreviousEvent = "Copy previous event"
    , chooseWhatTypeOfEventThisIs = "Choose what type of event this is"
    , createEvent = "Create event"
    , eventsCanTStartInThePast = "Events can't start in the past"
    , eventOverlapsWithAnotherEvent = "Event overlaps with another event"
    , thisGroupHasTooManyEvents = "This group has too many events"
    , checkYourSpamFolderIfYouDonTSeeIt = "Check your spam folder if you don't see it."
    , nameMustBeAtLeast = \number -> "Name must be at least " ++ String.fromInt number ++ " characters long."
    , groupName = "Group name"
    , description = "Description"
    , ongoingEvent = "Ongoing event"
    , futureEvents = "Future events"
    , dateValueMissing = "Date value missing"
    , timeValueMissing = "Time value missing"
    , theEventCanTStartInThePast = "The event can't start in the past"
    , invalidTimeFormatExpectedSomethingLike_22_59 = "Invalid time format. Expected something like 22:59"
    , invalidDateFormatExpectedSomethingLike_2020_01_31 = "Invalid date format. Expected something like 2020-01-31"
    , showFirst = "Show first"
    , showAll = "Show all"
    , addEvent = "Add event"
    , noNewEventsHaveBeenPlannedYet = "No new events have been planned yet."
    , pastEvents = "Past events"
    , info = "Info"
    , thisGroupWasCreatedOn = "This group was created on "
    , makeGroupUnlisted = "Make group unlisted"
    , makeGroupPublic = "Make group public"
    , deleteGroup = "Delete group"
    , notifyMeOfNewEvents = "Notify me of new events"
    , groupDescription = "Group description"
    , subscribedGroups = "Subscribed groups"
    , edit = "Edit"
    , organizer = "Organizer"
    , nameMustBeAtMost = \number -> "Name is too long. Keep it under " ++ String.fromInt number ++ " characters."
    , signInAndWeLlGetYouSignedUpForThatEvent = "Sign in and we'll get you signed up for that event"
    , stopNotifyingMeOfNewEvents = "Stop notifying me of new events"
    , reset = "Reset"
    , save = "Save"
    , ifYouDontSeeTheEmailCheckYourSpamFolder = "If you don't see the email, check your spam folder."
    , addressTooShort = \length minLength -> "Address is " ++ String.fromInt length ++ " characters long. It needs to be at least " ++ String.fromInt minLength ++ "."
    , invalidUrlLong = "Invalid url. Enter something like https://my-hangouts.com or leave it blank"
    , addressTooLong = \length maxLength -> "Address is " ++ String.fromInt length ++ " characters long. Keep it under " ++ String.fromInt maxLength ++ "."
    , saving = "Saving..."
    , searchResultsFor = "Search results for "
    , anAccountDeletionEmailHasBeenSentTo = "An account deletion email has been sent to "
    , belowNCharactersPlease = \n -> "Below " ++ String.fromInt n ++ " characters please"
    , terms = "Terms"
    , pressTheLinkInItToConfirmDeletingYourAccount = ". Press the link in it to confirm deleting your account."
    , yourName = "Your name"
    , keepItBelowNCharacters = \n -> "Keep it below " ++ String.fromInt n ++ " characters"
    , whatDoYouWantPeopleToKnowAboutYou = "What do you want people to know about you?"
    , deleteAccount = "Delete account"
    , yourEmailAddress = "Your email address"
    , enterYourEmailFirst = "Enter your email first"
    , invalidEmailAddress = "Invalid email address"
    , imageEditor = "Image editor"
    , uploadImage = "Upload image"
    , cancel = "Cancel"
    , yourNameCantBeEmpty = "Your name can't be empty"
    , aLoginEmailHasBeenSentTo = "A login email has been sent to "
    , signInAndWeLlGetYouSignedUpForThe = \eventName -> "Sign in and we'll get you signed up for the " ++ eventName ++ " event."
    , buttonOnAGroupPage = "You haven't subscribed to any groups yet. You can do that by pressing the \""
    , byContinuingYouAgreeToThe = "By continuing, you agree to the "
    , codeOfConduct = "Code of Conduct"
    , codeOfConduct1 = "Here is some guidance in order to fulfill the \"don't be a jerk\" rule:"
    , codeOfConduct2 = "• Respect people regardless of their race, gender, sexual identity, nationality, appearance, or related characteristics."
    , codeOfConduct3 = "• Be respectful to the group organizers. They put in the time to coordinate an event and they are willing to invite strangers. Don't betray their trust in you!"
    , codeOfConduct4 = "• To group organizers: Make people feel included. It's hard for people to participate if they feel like an outsider."
    , codeOfConduct5 = "• If someone is being a jerk that is not an excuse to be a jerk back. Ask them to stop, and if that doesn't work, avoid them and explain the problem here "
    , creatingOne = "creating one"
    , creditGoesTo = ". Credit goes to "
    , daysUntilEvent = \days -> "Days until event: " ++ String.fromInt days
    , dontBeAJerk = "don't be a jerk"
    , enterYourEmailAddress = "Enter your email address"
    , eventCantBeMoreThan = "The event can't be more than "
    , eventDurationText =
        \isPastEvent durationText eventTypeText ->
            if isPastEvent then
                "• This was a " ++ durationText ++ " long " ++ eventTypeText ++ "."

            else
                "• This is a " ++ durationText ++ " long " ++ eventTypeText ++ "."
    , faq = "FaQ"
    , faq1 = "I dislike that meetup.com charges money, spams me with emails, and feels bloated. Also I wanted to try making something more substantial using "
    , faq2 = " to see if it's feasible to use at work."
    , faq3 = "I just spend my own money to host it. That's okay because it's designed to cost very little to run. In the unlikely event that Meetdown gets very popular and hosting costs become too expensive, I'll ask for donations."
    , faqQuestion1 = "Who is behind all this?"
    , faqQuestion2 = "Why was this website made?"
    , faqQuestion3 = "If this website is free and doesn't run ads or sell data, how does it sustain itself?"
    , forHelpingMeOutWithPartsOfTheApp = " for helping me out with parts of the app."
    , frequentQuestions = "Frequently asked questions"
    , goToHomepage = "Go to homepage"
    , group1 = "\" button on a group page."
    , groupNotFound = "Group not found"
    , hoursLong = " hours long."
    , inPersonEvent = "in-person event 🤝"
    , invalidInput = "Invalid input. Write something like 1 or 2.5"
    , invalidValueChooseAnIntegerLike5Or30OrLeaveItBlank = "Invalid value. Choose an integer like 5 or 30, or leave it blank."
    , isItI = "It is I, "
    , itsTakingPlaceAt =
        \isPastEvent ->
            if isPastEvent then
                "• It took place at "

            else
                "• It's taking place at "
    , login = "Sign up / Login"
    , logout = "Logout"
    , moderationHelpRequest = "Moderation help request"
    , myGroups = "My groups"
    , newGroup = "New group"
    , noGroupsYet = "You don't have any groups. Get started by "
    , numberOfHours =
        \nbHours ->
            if nbHours == "1" then
                "1\u{00A0}hour"

            else
                nbHours ++ "\u{00A0}hours"
    , numberOfMinutes =
        \nbMinutes ->
            if nbMinutes == "1" then
                "1\u{00A0}minute"

            else
                nbMinutes ++ "\u{00A0}minutes"
    , onlineAndInPersonEvent = "online and in-person event 🤝💻"
    , onlineEvent = "online event 💻"
    , oopsSomethingWentWrongRenderingThisPage = "Oops! Something went wrong rendering this page: "
    , or = " or "
    , privacy = "Privacy"
    , privacyMarkdown = privacyMarkdownEnglish
    , privacyNotice = "Privacy notice"
    , profile = "Profile"
    , readMore = "Read more"
    , search = "Search"
    , searchForGroups = "Search for groups"
    , searchingForOne = "subscribing to one."
    , theLinkYouUsedIsEitherInvalidOrHasExpired = "The link you used is either invalid or has expired."
    , theMostImportantRuleIs = "The most important rule is"
    , thisEventDoesnTExist = "This event doesn't exist."
    , title = "Event"
    , tos = "Terms of Service"
    , tosMarkdown = tosMarkdownEnglish
    , twoPeopleOnAVideoConference = "Two people on a video conference"
    , userNotFound = "User not found"
    , valueMustBeGreaterThan0 = "Value must be greater than 0."
    , weDontSellYourDataWeDontShowAdsAndItsFree = "We don't sell your data, we don't show ads, and it's free."
    , welcomePage = "Welcome to the event!"
    , youCanDoThatHere = "You can do that here."
    , youHavenTCreatedAnyGroupsYet = "You haven't created any groups yet. "
    , youNeedToAllowAtLeast2PeopleToJoinTheEvent = "You need to allow at least 2 people to join the event."
    , timeDiffToString = diffToStringEnglish
    }


frenchTexts : Texts
frenchTexts =
    { aPlaceToJoinGroupsOfPeopleWithSharedInterests = "Un endroit pour rejoindre des groupes de personnes partageant des centres d'intérêt"
    , descriptionTooLong =
        \descriptionLength maxLength ->
            "La description est de "
                ++ String.fromInt descriptionLength
                ++ " caractères. Limitez-la à "
                ++ String.fromInt maxLength
                ++ "."
    , sorryThatGroupNameIsAlreadyBeingUsed = "Désolé, ce nom de groupe est déjà utilisé."
    , whatSTheNameOfYourGroup = "Quel est le nom de votre groupe?"
    , describeWhatYourGroupIsAboutYouCanFillOutThisLater = "Décrivez la nature de votre groupe (vous pouvez remplir cette partie plus tard)."
    , iWantThisGroupToBeUnlistedPeopleCanOnlyFindItIfYouLinkItToThem = "Je veux que ce groupe soit non listé (les gens ne peuvent le trouver que si vous leur en donnez le lien)"
    , iWantThisGroupToBePubliclyVisible = "Je veux que ce groupe soit visible publiquement"
    , loading = "Chargement"
    , pickAVisibilitySetting = "Choisissez un paramètre de visibilité"
    , sinceThisIsYourFirstGroupWeRecommendYouReadThe = "Comme c'est votre premier groupe, nous vous recommandons de lire les "
    , submit = "Soumettre"
    , createGroup = "Créer un groupe"
    , andNanonymousNattendees =
        \attendeeCount ->
            if attendeeCount == 1 then
                "et un participant anonyme"

            else
                "et " ++ String.fromInt attendeeCount ++ " participants anonymes"
    , justNanonymousNattendees =
        \attendeeCount ->
            if attendeeCount == 1 then
                "Un participant anonyme"

            else
                String.fromInt attendeeCount ++ " participants anonymes"
    , nextEventIsIn = "Le prochain événement est dans "
    , timeDiffToString = diffToStringFrench
    , peopleAreAttending =
        \attendeeCount isAttending ->
            if attendeeCount == 1 then
                if isAttending then
                    "• Vous êtes le seul participant"

                else
                    "• Une personne participe"

            else if isAttending then
                "• Vous et " ++ String.fromInt (attendeeCount - 1) ++ " autres personnes participez"

            else
                "• " ++ String.fromInt attendeeCount ++ " personnes participent"
    , peopleAttended =
        \attendeeCount isAttending ->
            if attendeeCount == 1 then
                if isAttending then
                    "• Vous avez été le seul participant"

                else
                    "• Une personne a participé"

            else if isAttending then
                "• Vous et " ++ String.fromInt (attendeeCount - 1) ++ " autres personnes avez participé"

            else
                "• " ++ String.fromInt attendeeCount ++ " personnes ont participé"
    , noOnePlansOnAttending = "• Personne ne compte y assister"
    , onePersonIsAttendingItSYou = "• Une personne y assistera (c'est vous)"
    , onePersonIsAttending = "• Une personne y assistera"
    , theEventIsTakingPlaceNowAt = "• L'événement a lieu maintenant à "
    , noOneAttended = "• Personne n'y est allé 💔"
    , onePersonAttendedItWasYou = "• Une personne y est allé (c'était vous)"
    , onePersonAttended = "• Une personne y est allé"
    , just_1AnonymousAttendee = "• Juste 1 participant anonyme"
    , andOneNanonymousNattendee = "Et un\nparticipant\nanonyme"
    , hideU_00A0Attendees = "(Cacher\u{00A0}les participants)"
    , showU_00A0Attendees = "(Afficher\u{00A0}les participants)"
    , endsIn = "Se termine dans "
    , beginsIn = "Commence dans "
    , ended = "Terminé "
    , onePersonPlansOnAttendingItSYou = "• Une personne compte y assister (c'est vous)"
    , onePersonPlansOnAttending = "• Une personne compte y assister"
    , theEventWillTakePlaceAt = "• L'événement aura lieu à "
    , thisEventWasCancelled = "Cet événement a été annulé "
    , editEvent = "Modifier l'événement"
    , failedToLeaveEvent = "Impossible de quitter l'événement"
    , failedToJoinThisEventDoesnTExistTryRefreshingThePage = "Impossible de rejoindre, cet événement n'existe pas (essayez de rafraîchir la page ?)"
    , failedToJoinEventThereArenTAnySpotsLeft = "Impossible de rejoindre l'événement, il n'y a plus de place."
    , leaveEvent = "Quitter l'événement"
    , joinEvent = "Rejoindre l'événement"
    , eventName = "Nom de l'événement"
    , eventDescriptionOptional = "Description de l'événement (optionnel)"
    , thisEventWillBeOnline = "Cet événement sera en ligne"
    , thisEventWillBeInPerson = "Cet événement sera en personne"
    , thisEventWillBeOnlineAndInPerson = "Cet événement sera en ligne et en personne"
    , linkThatWillBeShownWhenTheEventStartsOptional = "Lien qui sera affiché lorsque l'événement commencera (optionnel)"
    , meetingAddressOptional = "Adresse de rencontre (optionnel)"
    , whenDoesItStart = "Quand commence-t-il ?"
    , theStartTimeCanTBeChangedSinceTheEventHasAlreadyStarted = "L'heure de début ne peut pas être modifiée car l'événement a déjà commencé."
    , howManyHoursLongIsIt = "Combien d'heures dure-t-il ?"
    , howManyPeopleCanJoinLeaveThisEmptyIfThereSNoLimit = "Combien de personnes peuvent rejoindre (laissez vide s'il n'y a pas de limite)"
    , saveChanges = "Enregistrer les modifications"
    , cancelChanges = "Annuler les modifications"
    , eventCanTStartInThePast = "L'événement ne peut pas commencer dans le passé"
    , eventOverlapsOtherEvents = "L'événement chevauche d'autres événements"
    , youCanTEditEventsThatHaveAlreadyHappened = "Vous ne pouvez pas modifier des événements qui ont déjà eu lieu"
    , youCanTEditTheStartTimeOfAnEventThatIsOngoing = "Vous ne pouvez pas modifier l'heure de début d'un événement qui est en cours"
    , thisEventSomehowDoesnTExistTryRefreshingThePage = "Cet événement n'existe pas (essayez de rafraîchir la page ?)"
    , uncancelEvent = "Annuler l'annulation de l'événement"
    , recancelEvent = "Réannuler l'événement"
    , cancelEvent = "Annuler l'événement"
    , newEvent = "Nouvel événement"
    , copyPreviousEvent = "Copier l'événement précédent"
    , chooseWhatTypeOfEventThisIs = "Choisissez quel type d'événement c'est"
    , createEvent = "Créer l'événement"
    , eventsCanTStartInThePast = "Les événements ne peuvent pas commencer dans le passé"
    , eventOverlapsWithAnotherEvent = "L'événement chevauche un autre événement"
    , thisGroupHasTooManyEvents = "Ce groupe a trop d'événements"
    , checkYourSpamFolderIfYouDonTSeeIt = "Vérifiez votre dossier spam si vous ne le voyez pas."
    , aLoginEmailHasBeenSentTo = "Un email de connexion a été envoyé à "
    , addressTooLong = \length maxLength -> "L'adresse est de " ++ String.fromInt length ++ " caractères. Restez en dessous de " ++ String.fromInt maxLength ++ "."
    , stopNotifyingMeOfNewEvents = "Ne plus me notifier des nouveaux événements"
    , subscribedGroups = "Groupes auxquels je suis abonné"
    , reset = "Réinitialiser"
    , groupDescription = "Description du groupe"
    , description = "Description"
    , nameMustBeAtLeast = \minLength -> "Le nom doit contenir au moins " ++ String.fromInt minLength ++ " caractères."
    , notifyMeOfNewEvents = "Me notifier des nouveaux événements"
    , organizer = "Organisateur"
    , nameMustBeAtMost = \maxLength -> "Le nom doit contenir au plus " ++ String.fromInt maxLength ++ " caractères."
    , dateValueMissing = "Date manquante"
    , timeValueMissing = "Heure manquante"
    , theEventCanTStartInThePast = "L'événement ne peut pas commencer dans le passé"
    , invalidTimeFormatExpectedSomethingLike_22_59 = "Format d'heure invalide. Attendu quelque chose comme 22:59"
    , invalidDateFormatExpectedSomethingLike_2020_01_31 = "Format de date invalide. Attendu quelque chose comme 2020-01-31"
    , save = "Enregistrer"
    , addressTooShort = \length minLength -> "L'adresse est de " ++ String.fromInt length ++ " caractères. Elle doit en contenir au moins " ++ String.fromInt minLength ++ "."
    , signInAndWeLlGetYouSignedUpForThatEvent = "Connectez-vous et nous vous inscrirons pour cet événement"
    , edit = "Modifier"
    , ongoingEvent = "Événement en cours"
    , futureEvents = "Événements futurs"
    , showFirst = "Afficher les premiers"
    , showAll = "Afficher tout"
    , addEvent = "Ajouter un événement"
    , noNewEventsHaveBeenPlannedYet = "Aucun nouvel événement n'a été planifié pour le moment."
    , pastEvents = "Événements passés"
    , info = "Info"
    , thisGroupWasCreatedOn = "Ce groupe a été créé le "
    , makeGroupUnlisted = "Rendre le groupe non listé"
    , makeGroupPublic = "Rendre le groupe public"
    , deleteGroup = "Supprimer le groupe"
    , terms = "conditions"
    , saving = "Enregistrement..."
    , searchResultsFor = "Résultats de recherche pour "
    , keepItBelowNCharacters = \n -> "Restez en dessous de " ++ String.fromInt n ++ " caractères"
    , groupName = "Nom du groupe"
    , yourEmailAddress = "Votre adresse email"
    , enterYourEmailFirst = "Entrez votre email d'abord"
    , anAccountDeletionEmailHasBeenSentTo = "Un email de suppression de compte a été envoyé à "
    , ifYouDontSeeTheEmailCheckYourSpamFolder = "Si vous ne le voyez pas, vérifiez votre dossier spam."
    , pressTheLinkInItToConfirmDeletingYourAccount = "Appuyez sur le lien pour confirmer la suppression de votre compte."
    , whatDoYouWantPeopleToKnowAboutYou = "Que voulez-vous que les gens sachent de vous ?"
    , yourName = "Votre nom"
    , invalidEmailAddress = "Adresse email invalide"
    , invalidUrlLong = "URL invalide. Entrez quelque chose comme https://my-hangouts.com ou laissez-le vide"
    , deleteAccount = "Supprimer le compte"
    , imageEditor = "Editeur d'image"
    , uploadImage = "Télécharger une image"
    , cancel = "Annuler"
    , signInAndWeLlGetYouSignedUpForThe = \eventName -> "Connectez-vous et nous vous inscrirons pour l'événement \"" ++ eventName ++ "\""
    , buttonOnAGroupPage = "Vous n'êtes pas encore abonné à un groupe. Vous pouvez le faire en appuyant sur le \""
    , belowNCharactersPlease = \n -> "En dessous de " ++ String.fromInt n ++ " caractères, s'il vous plaît"
    , byContinuingYouAgreeToThe = "En continuant, vous acceptez les "
    , codeOfConduct = "Code de conduite"
    , codeOfConduct1 = "Voici quelques conseils pour respecter la règle \"ne sois pas un.e imbécile\":"
    , codeOfConduct2 = "• Respecte les personnes indépendamment de leur race, de leur sexe, de leur identité sexuelle, de leur nationalité, de leur apparence ou de toute autre caractéristique connexe."
    , yourNameCantBeEmpty = "Votre nom ne peut pas être vide"
    , codeOfConduct3 = "• Sois respectueux envers les organisateurs de groupes. Ils consacrent du temps à coordonner un événement et ils sont prêts à inviter des gens qu'ils ne connaissent pas. Ne trahis pas leur confiance en toi!"
    , codeOfConduct4 = "• Pour les organisateurs de groupes: Faites en sorte que les gens se sentent inclus. Il est difficile pour les gens de participer si ils se sentent comme des étrangers."
    , codeOfConduct5 = "• Si quelqu'un est un imbécile, ce n'est pas une excuse pour être un imbécile en retour. Demande-leur de s'arrêter, et si cela ne fonctionne pas, évite-les et explique le problème ici "
    , creatingOne = "en créer un"
    , creditGoesTo = ". Merci à "
    , daysUntilEvent = \days -> "Jours jusqu'à l'événement: " ++ String.fromInt days
    , dontBeAJerk = "ne sois pas un.e imbécile"
    , enterYourEmailAddress = "Entrez votre adresse email"
    , eventCantBeMoreThan = "L'événement ne peut pas durer plus de "
    , eventDurationText =
        \isPastEvent durationText eventTypeText ->
            if isPastEvent then
                "• C'était un " ++ eventTypeText ++ " de " ++ durationText ++ "."

            else
                "• C'est un " ++ eventTypeText ++ " de " ++ durationText ++ "."
    , faq = "FAQ"
    , faq1 = "Je n'aime pas que meetup.com soit payant, m'envoie des emails de spam et soit trop lourd. J'ai aussi voulu essayer de faire quelque chose de plus substantiel en utilisant "
    , faq2 = " pour voir si c'est faisable de l'utiliser au travail."
    , faq3 = "Je dépense mon propre argent pour l'héberger. C'est ok car il est conçu pour coûter très peu à faire tourner. Dans le cas improbable où Meetdown deviendrait très populaire et que les coûts d'hébergement deviennent trop élevés, je demanderai des dons."
    , faqQuestion1 = "Qui est derrière tout ça ?"
    , faqQuestion2 = "Pourquoi avoir créé ce site web ?"
    , faqQuestion3 = "Si ce site web est gratuit et ne vend pas vos données, comment fait-il pour se financer ?"
    , forHelpingMeOutWithPartsOfTheApp = " pour m'avoir aidé avec certaines parties de l'application."
    , frequentQuestions = "Questions fréquentes"
    , goToHomepage = "Aller à la page d'accueil"
    , group1 = "\" bouton sur une page de groupe."
    , groupNotFound = "Groupe introuvable"
    , hoursLong = " heures."
    , inPersonEvent = "événement en personne 🤝"
    , invalidInput = "Entrée invalide. Écrivez quelque chose comme 1 ou 2.5"
    , invalidValueChooseAnIntegerLike5Or30OrLeaveItBlank = "Valeur invalide. Choisissez un entier comme 5 ou 30, ou laissez-le vide."
    , isItI = "C'est moi, "
    , itsTakingPlaceAt =
        \isPastEvent ->
            if isPastEvent then
                "• C'était à "

            else
                "• C'est à "
    , login = "S'inscrire / Se connecter"
    , logout = "Déconnexion"
    , moderationHelpRequest = "Demande d'aide pour la modération"
    , myGroups = "Mes groupes"
    , newGroup = "Nouveau groupe"
    , noGroupsYet = "Vous n'avez pas encore de groupes. Commencez par "
    , numberOfHours =
        \nbHours ->
            if nbHours == "1" then
                "1\u{00A0}heure"

            else
                nbHours ++ "\u{00A0}heures"
    , numberOfMinutes =
        \nbMinutes ->
            if nbMinutes == "1" then
                "1\u{00A0}minute"

            else
                nbMinutes ++ "\u{00A0}minutes"
    , onlineAndInPersonEvent = "événement en ligne et en personne 🤝💻"
    , onlineEvent = "événement en ligne 💻"
    , oopsSomethingWentWrongRenderingThisPage = "Oups, quelque chose s'est mal passé lors du rendu de cette page."
    , or = " ou "
    , privacy = "Confidentialité"
    , privacyMarkdown = privacyMarkdownFrench
    , privacyNotice = "Notice de confidentialité"
    , profile = "Profil"
    , readMore = "En savoir plus"
    , search = "Rechercher"
    , searchForGroups = "Rechercher des groupes"
    , searchingForOne = "vous abonner à un groupe."
    , theLinkYouUsedIsEitherInvalidOrHasExpired = "Le lien que vous avez utilisé est invalide ou a expiré."
    , theMostImportantRuleIs = "La règle la plus importante est"
    , thisEventDoesnTExist = "Cet événement n'existe pas."
    , title = "Événement"
    , tos = "Conditions d'utilisation"
    , tosMarkdown = tosMarkdownFrench
    , twoPeopleOnAVideoConference = "Deux personnes sur une vidéoconférence"
    , userNotFound = "Utilisateur introuvable"
    , valueMustBeGreaterThan0 = "La valeur doit être supérieure à 0."
    , weDontSellYourDataWeDontShowAdsAndItsFree = "Nous ne vendons pas vos données, nous ne montrons pas de publicités et c'est gratuit."
    , welcomePage = "Bienvenue à l'événement!"
    , youCanDoThatHere = "Vous pouvez le faire ici."
    , youHavenTCreatedAnyGroupsYet = "Vous n'avez pas encore créé de groupes. "
    , youNeedToAllowAtLeast2PeopleToJoinTheEvent = "Vous devez autoriser au moins 2 personnes à rejoindre l'événement."
    }


tosMarkdownEnglish : String -> String -> String
tosMarkdownEnglish privacyRoute codeOfConductRoute =
    """

#### Version 1.0 – June 2021

### 🤔 What is Meetdown

These legal terms are between you and meetdown.app (“we”, “our”, “us”, “Meetdown”, the software”) and you agree to them by using the Meetdown service.

You should read this document along with our [Data Privacy Notice](""" ++ privacyRoute ++ """).


### 💬 How to contact us

Please chat with us by emailing us at [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """)

We'll contact you in English 🇬🇧 and Emoji 😃.


### 🤝🏽 Guarantees and expectations

Meetdown makes no guarantees.

The [source code for Meetdown](https://github.com/MartinSStewart/meetdown) is open source so technical users may make their own assessment of risk.

The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement.

In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

We expect all users to behave according to the [Code of conduct](""" ++ codeOfConductRoute ++ """).


### 💵 Cost

Meetdown is a free product.


### 😔 How to make a complaint

If you have a complaint, please contact us and we'll do our best to fix the problem.

Please see "How to contact us" above.


### 📝 Making changes to this agreement

This agreement will always be available on meetdown.app.

If we make changes to it, we'll tell you once we've made them.

If you don't agree to these changes, you can close your account by pressing "Delete Account" on your profile page.

We'll destroy any data in your account, unless we need to keep it for a reason outlined in our [Privacy policy](""" ++ privacyRoute ++ """).


### 😭 Closing your account

To close your account, you can press the "Delete Account" button on your profile page.

We can close your account by giving you at least one weeks' notice.

We may close your account immediately if we believe you've:

- Broken the terms of this agreement
- Put us in a position where we might break the law
- Broken the law or attempted to break the law
- Given us false information at any time
- Been abusive to anyone at Meetdown or a member of our community

"""


tosMarkdownFrench : String -> String -> String
tosMarkdownFrench privacyRoute codeOfConductRoute =
    """

#### Version 1.0 – Juin 2021

### 🤔 Qu'est-ce que Meetdown

Ces conditions légales sont entre vous et meetdown.app (« nous », « notre », « Meetdown », le logiciel) et vous acceptez ces conditions en utilisant le service Meetdown.

Vous devriez lire ce document en même temps que notre [Notice de confidentialité](""" ++ privacyRoute ++ """).

### 💬 Comment nous contacter

Veuillez nous contacter par email à [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """)

Nous vous contacterons en anglais 🇬🇧 et en Emoji 😃.


### 🤝🏽 Garanties et attentes

Meetdown ne fait aucune garantie.

Le [code source de Meetdown](https://github.com/MartinSStewart/meetdown) est open source donc les utilisateurs techniques peuvent faire leur propre évaluation du risque.

Le logiciel est fourni "tel quel", sans aucune garantie, expresse ou implicite, y compris mais sans s'y limiter les garanties de qualité marchande, d'adaptation à un usage particulier et d'absence de contrefaçon.

Nous attendons de tous les utilisateurs qu'ils se comportent conformément au [Code de conduite](""" ++ codeOfConductRoute ++ """).


### 💵 Coût

Meetdown est un produit gratuit.


### 😔 Comment faire une réclamation

Si vous avez une réclamation, veuillez nous contacter et nous ferons de notre mieux pour résoudre le problème.

Veuillez consulter "Comment nous contacter" ci-dessus.


### 📝 Modifications de cet accord

Cet accord sera toujours disponible sur meetdown.app.

Si nous apportons des modifications, nous vous en informerons une fois que nous les aurons apportées.

Si vous n'êtes pas d'accord avec ces modifications, vous pouvez fermer votre compte en appuyant sur "Supprimer le compte" sur votre page de profil.

Nous détruirons toutes les données de votre compte, sauf si nous devons les conserver pour une raison exposée dans notre [Politique de confidentialité](""" ++ privacyRoute ++ """).

### 😭 Fermer votre compte

Pour fermer votre compte, vous pouvez appuyer sur le bouton "Supprimer le compte" sur votre page de profil.

Nous pouvons fermer votre compte en vous donnant au moins une semaine d'avance.

Nous pouvons fermer votre compte immédiatement si nous pensons que vous avez :

- Violé les conditions de cet accord
- Mis notre position dans laquelle nous pourrions enfreindre la loi
- Enfreint la loi ou tenté de l'enfreindre
- Fourni des informations fausses à tout moment
- Été abusif envers quiconque chez Meetdown ou un membre de notre communauté

"""


privacyMarkdownEnglish : String -> String
privacyMarkdownEnglish termsOfServiceRoute =
    """

#### Version 1.0 – June 2021

We’re committed to protecting and respecting your privacy. If you have any questions about your personal information please chat with us by emailing us at [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """).


### 👀 The information we hold about you

#### - Cookie information

We use a single persistent secured httpOnly session cookie to recognise your browser and keep you logged in.

Other cookies may be introduced in the future, and if so our Privacy policy will be updated at that time.


#### - Information submitted through our service or website

- For example, when you sign up to the service and provide details such as your name and email

There may be times when you give us ‘sensitive’ information, which includes things like your racial origin, political opinions, religious beliefs, trade union membership details or biometric data. We’ll only use this information in strict accordance with the law.


### 🔍 How we use your information

To provide our services, we use it to:

- Help us manage your account
- Send you reminders for events you've joined

To meet our legal obligations, we use it to:

- Prevent illegal activities like piracy and fraud

With your permission, we use it to:

- Market and communicate our products and services where we think these will be of interest to you by email. You can always unsubscribe from receiving these if you want to by email.


### 🤝 Who we share it with

We may share your personal information with:

- Anyone who works for us when they need it to do their job.
- Anyone who you give us explicit permission to share it with.

We’ll also share it to comply with the law; to enforce our [Terms of service](""" ++ termsOfServiceRoute ++ """) or other agreements; or to protect the rights, property or safety of us, our users or others.

### 📁 How long we keep it

We keep your data as long as you’re using Meetdown, and for 1 year after that to comply with the law. In some circumstances, like cases of fraud, we may keep data longer if we need to and/or the law says we have to.

### ✅ Your rights

You have a right to:

- Access the personal data we hold about you, or to get a copy of it.
- Make us correct inaccurate data.
- Ask us to delete, 'block' or suppress your data, though for legal reasons we might not always be able to do it.
- Object to us using your data for direct marketing and in certain circumstances ‘legitimate interests’, research and statistical reasons.
- Withdraw any consent you’ve previously given us.

To do so, please contact us by emailing [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """).


### 🔒 Where we store or send your data

We might transfer and store the data we collect from you somewhere outside the European Economic Area (‘EEA’). People who work for us or our suppliers outside the EEA might also process your data.

We may share data with organisations and countries that:

- The European Commission say have adequate data protection, or
- We’ve agreed standard data protection clauses with.


### 😔 How to make a complaint

If you have a complaint, please contact us by emailing [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """) and we’ll do our best to fix the problem.


### 📝 Changes to this policy

We’ll post any changes we make to our privacy notice on this page and, if they’re significant changes we’ll let you know by email.

"""


privacyMarkdownFrench : String -> String
privacyMarkdownFrench termsOfServiceRoute =
    """
#### Version 1.0 – Juin 2021

Nous nous engageons à protéger et à respecter votre vie privée. Si vous avez des questions sur vos informations personnelles, veuillez nous contacter par e-mail à [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """).

### 👀 Les informations que nous détenons sur vous

#### - Informations sur les cookies

Nous utilisons un seul cookie de session persistant sécurisé httpOnly pour reconnaître votre navigateur et vous garder connecté.

D'autres cookies peuvent être introduits à l'avenir, et si c'est le cas, notre politique de confidentialité sera mise à jour à ce moment-là.


#### - Informations soumises à travers notre service ou notre site web

- Par exemple, lorsque vous vous inscrivez au service et fournissez des détails tels que votre nom et votre adresse e-mail

Il peut arriver que vous nous donniez des informations «sensibles», qui comprennent des choses comme votre origine raciale, vos opinions politiques, vos croyances religieuses, vos détails d'adhésion à un syndicat ou vos données biométriques. Nous n'utiliserons ces informations que dans le strict respect de la loi.


### 🔍 Comment nous utilisons vos informations

Pour fournir nos services, nous les utilisons pour:

- Nous aider à gérer votre compte

- Vous envoyer des rappels pour les événements auxquels vous avez participé

Pour répondre à nos obligations légales, nous les utilisons pour:

- Prévenir les activités illégales telles que la piraterie et la fraude

Avec votre permission, nous les utilisons pour:

- Faire la promotion et communiquer nos produits et services où nous pensons que cela vous intéressera par e-mail. Vous pouvez toujours vous désabonner de la réception de ces e-mails si vous le souhaitez.


### 🤝 Qui nous les partageons

Nous pouvons partager vos informations personnelles avec:

- Toute personne qui travaille pour nous lorsque elle en a besoin pour faire son travail.
- Toute personne à laquelle vous nous donnez une autorisation explicite de partager vos informations.

Nous partagerons également vos informations pour nous conformer à la loi; pour faire respecter nos [Conditions d'utilisation](""" ++ termsOfServiceRoute ++ """) ou d'autres accords; ou pour protéger les droits, la propriété ou la sécurité de nous, de nos utilisateurs ou d'autres.

### 📁 Combien de temps nous les conservons

Nous conservons vos données aussi longtemps que vous utilisez Meetdown, et pendant 1 an après cela pour nous conformer à la loi. Dans certains cas, comme les cas de fraude, nous pouvons conserver les données plus longtemps si nous en avons besoin et / ou que la loi nous y oblige.

### ✅ Vos droits

Vous avez le droit de:

- Accéder aux données personnelles que nous détenons sur vous, ou d'en obtenir une copie.
- Nous demander de corriger des données inexactes.
- Nous demander de supprimer, de bloquer ou de supprimer vos données, bien que pour des raisons légales, nous ne puissions pas toujours le faire.
- Vous opposer à l'utilisation de vos données à des fins de marketing direct et dans certaines circonstances, à des fins de recherche et de statistiques.
- Retirer votre consentement que nous vous avons précédemment donné.

Pour ce faire, veuillez nous contacter par e-mail à [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """).

### 🔒 Où nous stockons ou envoyons vos données

Nous pouvons transférer et stocker les données que nous collectons auprès de vous quelque part en dehors de l'Union européenne («UE»). Les personnes qui travaillent pour nous ou nos fournisseurs en dehors de l'UE peuvent également traiter vos données.

Nous pouvons partager des données avec des organisations et des pays qui:

- La Commission européenne dit avoir une protection des données adéquate, ou
- Nous avons conclu des clauses-types de protection des données avec.


### 😔 Comment faire une réclamation

Si vous avez une réclamation, veuillez nous contacter par e-mail à [""" ++ Env.contactEmailAddress ++ """](mailto:""" ++ Env.contactEmailAddress ++ """) et nous ferons de notre mieux pour résoudre le problème.

### 📝 Modifications de cette politique

Nous publierons toute modification que nous apportons à notre avis de confidentialité sur cette page et, si elles sont des modifications importantes, nous vous en informerons par e-mail.

"""


diffToStringEnglish : Time.Posix -> Time.Posix -> String
diffToStringEnglish start end =
    let
        difference : Duration
        difference =
            Duration.from start end |> Quantity.abs

        months =
            Duration.inDays difference / 30 |> floor

        weeks =
            Duration.inWeeks difference |> floor

        days =
            Duration.inDays difference |> round

        hours =
            Duration.inHours difference |> floor

        minutes =
            Duration.inMinutes difference |> round

        suffix =
            if Time.posixToMillis start <= Time.posixToMillis end then
                ""

            else
                " ago"
    in
    if months >= 2 then
        String.fromInt months ++ "\u{00A0}months" ++ suffix

    else if weeks >= 2 then
        String.fromInt weeks ++ "\u{00A0}weeks" ++ suffix

    else if days > 1 then
        String.fromInt days ++ "\u{00A0}days" ++ suffix

    else if hours > 22 then
        if Time.posixToMillis start <= Time.posixToMillis end then
            "1\u{00A0}day"

        else
            "yesterday"

    else if hours > 6 then
        String.fromInt hours ++ "\u{00A0}hours" ++ suffix

    else if Duration.inHours difference >= 1.2 then
        removeTrailing0s 1 (Duration.inHours difference) ++ "\u{00A0}hours" ++ suffix

    else if minutes > 1 then
        String.fromInt minutes ++ "\u{00A0}minutes" ++ suffix

    else if minutes == 1 then
        "1\u{00A0}minute" ++ suffix

    else
        "now"


diffToStringFrench : Time.Posix -> Time.Posix -> String
diffToStringFrench start end =
    let
        difference : Duration
        difference =
            Duration.from start end |> Quantity.abs

        months =
            Duration.inDays difference / 30 |> floor

        weeks =
            Duration.inWeeks difference |> floor

        days =
            Duration.inDays difference |> round

        hours =
            Duration.inHours difference |> floor

        minutes =
            Duration.inMinutes difference |> round

        suffix =
            if Time.posixToMillis start <= Time.posixToMillis end then
                ""

            else
                " ago"
    in
    if months >= 2 then
        String.fromInt months ++ "\u{00A0}mois" ++ suffix

    else if weeks >= 2 then
        String.fromInt weeks ++ "\u{00A0}semaines" ++ suffix

    else if days > 1 then
        String.fromInt days ++ "\u{00A0}jours" ++ suffix

    else if hours > 22 then
        if Time.posixToMillis start <= Time.posixToMillis end then
            "1\u{00A0}jour"

        else
            "hier"

    else if hours > 6 then
        String.fromInt hours ++ "\u{00A0}heures" ++ suffix

    else if Duration.inHours difference >= 1.2 then
        removeTrailing0s 1 (Duration.inHours difference) ++ "\u{00A0}heures" ++ suffix

    else if minutes > 1 then
        String.fromInt minutes ++ "\u{00A0}minutes" ++ suffix

    else if minutes == 1 then
        "1\u{00A0}minute" ++ suffix

    else
        "maintenant"
