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
                    // Первая часть текста
                    Text("It's a part of your\nlife that's already ")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Вторая часть текста с градиентом
                    Text("behind you.")
                        .font(.interMedium(size: 36))
                        .foregroundStyle(AppGradient.textPrimary)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // График с изображениями
                    HStack(alignment: .bottom) {
                        ZStack {
                            Image(bundleResource: "lines")
                                .resizable()
                                .frame(width: 14, height: isSmallScreen ? screenHeight * 0.140 : screenHeight * 0.150)
                            
                            Text("your\nage")
                                .font(.interMedium(size: 12))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.bottom, 22)
                        
                        Image(bundleResource: "fiveViewGraphic")
                            .resizable()
                            .scaledToFit()
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
