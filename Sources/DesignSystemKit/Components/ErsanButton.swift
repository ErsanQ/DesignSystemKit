#if canImport(SwiftUI)
import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

/// A premium, haptic-integrated button designed for the ErsanQ ecosystem.
///
/// `ErsanButton` provides a high-end interaction experience by combining
/// brand-consistent gradients, glassmorphism borders, and native spring physics.
///
/// ## Usage
/// ```swift
/// ErsanButton("Get Started", icon: "arrow.right") {
///     print("Tapped!")
/// }
/// ```
@MainActor
public struct ErsanButton: View {
    private let title: String
    private let icon: String?
    private let action: () -> Void
    private let isProminent: Bool
    
    /// Creates a new ErsanButton instance.
    ///
    /// - Parameters:
    ///   - title: The localized text displayed on the button.
    ///   - icon: An optional SF Symbol name to show before the title.
    ///   - isProminent: If true, uses the primary brand gradient. If false, uses a subtle surface.
    ///   - action: The closure to execute when the button is tapped.
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

/// The internal button style that handles pressing animations for ErsanQ components.
@MainActor
private struct ErsanButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
            .animation(.interactiveSpring(response: 0.3, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
#endif
