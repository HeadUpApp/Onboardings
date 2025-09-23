
import SwiftUI

public struct OnboardingSixView: View {
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
                    Text("How much sleep\ndo you get on\naverage?")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(spacing: 8) {
                        CustomButton(title: "Less than 4 hours", action: {}, height: 64,
                                     width: screenWidth * 0.9)
                        CustomButton(title: "5-6 hours", action: {}, height: 64, width: screenWidth * 0.9)
                        CustomButton(title: "7-8 hours", action: {}, height: 64, width: screenWidth * 0.9)
                        CustomButton(title: "9-10 hours", action: {}, height: 64, width: screenWidth * 0.9)
                        CustomButton(title: "11-12 hours", action: {}, height: 64, width: screenWidth * 0.9)
                        CustomButton(title: "More than 12 hours", action: {}, height: 64, width: screenWidth * 0.9)
                    }
                    .padding(.top, screenHeight * 0.14)
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
