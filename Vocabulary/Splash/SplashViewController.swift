//
//  SplashViewController.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//


import UIKit

class SplashViewController: UIViewController {

    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "SplashImage"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        animateSplash()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            SpeachManager.shared.warmUp()
            UIImpactFeedbackGenerator.warmUp()
        }
    }

    private func setupUI() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    private func animateSplash() {
        logoImageView.alpha = 0
        UIView.animate(withDuration: 1.0, animations: {
            self.logoImageView.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                self.logoImageView.alpha = 0
            }) { _ in
                self.showMainScreen()
            }
        }
    }

    private func showMainScreen() {
        guard let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate else { return }

        let rootViewController: UIViewController

        if TutorialStorage.hasSeen(.home) {
            rootViewController = navigateToHome()
        } else {
            rootViewController = navigateToWelcome()
        }

        let navController = UINavigationController(rootViewController: rootViewController)
        sceneDelegate.window?.rootViewController = navController
        sceneDelegate.window?.makeKeyAndVisible()
    }

    
    private func navigateToHome() -> UIViewController {
        let homeVC = HomeViewController(
            nibName: "HomeViewController",
            bundle: nil
        )
        let router = HomeRouter(viewController: homeVC)
        let repository = HomeRepository()
        let viewModel = HomeViewModel(router: router, repository: repository)
        homeVC.viewModel = viewModel
        return homeVC
    }
    private func navigateToWelcome() -> UIViewController {
        let welcomeVC = WelcomeViewController(
            nibName: "WelcomeViewController",
            bundle: nil
        )
        let router = WelcomeRouter(viewController: welcomeVC)
        let viewModel = WelcomeViewModel(router: router)
        welcomeVC.viewModel = viewModel
        return welcomeVC
    }

}
