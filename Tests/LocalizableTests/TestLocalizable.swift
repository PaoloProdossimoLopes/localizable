import Foundation
import Localizable

enum TestLocalizable: Localizable {
    static let file = "Localizable"
    static let bundle = Bundle.module
    
    static let rawText = make("rawText")
    static let formatWithString = make("formatWithString", args: "Localizable")
}
