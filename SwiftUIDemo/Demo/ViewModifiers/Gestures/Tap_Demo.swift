import SwiftUI

struct Tap_Demo: View {
    @State private var isTapped: Bool = false
    @State private var isPressing: Bool = false
    
    var body: some View {
        Image("pencake")
            .resizable()
            .scaledToFit()
            .frame(width: isTapped ? 300 : 200)
            .opacity(isPressing ? 0.5 : 1.0) // 長按時透明
        
        // 動畫方法１
        // .animation(.default, value : isTapped)
        
        // 快點兩下處發動畫 (count:設定點幾下)
            .onTapGesture(count:2) {
                //function
                //block
                //Trailing closure
                isTapped.toggle()
            }
        
        // onLongPressGesture 跟 onTapGesture 一樣，也可以配合動畫來做效果。
            .onLongPressGesture(
                minimumDuration: 1.0, // 長按 1 秒才觸發
                maximumDistance: 50
            ) {
                print("長按結束時觸發")
                isTapped.toggle()
                
            } onPressingChanged: { pressing in
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPressing = pressing
                }
                if pressing {
                    print("正在長按中")
                } else {
                    print("長按取消")
                }
            }
        
        // 觸發方法１(與２完全相同)
        //            .onTapGesture(perform: {
        //                isTapped.toggle()
        //            })
        //            }
        
        
        // 觸發方法２(與１完全相同)
        //            .onTapGesture {
        //                isTapped.toggle()
        //            }
        
        
        // 動畫方法２
        //            .onTapGesture {
        //                // .spring 像彈簧一樣的縮放
        //                withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
        //                    isTapped.toggle()
        //                }
        //            }
    }
}

#Preview("Tap to zoom") {
    Tap_Demo()
}

#Preview("Zoomable") {
    Image("pencake")
        .resizable()
        .scaledToFit()
        .rounded()
        .frame(width: 200)
        // 如何 Jump to Definition 跳到定義處 的方法:
        // 1.滑鼠移到 .zoomable() 然後按下 Command⌘ + control + J 鍵
        // 2.長按Command ⌘ + 滑鼠點擊 .zoomable()
        .zoomable()
}
