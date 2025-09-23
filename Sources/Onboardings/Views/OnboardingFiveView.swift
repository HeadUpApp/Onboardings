
import SwiftUI

public struct OnboardingFiveView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isSmallScreen = screenHeight <= 667
            let isLargeScreen = screenHeight > 812
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                VStack(spacing: 0) {
                    Text("It's a part of your\nlife that's already ")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("behind you.")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(AppGradient.textPrimary)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .bottom){
                        Image(.years25)
                            .resizable()
                            .frame(width: screenWidth * 0.07, height: isLargeScreen ? screenHeight * 0.156 : isSmallScreen ? screenHeight * 0.138 : screenHeight * 0.148)
                            .padding(.bottom, isLargeScreen ? screenHeight * 0.032  : isSmallScreen ? screenHeight * 0.030 : screenHeight * 0.033)
                       
                        Image(.fiveViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: isSmallScreen ? screenHeight * 0.64 : screenHeight * 0.72)
                    }
                    .padding(.bottom, 24)
                    .padding(.top, screenHeight * 0.02)
                    Button {
                        onNext()
                    } label: {
                        Text("I understand")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.03)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
}
