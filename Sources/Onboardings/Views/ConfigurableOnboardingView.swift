import SwiftUI

public struct ConfigurableOnboardingView: View {
    @State private var currentPage = 0
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
            TabView(selection: $currentPage) {
                ForEach(Array(configuration.screens.enumerated()), id: \.element.id) { index, screenType in
                    screenView(for: screenType, at: index)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .all)
            .disabled(!configuration.allowSwipeNavigation)
            
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
        }
    }
    
    private func navigateToNext() {
        withAnimation(.easeInOut(duration: 0.3)) {
            if currentPage < configuration.screens.count - 1 {
                currentPage += 1
            }
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
