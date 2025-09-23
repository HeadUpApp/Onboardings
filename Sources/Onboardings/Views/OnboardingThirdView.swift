

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
                
                VStack(alignment: .leading) {
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.34)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(.thirdViewGraphic)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: isSmallDevice ? screenHeight * 0.65 : screenHeight * 0.70)
                        .padding(.horizontal, screenWidth * 0.03)
                        .padding(.bottom, 12)
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
private var textContent: Text {
    let part1 = Text("So, this is\n")
    let part2 = Text("90 years ")
        .foregroundStyle(AppGradient.textPrimary)
        .font(.interMedium(size: 34))
    let part3 = Text("of your\n")
    let part4 = Text("life in months")
       
    return part1 + part2 + part3 + part4
}
