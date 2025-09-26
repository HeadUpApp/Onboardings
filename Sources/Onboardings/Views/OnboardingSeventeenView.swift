import SwiftUI

public struct OnboardingSeventeenView: View {
    let onNext: () -> Void
    @State private var selectedScreenTime: String? = nil
    
    private let screenTimeOptions = [
        "Less than 1 hours",
        "1 - 2 hours",
        "3 - 4 hours",
        "5 - 6 hours",
        "7 - 8 hours",
        "More than 8 hours"
    ]
    
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
                        ForEach(screenTimeOptions.indices, id: \.self) { index in
                            CustomButton(
                                title: screenTimeOptions[index],
                                action: {
                                    selectedScreenTime = screenTimeOptions[index]
                                },
                                height: 64,
                                width: screenWidth * 0.9,
                                isSelected: selectedScreenTime == screenTimeOptions[index]
                            )
                        }
                    }
                    .padding(.top, 8)
                    
                    Spacer()
                    
                    Button {
                        onNext()
                    } label: {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .opacity(selectedScreenTime == nil ? 0.6 : 1.0)
                    .disabled(selectedScreenTime == nil)
                    .frame(width: screenWidth * 0.92)
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.02)
                }
            }
        }
    }
}
