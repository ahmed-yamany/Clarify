// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AccountSetup {
    internal enum Button {
      /// Continue with Apple
      internal static let apple = L10n.tr("Localizable", "accountSetup.button.apple", fallback: "Continue with Apple")
      /// Sign In with Email
      internal static let email = L10n.tr("Localizable", "accountSetup.button.email", fallback: "Sign In with Email")
      /// Continue with Google
      internal static let google = L10n.tr("Localizable", "accountSetup.button.google", fallback: "Continue with Google")
      /// Sign UP
      internal static let signup = L10n.tr("Localizable", "accountSetup.button.signup", fallback: "Sign UP")
    }
    internal enum Image {
      /// Your reset begins here. 
      internal static let text = L10n.tr("Localizable", "accountSetup.image.text", fallback: "Your reset begins here. ")
    }
    internal enum Text {
      /// Not a member?
      internal static let notmember = L10n.tr("Localizable", "accountSetup.text.notmember", fallback: "Not a member?")
    }
  }
  internal enum App {
    /// Localizable.strings
    ///   Clarity
    /// 
    ///   Created by Ahmed Yamany on 20/12/2023.
    internal static let name = L10n.tr("Localizable", "app.name", fallback: "Clarity")
  }
  internal enum Intro {
    internal enum Promo {
      internal enum Button {
        /// Next
        internal static let next = L10n.tr("Localizable", "intro.promo.button.next", fallback: "Next")
        /// Sign in
        internal static let signin = L10n.tr("Localizable", "intro.promo.button.signin", fallback: "Sign in")
      }
    }
    internal enum Terms {
      /// Let’s get you started!
      internal static let title = L10n.tr("Localizable", "intro.terms.title", fallback: "Let’s get you started!")
      internal enum Button {
        /// Accept all
        internal static let acceptAll = L10n.tr("Localizable", "intro.terms.button.acceptAll", fallback: "Accept all")
        /// Privacy Policy
        internal static let privacy = L10n.tr("Localizable", "intro.terms.button.privacy", fallback: "Privacy Policy")
        /// Next
        internal static let signup = L10n.tr("Localizable", "intro.terms.button.signup", fallback: "Next")
        /// Terms of Use.
        internal static let terms = L10n.tr("Localizable", "intro.terms.button.terms", fallback: "Terms of Use.")
      }
      internal enum Terms {
        /// Let’s get you started!
        internal static let policy = L10n.tr("Localizable", "intro.terms.terms.policy", fallback: "Let’s get you started!")
      }
      internal enum Toggle {
        /// I agree to processing of my personal health data for providing me Bellabeat app functions. See more in
        internal static let healthData = L10n.tr("Localizable", "intro.terms.toggle.healthData", fallback: "I agree to processing of my personal health data for providing me Bellabeat app functions. See more in")
        /// I agree that  may use my personal data to send me product or service offerings via app or email.*
        internal static let markting = L10n.tr("Localizable", "intro.terms.toggle.markting", fallback: "I agree that  may use my personal data to send me product or service offerings via app or email.*")
        /// I agree to 
        internal static let terms = L10n.tr("Localizable", "intro.terms.toggle.terms", fallback: "I agree to ")
      }
    }
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
