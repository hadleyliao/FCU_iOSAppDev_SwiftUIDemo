import SwiftUI
import Observation

struct Counter: View {
    @Binding var count: Int

    var body: some View {
        let _ = Self._printChanges()
        Text("Counter: \(count)")
        Button("Reset") {
            count = 0
        }
    }
}

struct ModelCounter: View {
    var model: Model

    var body: some View {
        @Bindable var model = model
        
        Button("Set to 100") {
            model.count = 100
        }
        
        TextField(text: $model.name){
            Text("Enter name")
        }
        .background(.red)
    }
}

struct CounterView: View {
    @State var model = Model()

    var body: some View {
        Button("Increment \(model.count)") {
            model.count += 1
        }

        Text("Name: \(model.name)")  // 這裡才能顯示 "計數"
        
        Divider()

        Counter(count: $model.count)

        Divider()

        ModelCounter(model: model)
            .onAppear(perform: onAppear)
    }
}

// CounterView + Lifecycle.swift
extension CounterView {
    func onAppear() {
        
    }
}

// 在 @Observable 右鍵 > 選 Expand Macro
// 它會展開編譯器背後自動生成的程式碼，讓你看到 @Observable 實際被編譯成什麼樣的 Swift 程式碼。
// 等於是你可以偷看編譯器的「黑箱」，把語法糖背後的原始代碼攤開來看。
@Observable
class Model {
    var count: Int = 50
//    @ObservationTracked
//    @ObservationIgnored
    var name: String = ""
}

#Preview {
    CounterView()
        .font(.largeTitle)
}
