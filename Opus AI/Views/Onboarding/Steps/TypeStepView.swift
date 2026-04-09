import SwiftUI

struct TypeStepView: View {
    let onNext: () -> Void
    @State private var selected: String?
    @State private var custom = ""

    private let options: [(String, String)] = [
        ("Abarrotes",      "cart"),
        ("Tienda de ropa", "tshirt"),
        ("Verduleria",     "leaf"),
        ("Panaderia",      "birthday.cake")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("¿Qué tipo de negocio manejas?")
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

            HStack(spacing: 12) {
                TextField("Otro tipo de negocio...", text: $custom)
                    .font(.body)
                Image(systemName: "mic.fill")
                    .foregroundColor(Color("SolidGreen"))
                    .font(.title3)
            }
            .padding(14)
            .overlay(Capsule().stroke(Color(.systemGray4), lineWidth: 1))

            Spacer()

            VStack(spacing: 20) {
                PaginationIndicator(current: 3, total: 7)

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
    TypeStepView(onNext: {})
}
