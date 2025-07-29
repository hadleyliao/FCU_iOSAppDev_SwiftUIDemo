import SwiftUI

struct NavigationStack_Demo: View {
    var body: some View {
        NavigationStack {
            // 可以有好幾層
            List {
                NavigationLink(value: "Detail") {
                    // value其實可以設定數字，老師說int比String快
                    Text("Show Detail")
                }
                NavigationLink(value: "sun") {
                    Text("Show 🌞")
                }
                NavigationLink(value: "moon") {
                    Text("Show 🌛")
                }
                NavigationLink(value: "star") {
                    Text("Show ⭐️")
                }
                NavigationLink(value: "1") {
                    Text("Show 💧")
                }
            }
            
            .navigationTitle("Actions")
                .navigationDestination(for: String.self) { value in
                    switch value {
                    case "Detail":
                        Image(systemName: "book")
                            .font(.system(size: 50))
                            .foregroundColor(.green)
                        Text("This is Detail page")
                    case "sun":
                        Image(systemName: "sun.max.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.yellow)
                        Text("This is sun page")
                    case "moon":
                        Image(systemName: "moon.zzz.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                            Text("This is moon page")
                    case "star":
                        Image(systemName: "star")
                            .font(.system(size: 50))
                            .foregroundColor(.purple)
                        Text("This is star page")
                    case "1":
                        Image(systemName: "humidity.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.cyan)
                        Text("This is drop page")
                    default:
                        //Text("未知頁面")
                        EmptyView()
                    
                }
            }
        }
    }
}

#Preview("Navigation") {
    NavigationStack_Demo()
}

/// Navigation Path
struct NavigationStack_Demo2: View {
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink(value: "Detail") {
                    Text("Show Detail")
                }
            }
            .navigationTitle("Actions")
            .navigationDestination(for: String.self) { value in
                VStack {
                    Text("Detail View")

                    Button("Push") {
                        path.append("Detail")
                    }

                    if path.count >= 3 {
                        Button("Pop to root") {
                            path = []
                        }
                    }
                }
            }
        }
    }
}

#Preview("NavigationPath") {
    NavigationStack_Demo2()
}
