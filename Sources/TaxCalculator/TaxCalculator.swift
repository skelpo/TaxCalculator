import Foundation
import Service
import NIO

/// A type that can get the tax amount from the total of an online order.
public protocol TaxCalculator: Service {
    
    /// The type that can be passed into the calculator to get the tax value.
    associatedtype Input
    
    /// Calculates a tax amount from an instance of the `Input` type.
    ///
    /// - Parameter input: The value to get the tax amount from.
    ///
    /// - Returns: The tax amount, wrapped in an `EventLoopFuture`. This is done in
    ///   case the calculator needs to make an API request, such as TaxJar.
    func tax(for input: Input) -> EventLoopFuture<Decimal>
}
