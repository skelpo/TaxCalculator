import Foundation
import NIO

public protocol TaxCalculator {
    associatedtype Input
    
    func tax(for input: Input) -> EventLoopFuture<Decimal>
}
