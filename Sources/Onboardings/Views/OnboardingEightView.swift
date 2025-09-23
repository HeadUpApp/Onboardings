
import SwiftUI

public struct OnboardingEightView: View {
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
                    HStack(alignment: .bottom){
                        VStack(spacing: 0) {
                            Image(.sleepEmoji)
                                .resizable()
                                .frame(width: screenWidth * 0.07, height: isLargeScreen ? screenHeight * 0.134  : isSmallScreen ? screenHeight * 0.100 : screenHeight * 0.120)

                            Image(.years25)
                                .resizable()
                                .frame(width: screenWidth * 0.07, height: isSmallScreen ? screenHeight * 0.140 :  screenHeight * 0.150)
                        }
                        Image(.sevenViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: isSmallScreen ? screenHeight * 0.64 : screenHeight * 0.72)
                    }
                    .padding(.top,  isSmallScreen ? screenHeight * 0.24 : screenHeight * 0.2)
                    Image(.cifry24)
                        .resizable()
                        .frame(maxWidth: 254, maxHeight: 20)
                        .padding(.leading, 100)
                        .padding(.bottom, 24)
                    Button {
                        onNext()
                    } label: {
                        Text("Oh, okay")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
    
}
