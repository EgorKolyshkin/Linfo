//
//  SearchViewController.swift
//  Linfo
//
//  Created by Егор on 23/11/2018.
//  Copyright © 2018 Егор. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activiryIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorView: UIView!
    
    @IBAction func serchForUser(_ sender: UIButton) {
        self.activiryIndicator.startAnimating()
        viewModel.getUserStatistic(userName: textField.text!) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activiryIndicator.stopAnimating()
                self?.activityIndicatorView.isHidden = true
            }
        }
        view.endEditing(true)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    private var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as? GameTypeTableViewCell else { return UITableViewCell() }
        
        cell.viewModel = viewModel.cellViewModel(for: indexPath.row)
        
        return cell
    }
    
    
}
