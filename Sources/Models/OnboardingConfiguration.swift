import SwiftUI

// MARK: - Onboarding Screen Types
public enum OnboardingScreenType: CaseIterable, Identifiable, Sendable, Equatable {
    case start
    case second
    case third
    case fourth
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twelve
    case thirteen
    case fourteen
    case fifteen
    case sixteen
    case seventeen
    case eighteen
    case nineteen
    case twenty
    case twentyOne
    case twentyTwo
    case twentyThree
    case twentyFour
    case twentyFive
    case assignment
    case paywall
    case angry
    case loading
    case rateOurApp
    case reviewView
    case rewiring
    case rewriting
    case videoOnboarding
    case zvonochek
    case firstVideoView
    case thirdVideoView
    case secondVideoView
    case fourthVideoView
    
    public var id: String { rawValue }
    
    public var displayName: String {
        switch self {
        case .start: return "Start Screen"
        case .second: return "Second Screen"
        case .third: return "Third Screen"
        case .fourth: return "Fourth Screen"
        case .five: return "Fifth Screen"
        case .six: return "Sixth Screen"
        case .seven: return "Seventh Screen"
        case .eight: return "Eighth Screen"
        case .nine: return "Ninth Screen"
        case .ten: return "Tenth Screen"
        case .eleven: return "Eleventh Screen"
        case .twelve: return "Twelfth Screen"
        case .thirteen: return "Thirteenth Screen"
        case .fourteen: return "Fourteenth Screen"
        case .fifteen: return "Fifteenth Screen"
        case .sixteen: return "Sixteenth Screen"
        case .seventeen: return "Seventeenth Screen"
        case .eighteen: return "Eighteenth Screen"
        case .nineteen: return "Nineteenth Screen"
        case .twenty: return "Twentieth Screen"
        case .twentyOne: return "Twenty-First Screen"
        case .twentyTwo: return "Twenty-Second Screen"
        case .twentyThree: return "Twenty-Third Screen"
        case .twentyFour: return "Twenty-Fourth Screen"
        case .twentyFive: return "Twenty-Fifth Screen"
        case .assignment: return "Assignment Screen"
        case .paywall: return "Paywall Screen"
        case .angry: return "Angry Screen"
        case .loading: return "Loading Screen"
        case .rateOurApp: return "Rate Our App Screen"
        case .reviewView: return "Review Screen"
        case .rewiring: return "Rewiring Screen"
        case .rewriting: return "Rewriting Screen"
        case .videoOnboarding: return "Video Onboarding Screen"
        case .zvonochek: return "Zvonochek Screen"
        case .firstVideoView: return "FirstVideoView"
        case .thirdVideoView: return "ThirdVideoView"
        case .secondVideoView: return "SecondVideoView"
        case .fourthVideoView: return "FourthVideoView"
        }
    }
    
    public var rawValue: String {
        switch self {
        case .start: return "start"
        case .second: return "second"
        case .third: return "third"
        case .fourth: return "fourth"
        case .five: return "five"
        case .six: return "six"
        case .seven: return "seven"
        case .eight: return "eight"
        case .nine: return "nine"
        case .ten: return "ten"
        case .eleven: return "eleven"
        case .twelve: return "twelve"
        case .thirteen: return "thirteen"
        case .fourteen: return "fourteen"
        case .fifteen: return "fifteen"
        case .sixteen: return "sixteen"
        case .seventeen: return "seventeen"
        case .eighteen: return "eighteen"
        case .nineteen: return "nineteen"
        case .twenty: return "twenty"
        case .twentyOne: return "twentyOne"
        case .twentyTwo: return "twentyTwo"
        case .twentyThree: return "twentyThree"
        case .twentyFour: return "twentyFour"
        case .twentyFive: return "twentyFive"
        case .assignment: return "assignment"
        case .paywall: return "paywall"
        case .angry: return "angry"
        case .loading: return "loading"
        case .rateOurApp: return "rateOurApp"
        case .reviewView: return "reviewView"
        case .rewiring: return "rewiring"
        case .rewriting: return "rewriting"
        case .videoOnboarding: return "videoOnboarding"
        case .zvonochek: return "zvonochek"
        case .firstVideoView: return "FirstVideoView"
        case .thirdVideoView: return "ThirdVideoView"
        case .secondVideoView: return "SecondVideoView"
        case .fourthVideoView: return "FourthVideoView"
        }
    }
}

