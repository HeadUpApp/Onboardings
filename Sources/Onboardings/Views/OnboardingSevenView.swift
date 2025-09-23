

import SwiftUI

public struct OnboardingSevenView: View {
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
                    textContent
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
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
    
    private var textContent: Text {
        let part1 = Text("That means, sleep\n")
        let part2 = Text("takes up about\n")
        let part3 = Text("30%")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 36))
        let part4 = Text(" of your life.")
        
        return part1 + part2 + part3 + part4
    }
}
