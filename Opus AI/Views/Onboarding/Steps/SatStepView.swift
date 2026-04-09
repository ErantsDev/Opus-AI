import SwiftUI

struct SatStepView: View {
    let onNext: () -> Void
    @State private var rfc = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("¿Tu negocio esta registrado ante el SAT?")
                .font(.title2.bold())
                .padding(.top, 32)

            // RFC card
            VStack(alignment: .leading, spacing: 12) {
                Text("RFC")
                    .font(.caption.weight(.semibold))
                    .foregroundColor(.secondary)

                HStack(spacing: 12) {
                    TextField("Ingresa tu RFC...", text: $rfc)
                        .textInputAutocapitalization(.characters)
                        .disableAutocorrection(true)
                        .font(.body.monospaced())
                    Spacer()
                    Image(systemName: "touchid")
                        .font(.title2)
                        .foregroundColor(Color("SolidGreen"))
                }
            }
            .padding(18)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )

            Spacer()

            VStack(spacing: 20) {
                PaginationIndicator(current: 6, total: 7)

                Button(action: onNext) {
                    Text("Omitir paso >")
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
}

#Preview {
    SatStepView(onNext: {})
}
