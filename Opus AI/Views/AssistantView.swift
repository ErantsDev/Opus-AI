import SwiftUI

struct AssistantView: View {
    @State private var navigateToDashboard = false
    private let solidGreen = Color("SolidGreen")
    private let lightGreen  = Color("SolidGreen").opacity(0.12)

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                // Background decorative circles
                GeometryReader { geo in
                    Circle()
                        .fill(lightGreen)
                        .frame(width: geo.size.width * 0.75)
                        .offset(x: -geo.size.width * 0.25, y: -geo.size.height * 0.05)

                    Circle()
                        .fill(lightGreen)
                        .frame(width: geo.size.width * 0.55)
                        .offset(x: geo.size.width * 0.6, y: geo.size.height * 0.65)
                }
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer()

                    // Assistant icon
                    ZStack {
                        // Outer faint ring
                        Circle()
                            .stroke(lightGreen, lineWidth: 18)
                            .frame(width: 160, height: 160)

                        // Inner icon
                        Image("Asistente")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 80)
                    }
                    .padding(.bottom, 40)

                    // Heading
                    Text("¡ Hola usuario ¡")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.bottom, 16)

                    // Body
                    Text("Bienvenido, soy tu asistente de inteligencia artifical para tu negocio. Me gustaria conocer tu modelo de negocio, ¿estas listo?, vamos.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 36)

                    Spacer()

                    // CTA button
                    Button {
                        navigateToDashboard = true
                    } label: {
                        Label {
                            Text("Comenzar")
                                .font(.body.bold())
                        } icon: {
                            Image(systemName: "chevron.right")
                        }
                        .labelStyle(.titleAndIcon)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(solidGreen)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToDashboard) {
                OnboardingContainerView()
            }
        }
    }
}

#Preview {
    AssistantView()
}
