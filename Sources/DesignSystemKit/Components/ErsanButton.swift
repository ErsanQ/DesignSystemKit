import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// A premium button designed with the ErsanQ style.
@MainActor
public struct ErsanButton: View {
    private let title: String
    private let icon: String?
    private let action: () -> Void
    private let isProminent: Bool
    
    public init(_ title: String, icon: String? = nil, isProminent: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
        self.isProminent = isProminent
    }
    
    public var body: some View {
        Button(action: {
            #if os(iOS)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            #endif
            action()
        }) {
            HStack(spacing: 8) {
                if let icon = icon {
                    Image(systemName: icon)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .padding(.horizontal, Ersan.Spacing.large)
            .padding(.vertical, Ersan.Spacing.medium)
            .frame(maxWidth: .infinity)
            .background(
                Group {
                    if isProminent {
                        Ersan.Gradient.primary
                    } else {
                        Ersan.Gradient.surface
                    }
                }
                .cornerRadius(Ersan.Radius.button)
                .overlay(
                    RoundedRectangle(cornerRadius: Ersan.Radius.button)
                        .stroke(Ersan.Color.glassStroke.opacity(0.3), lineWidth: 1)
                )
            )
            .shadow(color: isProminent ? Ersan.Color.primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 5)
        }
        .buttonStyle(ErsanButtonStyle())
    }
}

@MainActor
private struct ErsanButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
