import SwiftUI

struct OfferStepView: View {
    let onNext: () -> Void
    @State private var selected: String?

    private let options: [(String, String)] = [
        ("Solo Productos",       "shippingbox"),
        ("Solo Servicios",       "wrench.and.screwdriver"),
        ("Productos y Servicios","square.grid.2x2")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("¿Qué ofrece tu negocio actualmente?")
                .font(.title2.bold())
                .padding(.top, 32)

            VStack(spacing: 10) {
                ForEach(options, id: \.0) { title, icon in
                    OnboardingCard(
                        title: title,
                        icon: icon,
                        isSelected: selected == title,
                        onTap: { selected = title }
                    )
                }
            }

            // Divider
            HStack(spacing: 10) {
                Rectangle().frame(height: 1).foregroundColor(Color(.systemGray4))
                Text("IMPORTA TUS DATOS")
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.secondary)
                    .fixedSize()
                Rectangle().frame(height: 1).foregroundColor(Color(.systemGray4))
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("¿Ya tienes un inventario?")
                    .font(.subheadline.weight(.semibold))

                HStack(spacing: 12) {
                    dashedButton(title: "Subir Excel", icon: "doc.badge.plus")
                    dashedButton(title: "Escanear",    icon: "barcode.viewfinder")
                }
            }

            Spacer()

            VStack(spacing: 20) {
                PaginationIndicator(current: 2, total: 7)

                Button(action: onNext) {
                    Text("Siguiente paso >")
                        .font(.body.bold())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color("SolidGreen"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding(.bottom, 36)
        }
        .padding(.horizontal, 24)
    }

    @ViewBuilder
    private func dashedButton(title: String, icon: String) -> some View {
        Button {} label: {
            VStack(spacing: 6) {
                Image(systemName: icon).font(.title3)
                Text(title).font(.subheadline.weight(.medium))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: StrokeStyle(lineWidth: 1.5, dash: [6]))
                    .foregroundColor(Color(.systemGray3))
            )
            .foregroundColor(.primary)
        }
    }
}

#Preview {
    OfferStepView(onNext: {})
}
