import SwiftUI

struct SizeStepView: View {
    let onNext: () -> Void
    @State private var selected: String?

    private let options: [(String, String)] = [
        ("Micro-negocio",    "person"),
        ("Pequeña empresa",  "person.2"),
        ("Mediana empresa",  "person.3")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Tamaño o nivel del negocio")
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

            Spacer()

            VStack(spacing: 20) {
                PaginationIndicator(current: 4, total: 7)

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
    SizeStepView(onNext: {})
}
