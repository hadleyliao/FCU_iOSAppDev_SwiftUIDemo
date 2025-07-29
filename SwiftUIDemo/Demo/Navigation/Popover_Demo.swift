import SwiftUI

struct Popover_Demo: View {
    @State private var isShowing = false
    @State private var isShowingCover = false
    // 預設Detail區塊先隱藏，點擊後才顯示

    var body: some View {
        /// Refer to the examples in ``VStack_Demo``
        VStack {
            Button {
                isShowing = true
            } label: {
                Text("Show Popover")
            }
            Button {
                isShowingCover = true
            } label: {
                Text("Show Cover")
            }
        }
        .popover(
            // 點擊後才出現Detail區塊
            isPresented: $isShowing,
            attachmentAnchor: .point(.top),
            arrowEdge: .bottom
        ) {
            Text("Detail")
                .padding()
                .presentationCompactAdaptation(.none)
        }
        .fullScreenCover(
            // 點擊後出現全螢幕的區塊（很少用到）有下往上蓋住
            isPresented: $isShowingCover
        ) {
            Image(systemName:
                    "dog.fill")
            Button{
                isShowingCover = false
            } label: {
                Text("Hide Cover")
            }
        }
    }
}

#Preview {
    Popover_Demo()
}
