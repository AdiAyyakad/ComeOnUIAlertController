/// Copyright 2012-2019 (C) Butterfly Network, Inc.

import UIKit

class ViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Unknown"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present modally?", for: .normal)
        button.addTarget(self, action: #selector(presentModally), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        [label, button].forEach(view.addSubview(_:))
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            button.centerXAnchor.constraint(equalTo: label.centerXAnchor),
            button.topAnchor.constraint(
                equalTo: label.bottomAnchor,
                constant: 50
            ),
        ])
    }

    private weak var viewController: UIViewController?

    @objc private func presentModally() {
        guard viewController == nil else {
            label.text = "The view controller still exists!!"
            return
        }

        let vc = ModalViewController(nibName: nil, bundle: nil)
        viewController = vc
        self.present(vc, animated: true, completion: nil)
    }

}

