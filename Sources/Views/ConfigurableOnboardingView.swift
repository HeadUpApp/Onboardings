import SwiftUI
import UIKit

public struct ConfigurableOnboardingView: View {
    @State private var currentPage = 0
    @State private var isAnimating = false
    private let configuration: OnboardingConfiguration
    private let onComplete: () -> Void
    
    public init(
        configuration: OnboardingConfiguration,
        onComplete: @escaping () -> Void
    ) {
        self.configuration = configuration
        self.onComplete = onComplete
    }
    
    public var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            ZStack {
                ForEach(0..<configuration.screens.count, id: \.self) { index in
                    if index == currentPage {
                        screenView(for: configuration.screens[index], at: index)
                            .transition(
                                .asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)
                                )
                            )
                    }
                }
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.8), value: currentPage)
        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
    
    @ViewBuilder
    private func screenView(for screenType: OnboardingScreenType, at index: Int) -> some View {
        let isLastScreen = index == configuration.screens.count - 1
        
        Group {
            switch screenType {
            case .start:
                OnboardingStartView {
                    navigateToNext()
                }
            case .second:
                OnboardingSecondView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .third:
                OnboardingThirdView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .fourth:
                OnboardingFourthView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .five:
                OnboardingFiveView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .six:
                OnboardingSixView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .seven:
                OnboardingSevenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .eight:
                OnboardingEightView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .nine:
                OnboardingNineView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .ten:
                OnboardingTenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .eleven:
                OnboardingElevenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twelve:
                OnboardingTwelveView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .thirteen:
                OnboardingThirteenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .fourteen:
                OnboardingFourteenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .fifteen:
                OnboardingFifteenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .sixteen:
                OnboardingSixteenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .seventeen:
                OnboardingSeventeenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .eighteen:
                OnboardingEighteenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .nineteen:
                OnboardingNineteenView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twenty:
                OnboardingTwentyView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twentyOne:
                OnboardingTwentyOneView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twentyTwo:
                OnboardingTwentyTwoView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twentyThree:
                OnboardingTwentyThreeView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twentyFour:
                OnboardingTwentyFourView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .twentyFive:
                OnboardingTwentyFiveView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .assignment:
                OnboardingAssignmentView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .paywall:
                OnboardingPaywall {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .angry:
                AngryEmoji {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .loading:
                LoadingView(onComplete: {
                    navigateToNext()
                })
            case .rateOurApp:
                RateOurAppView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .reviewView:
                ReviewView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .rewiring:
                RewiringBenefits {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .rewriting:
                RewritingView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .videoOnboarding:
                VideoOnbView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .zvonochek:
                ZvonochekOnbView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .firstVideoView:
                FirstVideoView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .secondVideoView:
                SecondVideoView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .thirdVideoView:
                ThirdVideoView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            case .fourthVideoView:
                FourthVideoView {
                    handleCompletion(isLastScreen: isLastScreen)
                }
            }
        }
        .id(index)
    }
    
    private func handleCompletion(isLastScreen: Bool) {
        if isLastScreen {
            withAnimation(.easeInOut(duration: 0.4)) {
                onComplete()
            }
        } else {
            navigateToNext()
        }
    }
    
    private func navigateToNext() {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
            if currentPage < configuration.screens.count - 1 {
                currentPage += 1
            }
        }
    }
}
