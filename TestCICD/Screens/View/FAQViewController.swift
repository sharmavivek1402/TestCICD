//
//  FAQViewController.swift
//  TestCICD
//
//  Created by APPLE on 30/08/26.
//

import UIKit

class FAQViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private let viewModel =  FAQViewModel()
    var faqData: [FAQItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.registerNibs()
        // Do any additional setup after loading the view.
    }
    
    private func bindViewModel() {
        viewModel.onFaqLoaded = { [weak self] data in
            DispatchQueue.main.async {
                self?.faqData = data.faqs ?? []
                self?.tableView.reloadData()

            }

        }

        viewModel.onError = { error in
            //AlertHelper.showAlert(on: self, title: "Error", message: error)
        }

        self.viewModel.fetchFAQDataFromServer()

    }

    fileprivate func registerNibs() {
        self.tableView.register(UINib(nibName: "FAQTableViewCell", bundle: nil), forCellReuseIdentifier: "FAQTableViewCell")
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }



}
extension FAQViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if self.faqData.count != 0{
            return self.faqData.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "FAQTableViewCell",
            for: indexPath
        ) as? FAQTableViewCell else {
            fatalError("Could not dequeue FAQTableViewCell")
        }
        cell.selectionStyle = .none
        // configure cell here

        let item = faqData[indexPath.row]
        cell.configure(with: item)
        cell.arrowButtonAction = { [weak self] in
            guard let self = self else { return }
            faqData[indexPath.row].isExpanded.toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return faqData[indexPath.row].isExpanded ? UITableView.automaticDimension : 90
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        faqData[indexPath.row].isExpanded.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
