import SwiftUI

struct PaginationIndicator: View {
    let current: Int
    let total: Int

    var body: some View {
        HStack(spacing: 6) {
            ForEach(1...total, id: \.self) { i in
                if i == current {
                    Capsule()
                        .fill(Color("SolidGreen"))
                        .frame(width: 24, height: 8)
                } else {
                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 8, height: 8)
                }
            }
        }
    }
}
