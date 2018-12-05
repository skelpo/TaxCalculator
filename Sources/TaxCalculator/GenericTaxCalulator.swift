import Foundation
import NIO

/// A `TaxCalculator` implementation that always uses the same percentage value to calculate an order's tax.
///
/// Registering this `TaxCalculator` with your app's services will look like this:
///
///     services.register(factory: { (container: Container) -> GenericTaxCalculator in
///         return GenericTaxCalculator(percentage: 19.5, on: container)
///     })
///
/// When you use this calculator, pass the total value that you want to get the tax value from into the `.tax(for:)` method.
/// This will multiply the input value by `percentage / 100`
public struct GenericTaxCalculator: TaxCalculator {
    
    /// The percentage of the total that the tax is equal to
    ///
    /// A percentage of `19.5`, if given a total of `100`, will result in `19.5`.
    public let percentage: Decimal
    
    /// The event loop that the instance of the `GenericTaxCalculator` service you got lives on.
    public let worker: EventLoopGroup
    
    
    /// Creates a new `GenericTaxCalculator` instance.
    ///
    /// Use this initializer when registering the service with your app's services.
    /// After that, use the `container.make` method to get the inatnce for that event loop.
    ///
    /// - Parameters:
    ///   - percentage: The perccentage of the total that the tax will be.
    ///   - worker: The event loop the the inatnce will live on.
    public init(percentage: Decimal, on worker: EventLoopGroup) {
        self.percentage = percentage
        self.worker = worker
    }
    
    /// See `TaxCalculator.tax(for:)`.
    public func tax(for input: Decimal) -> EventLoopFuture<Decimal> {
        let result = (self.percentage / 100) * input
        
        return self.worker.eventLoop.newSucceededFuture(result: result)
    }
}
