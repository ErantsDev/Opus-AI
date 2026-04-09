import SwiftUI

struct NameStepView: View {
    let onNext: () -> Void
    @State private var businessName = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("¿Cuál es el nombre de tu negocio?")
                .font(.title2.bold())
                .padding(.top, 32)

            HStack(spacing: 12) {
                TextField("Escribe aquí...", text: $businessName)
                    .font(.body)
                Image(systemName: "mic.fill")
                    .foregroundColor(Color("SolidGreen"))
                    .font(.title3)
            }
            .padding(14)
            .overlay(Capsule().stroke(Color(.systemGray4), lineWidth: 1))

            Spacer()

            VStack(spacing: 20) {
                PaginationIndicator(current: 1, total: 7)

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
}

#Preview {
    NameStepView(onNext: {})
}
