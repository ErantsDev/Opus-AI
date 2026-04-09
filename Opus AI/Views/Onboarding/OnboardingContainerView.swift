import SwiftUI

struct OnboardingContainerView: View {
    @State private var currentStep = 1

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                switch currentStep {
                case 1: NameStepView(onNext: advance)
                case 2: OfferStepView(onNext: advance)
                case 3: TypeStepView(onNext: advance)
                case 4: SizeStepView(onNext: advance)
                case 5: FrequencyStepView(onNext: advance)
                case 6: SatStepView(onNext: advance)
                case 7: BenefitsStepView(onNext: advance)
                default: EmptyView()
                }
            }
            .id(currentStep)
        }
        .navigationBarBackButtonHidden(true)
    }

    private func advance() {
        withAnimation(.easeInOut(duration: 0.3)) {
            currentStep += 1
        }
    }
}

#Preview {
    OnboardingContainerView()
}
