import SwiftUI

public struct OnboardingView: View {
    @State private var currentPage = 0
    private let onComplete: () -> Void
    
    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    public var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
//                 Экран 1
                OnboardingStartView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 1
                    }
                }
                .tag(0)
                
                // Экран 2
                OnboardingSecondView{ withAnimation(.easeInOut(duration: 0.3)) {
                    currentPage = 2
                }}
                .tag(1)
                
                // Экран 3
                OnboardingThirdView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 3
                    }
                }
                .tag(2)
                
                // Экран 4
                OnboardingFourthView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 4
                    }
                }
                .tag(3)
                
                // Экран 5
                OnboardingFiveView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 5
                    }
                }
                .tag(4)
                
                // Экран 6
                OnboardingSixView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 6
                    }
                }
                .tag(5)
                
                // Экран 7
                OnboardingSevenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 7
                    }
                }
                .tag(6)
                
                // Экран 8
                OnboardingEightView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 8
                    }
                }
                .tag(7)
                
                // Экран 9
                OnboardingNineView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 9
                    }
                }
                .tag(8)
                
                // Экран 10
                OnboardingTenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 10
                    }
                }
                .tag(9)

                // Экран 11
                OnboardingElevenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 11
                    }
                }
                .tag(10)

                // Экран 12
                OnboardingTwelveView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 12
                    }
                }
                .tag(11)

                // Экран 13
                OnboardingThirteenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 13
                    }
                }
                .tag(12)

                // Экран 14
                OnboardingFourteenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 14
                    }
                }
                .tag(13)

                // Экран 15
                OnboardingFifteenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 15
                    }
                }
                .tag(14)

                // Экран 16
                OnboardingSixteenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 16
                    }
                }
                .tag(15)

                // Экран 17
                OnboardingSeventeenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 17
                    }
                }
                .tag(16)

                // Экран 18
                OnboardingEighteenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 18
                    }
                }
                .tag(17)

                // Экран 19
                OnboardingNineteenView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 19
                    }
                }
                .tag(18)

                // Экран 20
                OnboardingTwentyView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 20
                    }
                }
                .tag(19)

                // Экран 21
                OnboardingTwentyOneView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 21
                    }
                }
                .tag(20)

                // Экран 22
                OnboardingTwentyTwoView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 22
                    }
                }
                .tag(21)

                // Экран 23
                OnboardingTwentyThreeView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 23
                    }
                }
                .tag(22)

                // Экран 24
                OnboardingTwentyFourView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 24
                    }
                }
                .tag(23)

                // Экран 25 (завершение)
                OnboardingTwentyFiveView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 25
                    }
                }
                .tag(24)
                
                OnboardingAssignmentView {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        currentPage = 1
                    }
                }
                .tag(25)
                
                OnboardingPaywall {
                    onComplete()
                }
                .tag(26)

            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .all)

        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}

// MARK: - Preview
#if DEBUG
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView {
            print("Onboarding completed!")
        }
    }
}
#endif
