import SwiftUI

public struct OnboardingFourteenView: View {
    let onNext: () -> Void
    @State private var selectedWorkSchedule: String? = nil
    
    private let workScheduleOptions = [
        "6 hrs a day, 5 days a week",
        "8 hrs a day, 5 days a week",
        "8 hrs a day, 3 days a week",
        "6 hrs a day, 3 days a week",
        "6 hrs a day, Everyday",
        "4 hrs a day, Everyday",
        "Other"
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
                    Text("How many hours do\nyou work daily?")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 8) {
                        ForEach(workScheduleOptions.indices, id: \.self) { index in
                            CustomButton(
                                title: workScheduleOptions[index],
                                action: {
                                    selectedWorkSchedule = workScheduleOptions[index]
                                },
                                height: 64,
                                width: screenWidth * 0.9,
                                isSelected: selectedWorkSchedule == workScheduleOptions[index]
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
                    .opacity(selectedWorkSchedule == nil ? 0.6 : 1.0)
                    .disabled(selectedWorkSchedule == nil)
                    .padding(.horizontal, screenWidth * 0.04)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
}
