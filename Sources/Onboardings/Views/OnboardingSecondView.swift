import SwiftUI

public struct OnboardingSecondView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    @State private var contentSize: CGSize = .zero
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            let isSmallScreen = screenHeight <= 667
            
            ZStack(alignment: .topLeading) {
                Color.appBackground.ignoresSafeArea()
                AppGradient.simpleBackground.frame(height: screenHeight * 0.87)
                
                Image(.moon)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: isSmallScreen ? screenHeight * 0.38 : screenHeight * 0.28, alignment: .bottom)
                    .padding(.top, isSmallScreen ? screenHeight * 0.26 : screenHeight * 0.3)
                
                Image(.hand)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: screenHeight * 0.90)
                
                VStack {
                    Spacer()
                    Image(.blackGradient)
                        .resizable()
                        .frame(height: screenHeight * 0.42)
                        .frame(maxWidth: .infinity)
                }
                
                // Центрированный текст
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("1 months")
                            .font(.interMedium(size: 32))
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    Text("of your life")
                        .font(.interMedium(size: 18))
                        .foregroundStyle(Color.backgroundWithOpacity)
                        .padding(.bottom, screenHeight * 0.164)
                    Spacer()
                }
                
                Text("This is..")
                    .font(.interMedium(size: 36))
                    .kerning(0.36)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineSpacing(36 * 0.16)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                
                VStack {
                    Spacer()
                    Button {
                        onNext()
                    } label: {
                        Text("Okay")
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
