//
//  Created by Ahmed Yamany on 22/12/2023.
//

import SwiftUI

/**
 A SwiftUI view  that changes the back button image of the navigation bar for the current view.
 
 This  creates a hidden `UIView` and uses it to update the back button image asynchronously.
 The image change is delayed by a small amount to ensure that the view hierarchy is updated appropriately.
 
 - Parameter image: The new image for the back button.
 */
@available(iOS 15.0.0, *)
private struct NavigationBarBackButtonImageChanger: UIViewRepresentable {
    let image: UIImage?
    
    func makeUIView(context: Context) -> some UIView { UIView() }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            let navigationBar = uiView.parentViewController?.navigationController?.navigationBar
            navigationBar?.backIndicatorImage = image
            navigationBar?.backIndicatorTransitionMaskImage = image
        }
    }
}

@available(iOS 15.0, *)
public extension View {
    /**
     Sets the back button image for the current view.
     
     - Parameter image: The new image for the back button.
     - Returns: A modified view with the specified back button image.
     */
    
    @ViewBuilder
    func navigationBarBackButtonImage(_ image: UIImage?) -> some View {
        background {
            NavigationBarBackButtonImageChanger(image: image)
        }
    }
}
