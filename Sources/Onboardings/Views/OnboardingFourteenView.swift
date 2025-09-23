

import SwiftUI

public struct OnboardingFourteenView: View {
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
                    Text("How many hours do\nyou work daily?")
                        .font(.interMedium(size: 36))
                        .kerning(0.36)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 8) {
                        CustomButton(title: "6 hrs a day, 5 days a week", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "8 hrs a day, 5 days a week", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "8 hrs a day, 3 days a week", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "6 hrs a day, 3 days a week", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "6 hrs a day, Everyday", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "4 hrs a day, Everyday", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                        
                        CustomButton(title: "Other", action: {},
                                    height: 64,
                                    width: screenWidth * 0.9)
                    }
                    .padding(.top, screenHeight * 0.08)
                    
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
                    .padding(.top, screenHeight * 0.01)
                    .padding(.bottom, screenHeight * 0.01)
                }
            }
        }
    }
}
