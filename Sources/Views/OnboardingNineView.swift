import SwiftUI

public struct OnboardingNineView: View {
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
                    
                    HStack(alignment: .bottom) {
                        VStack(spacing: 0) {
                            Image(bundleResource: "walkingMan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: isLargeScreen ? screenHeight * 0.373 : isSmallScreen ? screenHeight * 0.35 : screenHeight * 0.38)
                            
                            Image(bundleResource: "sleepEmoji")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: isLargeScreen ? screenHeight * 0.138 : isSmallScreen ? screenHeight * 0.110 : screenHeight * 0.120)
                            
                            ZStack {
                                Image(bundleResource: "lines")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: isSmallScreen ? screenHeight * 0.140 : screenHeight * 0.150)
                                
                                Text("your\nage")
                                    .font(.interMedium(size: 12))
                                    .foregroundStyle(Color.white)
                            }
                            .padding(.bottom, 2)
                        }
                        
                        Image(bundleResource: "nineViewGraphic")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.72)
                    }
                    .padding(.top, isLargeScreen ? 50 : 30)
                    
                    Image(bundleResource: "cifry24")
                        .resizable()
                        .frame(maxWidth: 254, maxHeight: 20)
                        .padding(.leading, 100)
                        .padding(.bottom, 24)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Good")
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
        let part1 = Text("But the rest is the\n")
        let part2 = Text("active waking life.")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 36))
        
        return part1 + part2
    }
}
