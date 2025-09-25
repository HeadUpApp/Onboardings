import SwiftUI

public struct ConfigurableOnboardingView: View {
    @State private var currentPage = 0
    @State private var previousPage = 0
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
            // Рендерим ТОЛЬКО текущий экран без TabView, чтобы исключить свайпы
            screenView(for: configuration.screens[currentPage], at: currentPage)
                .id(currentPage)
                .transition(slideTransition)
                .ignoresSafeArea(.all, edges: .all)
            
            // Индикатор прогресса
            if configuration.showProgressIndicator {
                VStack {
                    ProgressIndicatorView(
                        currentPage: currentPage,
                        totalPages: configuration.screens.count
                    )
                    Spacer()
                }
            }
        }
        .animation(.easeInOut(duration: 0.35), value: currentPage)
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
    
    @ViewBuilder
    private func screenView(for screenType: OnboardingScreenType, at index: Int) -> some View {
        let isLastScreen = index == configuration.screens.count - 1
        
        switch screenType {
        case .start:
            OnboardingStartView {
                navigateToNext()
            }
            
        case .second:
            OnboardingSecondView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .third:
            OnboardingThirdView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .fourth:
            OnboardingFourthView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .five:
            OnboardingFiveView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .six:
            OnboardingSixView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .seven:
            OnboardingSevenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .eight:
            OnboardingEightView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .nine:
            OnboardingNineView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .ten:
            OnboardingTenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .eleven:
            OnboardingElevenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twelve:
            OnboardingTwelveView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .thirteen:
            OnboardingThirteenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .fourteen:
            OnboardingFourteenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .fifteen:
            OnboardingFifteenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .sixteen:
            OnboardingSixteenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .seventeen:
            OnboardingSeventeenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .eighteen:
            OnboardingEighteenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .nineteen:
            OnboardingNineteenView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twenty:
            OnboardingTwentyView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twentyOne:
            OnboardingTwentyOneView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twentyTwo:
            OnboardingTwentyTwoView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twentyThree:
            OnboardingTwentyThreeView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twentyFour:
            OnboardingTwentyFourView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .twentyFive:
            OnboardingTwentyFiveView {
                onComplete()
            }
            
        case .assignment:
            OnboardingAssignmentView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .paywall:
            OnboardingPaywall {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }
            
        case .angry:
            ZStack {
                AngryEmoji()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .loading:
            ZStack {
                LoadingView()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .rateOurApp:
            ZStack {
                RateOurAppView()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .reviewView:
            ZStack {
                ReviewView()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .rewiring:
            ZStack {
                RewiringBenefits()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .rewriting:
            ZStack {
                RewritingView()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .videoOnboarding:
            ZStack {
                VideoOnbView()
                continueOverlay(isLastScreen: isLastScreen)
            }

        case .firstVideo:
            FirstVideoView {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            }

        case .zvonochek:
            ZStack {
                ZvonochekOnbView()
                continueOverlay(isLastScreen: isLastScreen)
            }
        }
    }
    
    @ViewBuilder
    private func continueOverlay(isLastScreen: Bool) -> some View {
        VStack {
            Spacer()
            Button {
                if isLastScreen {
                    onComplete()
                } else {
                    navigateToNext()
                }
            } label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 16)
        }
        .ignoresSafeArea()
    }
    
    private func navigateToNext() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if currentPage < configuration.screens.count - 1 {
                previousPage = currentPage
                currentPage += 1
            }
        }
    }
}

// MARK: - Slide transition depending on direction
private extension ConfigurableOnboardingView {
    var slideTransition: AnyTransition {
        if currentPage >= previousPage {
            return .asymmetric(
                insertion: .move(edge: .trailing).combined(with: .opacity),
                removal: .move(edge: .leading).combined(with: .opacity)
            )
        } else {
            return .asymmetric(
                insertion: .move(edge: .leading).combined(with: .opacity),
                removal: .move(edge: .trailing).combined(with: .opacity)
            )
        }
    }
}

// MARK: - Progress Indicator View
struct ProgressIndicatorView: View {
    let currentPage: Int
    let totalPages: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index <= currentPage ? Color.white : Color.white.opacity(0.3))
                    .frame(width: 8, height: 8)
                    .animation(.easeInOut(duration: 0.3), value: currentPage)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 50)
    }
}
