// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Common {
    /// Cancel
    public static let cancel = L10n.tr("Localizable", "common.cancel", fallback: "Cancel")
    /// Error
    public static let error = L10n.tr("Localizable", "common.error", fallback: "Error")
    /// Common
    public static let ok = L10n.tr("Localizable", "common.ok", fallback: "OK")
    /// Success
    public static let success = L10n.tr("Localizable", "common.success", fallback: "Success")
  }
  public enum Splash {
    /// SplashScreen
    public static let appName = L10n.tr("Localizable", "splash.app_name", fallback: "TestingTask")
    /// Loading...
    public static let loading = L10n.tr("Localizable", "splash.loading", fallback: "Loading...")
    /// Welcome to TestingTask
    public static let welcome = L10n.tr("Localizable", "splash.welcome", fallback: "Welcome to TestingTask")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
