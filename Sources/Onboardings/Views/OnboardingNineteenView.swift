
import SwiftUI

public struct OnboardingNineteenView: View {
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
                VStack {
                    Text("That’s what it\nlooks like on your\nlife chart.")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .bottom){
                        VStack(spacing: 0) {
                            Image(.smartphone)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: screenWidth * 0.08)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: isLargeScreen ? screenHeight * 0.16  : isSmallScreen ? screenHeight * 0.11 : screenHeight * 0.13)
                            Image(.dedushka)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: isSmallScreen ? screenWidth * 0.08 : screenWidth * 0.10)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: isSmallScreen ? screenHeight * 0.14 : screenHeight * 0.17)
                            Image(.programmer)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: isSmallScreen ? screenWidth * 0.08 : screenWidth * 0.10)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.11)
                            Image(.home)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.02, maxWidth: screenWidth * 0.08)
                                .frame(minHeight: screenHeight * 0.04, maxHeight: screenHeight * 0.06)
                        }
                        Image(.nineteenViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.72)
                    }
                    .padding(.top, 23)
                    Image(.cifry18)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenWidth * 0.6)
                        .frame(minHeight: screenHeight * 0.01, maxHeight: 20)
                        .padding(.leading, screenWidth * 0.32)
                        .padding(.bottom, 24)
                    Button {
                        onNext()
                    } label: {
                        Text("I see..")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.top, screenHeight * 0.01)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
}
