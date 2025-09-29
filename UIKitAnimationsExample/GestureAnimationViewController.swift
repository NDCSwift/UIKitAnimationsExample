//
    // Project: UIKitAnimationsExample
    //  File: GestureAnimationViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import UIKit

class GestureAnimationViewController: UIViewController {
    let cardView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }

    func setupCard() {
        cardView.frame = CGRect(x: 50, y: 600, width: 300, height: 200)
        cardView.backgroundColor = .systemPink
        view.addSubview(cardView)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        cardView.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            cardView.transform = CGAffineTransform(translationX: 0, y: translation.y)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, animations: {
                self.cardView.transform = .identity
            })
        }
    }
}