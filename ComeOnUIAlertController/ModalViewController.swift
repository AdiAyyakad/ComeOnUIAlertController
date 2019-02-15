/// Copyright 2012-2019 (C) Butterfly Network, Inc.

import UIKit

class ModalViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(dismissModalSelf), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    deinit {
        NSLog("This is never called")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc private func dismissModalSelf() {
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {
                    return NSLog("Lost reference to self before presented alert")
                }

                if self.isBeingDismissed {
                    NSLog("Presenting while being dismissed")
                }

                self.present(
                    self.alert(),
                    animated: true,
                    completion: nil
                )
            }
        }

        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    private func alert() -> UIAlertController {
        let alert = UIAlertController(title: "Some title", message: "Some message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }

}
