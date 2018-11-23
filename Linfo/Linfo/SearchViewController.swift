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
        networking.performNetworkTask(endpoint: LichessApi.user(user: textField.text!), type: User.self) { [weak self] user in
            self?.user = user
        }
        view.endEditing(true)
    }
    
    private let networking = Networking()
    
    @IBOutlet weak var textField: UITextField!
    
    private var user: User? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print(self.user)
            }
        }
    }
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)

        if let user = user {
            cell.textLabel?.text = String(user.perfs.blitz.rating)
            cell.detailTextLabel?.text = String(user.perfs.blitz.prog)
        }
        
        return cell
    }
    
    
}
