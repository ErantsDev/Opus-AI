import SwiftUI

struct LoadingView: View {
    private let brandGreen = Color("BrandGreen")

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            GeometryReader { geo in
                VStack(spacing: 0) {
                    Spacer(minLength: 80)

                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: geo.size.width * 0.45)

                    Text("OPUS AI")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(brandGreen)

                    Spacer()

                    ProgressView()
                        .tint(brandGreen)
                        .scaleEffect(1.2)

                    Spacer(minLength: 40)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

#Preview {
    LoadingView()
}
