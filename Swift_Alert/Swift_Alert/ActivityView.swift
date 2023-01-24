//
//  ActivityView.swift
//  Swift_Alert
//
//  Created by coder on 21.01.2023.
//

import SwiftUI

/// АктивитиВью
struct ActivityView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    
    // MARK: - Public Properties
    
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?

    // MARK: - Public Methods
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return vc
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
