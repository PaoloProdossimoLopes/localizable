import Foundation

public protocol Localizable {
    static var file: String { get }
    static var bundle: Bundle { get }
}

public extension Localizable {
    static var file: String {
        "Localizable"
    }
    
    static var bundle: Bundle {
        .main
    }
    
    static func make(_ key: String) -> Localized {
        Localized.make(key: key, bundle: Self.bundle, table: Self.file)
    }
    
    static func make(_ key: String, args: CVarArg...) -> Localized {
        Localized.make(key, args: args, bundle: bundle, table: file)
    }
}

public struct Localized: @unchecked Sendable {
 
    public let value: String
    
    static func make(key: String, bundle: Bundle, table: String) -> Localized {
        let value = Self.get(key, bundle: bundle, table: table)
        return Localized(value: value)
    }
    
    static func make(_ key: String, args: CVarArg..., bundle: Bundle, table: String) -> Localized {
        let format = Self.get(key, bundle: bundle, table: table)
        return Localized(value: String(format: format, args))
    }
    
    private init(value: String) {
        self.value = value
    }
    
    private static func get(_ key: String, bundle: Bundle, table: String) -> String {
        NSLocalizedString(key, tableName: table, bundle: bundle, comment: String())
    }
}
