import SwiftUI

struct OTPVerificationView: View {
    @State private var code = ""
    @State private var navigateToAssistant = false
    private let solidGreen = Color("SolidGreen")

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 24) {
                Spacer()

                Image(systemName: "envelope.badge")
                    .font(.system(size: 52))
                    .foregroundColor(solidGreen)

                VStack(spacing: 8) {
                    Text("Revisa tu correo")
                        .font(.title2).bold()

                    Text("Te enviamos un código de 6 dígitos.\nIntrodúcelo a continuación.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }

                TextField("Código de verificación", text: $code)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .font(.title3.monospacedDigit())
                    .padding()
                    .overlay(
                        Capsule().stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .padding(.horizontal, 40)

                Button {
                    navigateToAssistant = true
                } label: {
                    Text("Verificar")
                        .font(.body.bold())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(solidGreen)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal, 40)

                Spacer()
            }
        }
        .navigationTitle("Verificación")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $navigateToAssistant) {
            AssistantView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NavigationStack { OTPVerificationView() }
}
