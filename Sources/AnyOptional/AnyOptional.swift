//
//  AnyOptional.swift
//

/// A type-erased protocol that allows working with optional values in a generic context.
///
/// Conforming types provide a unified way to determine whether an underlying value
/// is `nil` without knowing the specific `Wrapped` type at compile time.
///
/// This is especially useful when:
/// - Reflecting over properties to check for presence or absence of values.
/// - Writing generic utilities that need to handle optionals uniformly.
/// - Avoiding conditional casting to `Optional<Wrapped>` at call sites.
///
/// Types conforming to `AnyOptional` should represent an optional-like container.
///
/// - Note: `Swift.Optional` automatically conforms to `AnyOptional`.
public protocol AnyOptional {
    /// A Boolean value indicating whether the underlying value is `nil`.
    ///
    /// - Returns: `true` if the optional has no value; otherwise, `false`.
    var isNil: Bool { get }

    /// A Boolean value indicating whether the underlying value exists.
    ///
    /// - Returns: `true` if the optional contains a value; otherwise, `false`.
    var isSome: Bool { get }
}

/// Extends `Swift.Optional` to conform to `AnyOptional`.
///
/// This enables checking for `nil` across any `Optional<Wrapped>` value using the
/// `isNil` property in a type-erased manner.
extension Optional: AnyOptional {
    /// A Boolean value indicating whether `self` is `nil`.
    ///
    /// - Returns: `true` when the optional is `.none`; otherwise, `false`.
    public var isNil: Bool { self == nil }

    /// A Boolean value indicating whether `self` contains a wrapped value.
    ///
    /// - Returns: `true` when the optional is `.some`; otherwise, `false`.
    public var isSome: Bool { isNil == false }
}
