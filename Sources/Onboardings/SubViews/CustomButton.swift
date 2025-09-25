
import SwiftUI

public struct CustomButton: View {
    let title: String
    let action: () -> Void
    let height: CGFloat
    let width: CGFloat
    let isSelected: Bool
    
    public init(title: String, action: @escaping () -> Void, height: CGFloat, width: CGFloat, isSelected: Bool = false) {
        self.title = title
        self.action = action
        self.height = height
        self.width = width
        self.isSelected = isSelected
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: width, maxHeight: height)
                .background(
                    RoundedRectangle(cornerRadius: 56)
                        .fill(isSelected ? Color.white.opacity(0.5) : Color.white.opacity(0.05))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 56)
                        .stroke(isSelected ? Color.white.opacity(0.5) : Color.clear, lineWidth: 2)
                )
        }
    }
}
