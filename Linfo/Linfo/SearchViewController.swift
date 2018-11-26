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
    
    @IBAction func serchForUser(_ sender: UIButton) {
        viewModel.getUserStatistic(userName: textField.text!) { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
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
        // Do any additional setup after loading the view.
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
        
        if let user = user {
            switch indexPath.row {
            case 0:
                cell.viewModel = GameTypeViewModelCell(gameType: "Blitz", gameResults: user.perfs.blitz)
            case 1:
                cell.viewModel = GameTypeViewModelCell(gameType: "Bullet", gameResults: user.perfs.bullet)
            case 2:
                cell.viewModel = GameTypeViewModelCell(gameType: "Classical", gameResults: user.perfs.classical)
            case 3:
                cell.viewModel = GameTypeViewModelCell(gameType: "Correspondence", gameResults: user.perfs.correspondence)
            case 4:
                cell.viewModel = GameTypeViewModelCell(gameType: "Puzzle", gameResults: user.perfs.puzzle)
            case 5:
                cell.viewModel = GameTypeViewModelCell(gameType: "Rapid", gameResults: user.perfs.rapid)
            default:
                break
            }
        }
        
        return cell
    }
    
    
}
