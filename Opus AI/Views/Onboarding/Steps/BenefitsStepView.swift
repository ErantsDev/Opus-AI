import SwiftUI

struct BenefitsStepView: View {
    let onNext: () -> Void
    @State private var agreedToTerms = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            // Bar chart placeholder
            VStack(spacing: 12) {
                HStack(alignment: .bottom, spacing: 16) {
                    bar(height: 80,  label: "mes uno")
                    bar(height: 130, label: "mes dos")
                }
                .frame(height: 140)
            }
            .padding(24)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal, 24)

            // Caption with navigation arrows
            HStack(spacing: 16) {
                Button {} label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color("SolidGreen"))
                }
                Text("Conoce tus resumenes mensuales")
                    .font(.subheadline.weight(.medium))
                    .multilineTextAlignment(.center)
                Button {} label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("SolidGreen"))
                }
            }
            .padding(.horizontal, 24)

            Spacer()

            VStack(spacing: 16) {
                // Terms checkbox
                Button { agreedToTerms.toggle() } label: {
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: agreedToTerms ? "checkmark.square.fill" : "square")
                            .foregroundColor(agreedToTerms ? Color("SolidGreen") : Color(.systemGray3))
                            .font(.title3)
                        Text("Acepto los **Términos de Servicio** y la **Política de Privacidad**")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 24)

                Button(action: onNext) {
                    Text("Saltar")
                        .font(.body.bold())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color("SolidGreen"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal, 24)
            }
            .padding(.bottom, 36)
        }
    }

    @ViewBuilder
    private func bar(height: CGFloat, label: String) -> some View {
        VStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color("SolidGreen").opacity(0.75))
                .frame(width: 44, height: height)
            Text(label)
                .font(.caption2)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    BenefitsStepView(onNext: {})
}
