import SwiftUI

struct Drag_Demo: View {
    @State private var position = CGSize.zero         // Final position (saved)
    @State private var dragOffset = CGSize.zero       // Offset during drag
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: position.width + dragOffset.width,
                    y: position.height + dragOffset.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                        print("")
                    }
                    .onEnded { value in
                        // 註解掉下兩行，藍點會回到最初原點
                        // position.width += value.translation.width
                        // position.height += value.translation.height
                        
                        // 動畫：讓元素在 1 秒內用線性速度 平滑地移回原位，而不是瞬間跳回去。
                        //                        withAnimation(.linear(duration: 1)) {
                        //                            dragOffset = .zero
                        //                        }
                    }
            )
            .animation(.spring(), value: position)
    }
}

#Preview {
    Drag_Demo()
}
