import UIKit

class ResultViewController: UIViewController {
    
    var scoreString = ""
    @IBOutlet weak var score: UILabel!
    var toPass:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        score.text = scoreString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
  
    

}
