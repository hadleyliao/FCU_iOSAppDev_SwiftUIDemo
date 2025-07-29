import SwiftUI

struct Sheet_Demo: View {
    @State private var isShowing = false

    var body: some View {
        /// Refer to the examples in ``VStack_Demo``
        VStack {
            Button {
                isShowing = true
            } label: {
                Text("Show Sheet")
            }
        }
        .sheet(isPresented: $isShowing) {
            // 彈窗由下往上彈到視窗1/3
            Text("Detail")
                .presentationDetents([.medium, .fraction(0.33)])
                .presentationDragIndicator(.visible)
                // 拉桿可見
//                .presentationDragIndicator(.hidden)
                    // 拉桿隱藏
        }
    }
}

#Preview {
    Sheet_Demo()
}
