
import SwiftUI

public struct OnboardingTwentyFiveView: View {
    let onNext: () -> Void
    
    public init(onNext: @escaping () -> Void) {
        self.onNext = onNext
    }
    
    public var body: some View {
        GeometryReader { geometry in
            let screenHeight = geometry.size.height
            let screenWidth = geometry.size.width
            
            ZStack(alignment: .topLeading) {
                Color.appBackground.ignoresSafeArea()
                
                Image(bundleResource: "screen26")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: screenHeight)
                    .padding(.top, screenHeight * 0.04)
                
                VStack {
                    Spacer()
                    Image(bundleResource: "blackGradient")
                        .resizable()
                        .frame(height: screenHeight * 0.42)
                        .frame(maxWidth: .infinity)
                }
                
                textContent
                    .font(.interMedium(size: 36))
                    .kerning(0.36)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 16)
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    Button {
                        onNext()
                    } label: {
                        Text("I like it!")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.04)
                }
                .padding(.bottom, 8)
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("Along with\n")
        let part2 = Text("a ")
        let part3 = Text("40% boost ")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 36))
        let part4 = Text("in\n")
        let part5 = Text("work productivity.")
        return part1 + part2 + part3 + part4 + part5
    }
}
