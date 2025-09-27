import SwiftUI

extension Image {
    /// Creates an Image from a resource in the SPM bundle
    init(bundleResource name: String) {
        self.init(name, bundle: Bundle.module)
    }
}
