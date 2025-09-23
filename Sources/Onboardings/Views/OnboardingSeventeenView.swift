
import SwiftUI

public struct OnboardingSeventeenView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            
            ZStack {
                Color.appBackground.ignoresSafeArea()
                AppGradient.lightScrim.ignoresSafeArea()
                
                VStack {
                    Text("What is your\ndaily screen time\nin average?")
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 8) {
                        CustomButton(title: "Less than 1 hours", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "1 - 2 hours", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "3 - 4 hours", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "5 - 6 hours", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "7 - 8 hours", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "More than 8 hours", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                    }
                    .padding(.top, screenHeight * 0.134)
                    
                    Spacer()
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .frame(width: screenWidth * 0.92)
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.02)
                }
            }
        }
    }
}
