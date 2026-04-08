import SwiftUI

struct OTPVerificationView: View {
    @State private var code = ""
    private let solidGreen = Color(red: 0.184, green: 0.541, blue: 0.420)

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
                    // verify OTP — no backend yet
                } label: {
                    Text("Verificar")
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
        .navigationTitle("Verificación")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { OTPVerificationView() }
}
