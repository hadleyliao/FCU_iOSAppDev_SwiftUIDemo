import SwiftUI
import Observation

@Observable
class CounterModel {
    var text: String = "Hello, World!"
    var count: Int = 0
    
    func test() {
        var text: String = ""
        if text == "" {
            
        }
        
        var text2: String? = nil    // Swift 的 nil 概念 = Java 的 null
        text2 = "ABC"
        if text2 == nil {
        }
        if let text2 = text2 {   // 可以簡化成 if let text2
            
        }
    }
}

struct BindableCounter: View {
    @Bindable var model: CounterModel

    var body: some View {
        TextField("", text: $model.text)
            .padding()
    }
}

struct CounterEnvironment: View {
    @Environment(CounterModel.self) private var model:
    CounterModel?

    var body: some View {
//        @Bindable var model = model
//
//        TextField("", text: $model.text)
//            .padding()

        Text("Counter: \(model?.count)")

        Button("Increment") {
            model?.count += 1
        }
    }
}

#Preview {
    CounterEnvironment()
        .font(.largeTitle)
//        .environment(CounterModel()) // 這邊註解，preview 會顯示 Counter: nil
}