// MARK: - Onboarding Configuration
public struct OnboardingConfiguration: Sendable, Equatable {
    public let screens: [OnboardingScreenType]
    public let showProgressIndicator: Bool
    public let allowSwipeNavigation: Bool
    
    public init(
        screens: [OnboardingScreenType],
        showProgressIndicator: Bool = true,
        allowSwipeNavigation: Bool = false
    ) {
        self.screens = screens
        self.showProgressIndicator = showProgressIndicator
        self.allowSwipeNavigation = allowSwipeNavigation
    }
    
    // MARK: - Predefined Configurations
    
    /// Полный онбординг со всеми 25 экранами
    public static let full: OnboardingConfiguration = {
        OnboardingConfiguration(screens: OnboardingScreenType.allCases)
    }()
    
    /// Короткий онбординг с первыми 5 экранами
    public static let short: OnboardingConfiguration = {
        OnboardingConfiguration(screens: [
            .start, .second, .third, .fourth, .five
        ])
    }()
    
    /// Средний онбординг с первыми 10 экранами
    public static let medium: OnboardingConfiguration = {
        OnboardingConfiguration(screens: [
            .start, .second, .third, .fourth, .five,
            .six, .seven, .eight, .nine, .ten
        ])
    }()
    
    public static let stand: OnboardingConfiguration = {
        OnboardingConfiguration(screens: [
            .firstVideoView, .secondVideoView,
            .thirdVideoView,
            .start, .second, .third, .fourth, .loading, .five,
            .six, .seven, .nine, .ten, .twelve, .thirteen, .fourteen, .fifteen, .sixteen, .seventeen, .loading, .eighteen, .nineteen, .twenty, .twentyOne, .angry, .twentyTwo, .twentyThree, .twentyFour, .twentyFive, .rateOurApp, .assignment, .rewriting, .videoOnboarding, .zvonochek, .paywall
        ])
    }()
    /// Кастомный онбординг только с определенными экранами
    public static func custom(_ screens: OnboardingScreenType...) -> OnboardingConfiguration {
        OnboardingConfiguration(screens: screens)
    }
    
    /// Онбординг с диапазоном экранов
    public static func range(from start: OnboardingScreenType, to end: OnboardingScreenType) -> OnboardingConfiguration {
        let allScreens = OnboardingScreenType.allCases
        guard let startIndex = allScreens.firstIndex(of: start),
              let endIndex = allScreens.firstIndex(of: end) else {
            return OnboardingConfiguration(screens: [start])
        }
        
        let screens = Array(allScreens[startIndex...endIndex])
        return OnboardingConfiguration(screens: screens)
    }
}

// MARK: - Convenience Extensions
public extension OnboardingConfiguration {
    /// Создает конфигурацию с первыми N экранами
    static func first(_ count: Int) -> OnboardingConfiguration {
        let screens = Array(OnboardingScreenType.allCases.prefix(count))
        return OnboardingConfiguration(screens: screens)
    }
    
    /// Создает конфигурацию с последними N экранами
    static func last(_ count: Int) -> OnboardingConfiguration {
        let screens = Array(OnboardingScreenType.allCases.suffix(count))
        return OnboardingConfiguration(screens: screens)
    }
    
    /// Создает конфигурацию с экранами по индексам
    static func indices(_ indices: [Int]) -> OnboardingConfiguration {
        let allScreens = OnboardingScreenType.allCases
        let screens = indices.compactMap { index in
            allScreens.indices.contains(index) ? allScreens[index] : nil
        }
        return OnboardingConfiguration(screens: screens)
    }
}
