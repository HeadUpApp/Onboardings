import SwiftUI
import Onboardings

struct OnboardingConfigurableExample: View {
    @State private var showOnboarding = true
    @State private var selectedConfiguration: OnboardingConfiguration = .short
    
    var body: some View {
        VStack(spacing: 20) {
            if showOnboarding {
                ConfigurableOnboardingView(
                    configuration: selectedConfiguration,
                    onComplete: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showOnboarding = false
                        }
                    }
                )
            } else {
                VStack(spacing: 30) {
                    Text("🎉 Onboarding Completed!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Configuration used: \(configurationName)")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    VStack(spacing: 15) {
                        Text("Try different configurations:")
                            .font(.headline)
                        
                        HStack(spacing: 10) {
                            Button("Short (5 screens)") {
                                selectedConfiguration = .short
                                showOnboarding = true
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Medium (10 screens)") {
                                selectedConfiguration = .medium
                                showOnboarding = true
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Full (25 screens)") {
                                selectedConfiguration = .full
                                showOnboarding = true
                            }
                            .buttonStyle(.bordered)
                        }
                        
                        HStack(spacing: 10) {
                            Button("Custom (1,3,5,10)") {
                                selectedConfiguration = .custom(.start, .third, .five, .ten)
                                showOnboarding = true
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Assignment + Paywall") {
                                selectedConfiguration = .custom(.assignment, .paywall)
                                showOnboarding = true
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Range (1-10)") {
                                selectedConfiguration = .range(from: .start, to: .ten)
                                showOnboarding = true
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }
    
    private var configurationName: String {
        switch selectedConfiguration {
        case .short:
            return "Short (5 screens)"
        case .medium:
            return "Medium (10 screens)"
        case .full:
            return "Full (25 screens)"
        default:
            return "Custom Configuration"
        }
    }
}

#Preview {
    OnboardingConfigurableExample()
}
