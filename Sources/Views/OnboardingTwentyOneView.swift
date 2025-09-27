
import SwiftUI

public struct OnboardingTwentyOneView: View {
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
                    Text("The bad news\nis that..")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    VStack(spacing: 16) {
                        Text("16%")
                            .font(.interMedium(size: 60))
                            .foregroundStyle(AppGradient.orangeGradientPrecise)
                        Text("This is the percentage of your daily waking\ntime that remains in real life.")
                            .font(.interMedium(size: 18))
                            .foregroundStyle(Color.gray)
                            .multilineTextAlignment(.center)
                        
                    }
                    Spacer()
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Continue")
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
