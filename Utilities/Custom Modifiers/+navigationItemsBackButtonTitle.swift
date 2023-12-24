//
//  +navigationItemBackButtonTitle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 23/12/2023.
//

import SwiftUI

public extension UIView {
    /// Returns the nearest parent view controller for the current view.
    var parentViewController: UIViewController? {
        sequence(first: self) {
            $0.next
        }.first { $0 is UIViewController } as? UIViewController
    }
}

/**
 A SwiftUI view  that changes the back button title of the navigation bar for the current view.
 
 This creates a hidden `UIView` and uses it to update the back button title asynchronously.
 The title change is delayed by a small amount to ensure that the view hierarchy is updated appropriately.
 
 - Parameter title: The new title for the back button.
 */
@available(iOS 15.0, *)
private struct NavigationItemBackButtonTitleChanger: UIViewRepresentable {
    let title: String
    
    func makeUIView(context: Context) -> some UIView { UIView() }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            uiView.parentViewController?.navigationItem.backButtonTitle = title
        }
    }
}

/**
 A SwiftUI view  that changes the back button title of the navigation bar for the current view
 and its parent views in a navigation stack.
 
 This  creates a hidden `UIView` and uses it to update the back button title asynchronously.
 The title change is delayed by a small amount to ensure that the view hierarchy is updated appropriately.
 Additionally, it sets a coordinator to handle navigation controller delegate methods for updating
 the back button title in the entire navigation stack.
 
 - Parameter title: The new title for the back button.
 */
@available(iOS 15.0, *)
private struct NavigationItemsBackButtonTitleChanger: UIViewRepresentable {
    let title: String
    
    func makeUIView(context: Context) -> some UIView { UIView() }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
            uiView.parentViewController?.navigationItem.backButtonTitle = title
            uiView.parentViewController?.navigationController?.delegate = context.coordinator
        }
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    /**
     A coordinator class that conforms to `UINavigationControllerDelegate` to handle
     navigation controller delegate methods for updating the back button title in the entire stack.
     */
    class Coordinator: NSObject, UINavigationControllerDelegate {
        let parent: NavigationItemsBackButtonTitleChanger
        
        init(parent: NavigationItemsBackButtonTitleChanger) {
            self.parent = parent
        }
        
        func navigationController(_ navigationController: UINavigationController,
                                  willShow viewController: UIViewController, animated: Bool) {
            viewController.navigationItem.backButtonTitle = parent.title
        }
    }
}

@available(iOS 15.0, *)
public extension View {
    /**
     Sets the back button title for the current view in a navigation stack.
     
     - Parameter title: The new title for the back button.
     */
    @ViewBuilder
    func navigationItemBackButtonTitle(_ title: String) -> some View {
        background {
            NavigationItemBackButtonTitleChanger(title: title)
        }
    }
    
    /**
     Sets the back button title for the current view and its all  views that will appear in a navigation stack.
     
     - Parameter title: The new title for the back button.
     - Returns: A modified view with the specified back button title.
     */
    @ViewBuilder
    func navigationItemsBackButtonTitle(_ title: String) -> some View {
        background {
            NavigationItemsBackButtonTitleChanger(title: title)
        }
    }
}
