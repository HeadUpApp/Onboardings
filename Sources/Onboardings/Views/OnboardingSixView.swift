
import SwiftUI

public struct OnboardingSixView: View {
    let onNext: () -> Void
    @State private var selectedSleepTime: String? = nil
    
    // Массив опций для сна
    private let sleepOptions = [
        "Less than 4 hours",
        "5-6 hours",
        "7-8 hours",
        "9-10 hours",
        "11-12 hours",
        "More than 12 hours"
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
                    Text("How much sleep\ndo you get on\naverage?")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 8) {
                        ForEach(sleepOptions.indices, id: \.self) { index in
                            CustomButton(
                                title: sleepOptions[index],
                                action: {
                                    selectedSleepTime = sleepOptions[index]
                                },
                                height: 64,
                                width: screenWidth * 0.9,
                                isSelected: selectedSleepTime == sleepOptions[index]
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
                    .opacity(selectedSleepTime == nil ? 0.6 : 1.0)
                    .disabled(selectedSleepTime == nil)
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
}
