import SwiftUI

struct OnboardingCard: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .foregroundColor(isSelected ? Color("SolidGreen") : .secondary)
                Text(title)
                    .font(.subheadline.weight(.medium))
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color("SolidGreen"))
                }
            }
            .padding(14)
            .background(isSelected ? Color("SolidGreen").opacity(0.08) : Color(.systemGray6))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? Color("SolidGreen") : Color.clear, lineWidth: 1.5)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .foregroundColor(.primary)
        }
    }
}
