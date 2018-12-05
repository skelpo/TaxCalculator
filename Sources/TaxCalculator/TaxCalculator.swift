import Foundation
import Service
import NIO

public protocol TaxCalculator: Service {
    associatedtype Input
    
    func tax(for input: Input) -> EventLoopFuture<Decimal>
}
