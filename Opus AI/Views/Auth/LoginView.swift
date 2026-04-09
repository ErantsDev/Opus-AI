import SwiftUI

struct LoginView: View {
    @State private var navigateToOTP = false
    @State private var email = ""
    @State private var emailTouched = false
    private let solidGreen = Color("SolidGreen")

    private var emailIsValid: Bool {
        let pattern = #"^[A-Z0-9a-z._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$"#
        return email.range(of: pattern, options: .regularExpression) != nil
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack(spacing: 0) {
                   
                    

                    // Logo
                    GeometryReader { geo in
                        
                        HStack {
                            Spacer()
                            Image("Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: geo.size.width * 0.35)
                                .shadow(
                                        color: Color.black.opacity(0.3), // Control de opacidad
                                        radius: 5,                       // Difuminado de la sombra
                                        x: 0,                            // Mantener centrada horizontalmente
                                        y: 10                            // Desplazamiento positivo hacia abajo
                                    )
                            Spacer()
                        }
                        
                    }
                    .frame(height: 120)
                    .padding(.top, 130)
                    Spacer().frame(height: 48)

                    // Auth buttons
                    VStack(spacing: 14) {

                        // Apple
                        outlinedButton {
                            Label("Continuar con Apple", systemImage: "applelogo")
                        } action: {
                            // Apple Sign In — not implemented
                        }

                        // Google
                        outlinedButton {
                            Label {
                                Text("Continuar con Google")
                            } icon: {
                                Image("Google")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                            }
                        } action: {
                            // Google Sign In — not implemented
                        }

                        // Separator
                        HStack(spacing: 12) {
                            Rectangle().frame(height: 1).foregroundColor(Color(.systemGray5))
                            Text("o").foregroundColor(.secondary).font(.subheadline)
                            Rectangle().frame(height: 1).foregroundColor(Color(.systemGray5))
                        }
                        .padding(.vertical, 2)

                        // Email field
                        VStack(alignment: .leading, spacing: 6) {
                            HStack(spacing: 10) {
                                Image(systemName: "envelope")
                                    .foregroundColor(.secondary)
                                TextField("Correo electrónico", text: $email)
                                    .keyboardType(.emailAddress)
                                    .textContentType(.emailAddress)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .onChange(of: email) { _, _ in emailTouched = true }
                            }
                            .font(.body.bold())
                            .padding(.vertical, 14)
                            .padding(.horizontal, 16)
                            .overlay(
                                Capsule().stroke(
                                    emailTouched && !emailIsValid ? Color.red : Color.black,
                                    lineWidth: 1
                                )
                            )

                            if emailTouched && !emailIsValid {
                                Text("Ingresa un correo válido")
                                    .font(.caption)
                                    .foregroundColor(.red)
                                    .padding(.leading, 16)
                            }
                        }
                    }
                    .padding(.horizontal, 24)

                    Spacer().frame(height: 28)

                    // Solid green CTA
                    Button {
                        guard emailIsValid else { emailTouched = true; return }
                        navigateToOTP = true
                    } label: {
                        Text("Iniciar sesión o regístrate")
                            .font(.body.bold())
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(solidGreen)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 24)

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigateToOTP) {
                OTPVerificationView()
            }
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func outlinedButton<L: View>(
        label: () -> L,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            label()
                .font(.body.bold())
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .foregroundColor(.black)
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        }
    }
}

#Preview {
    LoginView()
}
