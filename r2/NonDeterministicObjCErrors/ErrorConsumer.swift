import Foundation
import AVFoundation

enum Foo: Error {
    case generic
}

class ErrorConsumer {
    init() {
        let error = Foo.generic
        // AVError is declared as NS_ERROR_ENUM
        if (error as NSError).code == AVError.contentIsUnavailable.rawValue {
            print("oh no!")
        }
    }
}