import SwiftUI

struct FrequencyStepView: View {
    let onNext: () -> Void
    @State private var selected: String?

    private let options: [(String, String)] = [
        ("Por dia",   "sun.max"),
        ("Semanal",   "calendar.badge.clock"),
        ("Quincenal", "calendar"),
        ("Mensual",   "calendar.badge.checkmark")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("¿Con que frecuencia actualizaras tu sistema...")
                .font(.title2.bold())
                .padding(.top, 32)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(options, id: \.0) { title, icon in
                    OnboardingCard(
                        title: title,
                        icon: icon,
                        isSelected: selected == title,
                        onTap: { selected = title }
                    )
                }
            }

            Spacer()

            VStack(spacing: 20) {
                PaginationIndicator(current: 5, total: 7)

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
    FrequencyStepView(onNext: {})
}
