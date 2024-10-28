import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
