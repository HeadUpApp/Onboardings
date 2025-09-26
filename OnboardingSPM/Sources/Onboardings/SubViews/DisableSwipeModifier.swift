import SwiftUI

struct DisableSwipeModifier: ViewModifier {
    let isDisabled: Bool
    func body(content: Content) -> some View {
        if isDisabled {
            content
                // Перехватываем только жесты перетаскивания, не затрагивая тапы
                .highPriorityGesture(DragGesture(minimumDistance: 1))
        } else {
            content
        }
    }
}


