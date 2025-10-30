// swiftlint:disable:this file_name
// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum CoreStrings: Sendable {

  public enum Common: Sendable {
  /// Cancel
    public static let cancel = CoreStrings.tr("Localizable", "common.cancel")
    /// Error
    public static let error = CoreStrings.tr("Localizable", "common.error")
    /// OK
    public static let ok = CoreStrings.tr("Localizable", "common.ok")
    /// Success
    public static let success = CoreStrings.tr("Localizable", "common.success")
  }

  public enum Splash: Sendable {
  /// TestingTask
    public static let appName = CoreStrings.tr("Localizable", "splash.app_name")
    /// Loading...
    public static let loading = CoreStrings.tr("Localizable", "splash.loading")
    /// Welcome to TestingTask
    public static let welcome = CoreStrings.tr("Localizable", "splash.welcome")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension CoreStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = Bundle.module.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
// swiftformat:enable all
// swiftlint:enable all
