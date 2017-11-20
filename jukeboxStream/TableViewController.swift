//
//  TableViewController.swift
//  jukeboxStream
//
//  Created by Chris Swinson on 11/2/17.
//  Copyright © 2017 Chris Swinson. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TableViewController: UITableViewController {
    var responseArray = [[String:Any]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/10/explicit.json").responseJSON { response in
            if let json = response.result.value as? [String:Any],
                let feed = json["feed"] as? [String:Any],
                let results = feed["results"] as? [[String:Any]] {
                self.responseArray = results
                self.tableView.reloadData()
            }
        }
        self.tableView.rowHeight = 100
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"applecolor")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return responseArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "top10", for: indexPath) as? CustomTableViewCell
        
        // Configure the cell...
        let song = responseArray[indexPath.row]
        cell?.songName.text = song["name"] as? String
        cell?.singerName.text = song["artistName"] as? String
        if let artWorkUrl100 = song["artworkUrl100"] as? String{
            Alamofire.request(artWorkUrl100).responseImage(completionHandler: { (response) in
                if let image = response.result.value {
                    DispatchQueue.main.async {
                        cell?.albumCover.image = image
                    }
                }
            })
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let artistUrl = responseArray[indexPath.row]["artistUrl"], let viewController = storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
            viewController.url = artistUrl as? String
            present(viewController, animated: true, completion: nil)
        }
        
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

