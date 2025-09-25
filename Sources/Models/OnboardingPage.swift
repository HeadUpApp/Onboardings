import Foundation

public struct OnboardingPage {
    public let id: Int
    public let title: String
    public let buttonTitle: String
    public let isLastPage: Bool
    
    public init(id: Int, title: String, buttonTitle: String, isLastPage: Bool = false) {
        self.id = id
        self.title = title
        self.buttonTitle = buttonTitle
        self.isLastPage = isLastPage
    }
}

public extension OnboardingPage {
    @MainActor static let pages: [OnboardingPage] = [
        OnboardingPage(
            id: 0,
            title: "We want to show\nyou something \nimportant..",
            buttonTitle: "What?"
        ),
        OnboardingPage(
            id: 1,
            title: "This is..",
            buttonTitle: "Okay"
        ),
        OnboardingPage(
            id: 2,
            title: "Welcome to\nthe third screen",
            buttonTitle: "Next"
        ),
        OnboardingPage(
            id: 3,
            title: "Fourth screen\nis here",
            buttonTitle: "Continue"
        ),
        OnboardingPage(
            id: 4,
            title: "Halfway through\nour journey",
            buttonTitle: "Go on"
        ),
        OnboardingPage(
            id: 5,
            title: "Sixth screen\nbrings more info",
            buttonTitle: "Next"
        ),
        OnboardingPage(
            id: 6,
            title: "Seventh screen\nis almost there",
            buttonTitle: "Continue"
        ),
        OnboardingPage(
            id: 7,
            title: "Eighth screen\nshows progress",
            buttonTitle: "Next"
        ),
        OnboardingPage(
            id: 8,
            title: "Ninth screen\nis nearly done",
            buttonTitle: "Almost there"
        ),
        OnboardingPage(
            id: 9,
            title: "Final screen\ncompletes the journey",
            buttonTitle: "Finish",
            isLastPage: true
        )
    ]
}
