//  Created by Ahmed Yamany on 22/12/2023.

import UIKit

public extension UIView {   
    /// Returns the nearest parent view controller for the current view.
    var parentViewController: UIViewController? {
        sequence(first: self) {
            $0.next
        }.first { $0 is UIViewController } as? UIViewController
    }
}
