
import SwiftUI

public struct OnboardingTwelveView: View {
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
                    textContent
                        .font(.interMedium(size: 34))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .bottom){
                        VStack(spacing: 0) {
                            Image(.walkingMan)
                                .resizable()
                                .frame(minWidth: screenWidth * 0.05, maxWidth: screenWidth * 0.10)
                                .frame(minHeight: screenHeight * 0.40, maxHeight: screenHeight * 0.72)
 
                        }
                        Image(.twelveViewGraphic)
                            .resizable()
                            .frame(maxWidth: screenWidth * 0.80, maxHeight: screenHeight * 0.72)
                    }
                    .padding(.top, 23)
                    Image(.cifry18)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenWidth * 0.6)
                        .frame(minHeight: screenHeight * 0.01, maxHeight: 20)
                        .padding(.leading, screenWidth * 0.35)
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
                    .padding(.top, screenHeight * 0.01)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
    
    private var textContent: Text {
        let part1 = Text("Let's see how much\n")
        let part2 = Text("of this time ")
        let part3 = Text("really\n")
            .foregroundStyle(AppGradient.textPrimary)
            .font(.interMedium(size: 34))
        let part4 = Text("belongs to you.")
        return part1 + part2 + part3 + part4
    }
}
