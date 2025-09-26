import SwiftUI

public struct OnboardingThirdView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isSmallDevice = screenHeight <= 667
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("So, this is")
                            .font(.interMedium(size: 34))
                            .kerning(0.34)
                            .foregroundStyle(Color.white)
                        
                        HStack(spacing: 0) {
                            Text("90 years ")
                                .font(.interMedium(size: 34))
                                .kerning(0.34)
                                .foregroundStyle(AppGradient.textPrimary)
                            Text("of your")
                                .font(.interMedium(size: 34))
                                .kerning(0.34)
                                .foregroundStyle(Color.white)
                        }
                        
                        Text("life in months")
                            .font(.interMedium(size: 34))
                            .kerning(0.34)
                            .foregroundStyle(Color.white)
                    }
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(bundleResource: "thirdViewGraphic")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: isSmallDevice ? screenHeight * 0.65 : screenHeight * 0.70)
                        .padding(.horizontal, screenWidth * 0.03)
                        .padding(.bottom, 12)
                        .padding(.top, screenHeight * 0.02)
                    
                    Button {
                        onNext()
                    } label: {
                        Text("What?")
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
