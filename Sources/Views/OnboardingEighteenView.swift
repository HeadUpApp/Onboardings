
import SwiftUI

public struct OnboardingEighteenView: View {
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
                    Text("Wow! That's\n2 190 hrs a year..")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    VStack(spacing: 16) {
                        Text("20 years")
                            .font(.interMedium(size: 60))
                            .foregroundStyle(AppGradient.orangeGradientPrecise)
                        Text("At this rate, screen time will take up about\nthat many years of your life")
                            .font(.interMedium(size: 18))
                            .foregroundStyle(Color.gray)
                            .multilineTextAlignment(.center)
                        
                    }
                    Spacer()
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Oh..")
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
