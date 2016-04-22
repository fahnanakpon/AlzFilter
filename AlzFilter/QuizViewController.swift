import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var count=0
    var q1=0
    var q2=0
    var q3=0
    var q4=0
    var q5=0
    var q6=0
    var q7=0
    var q8=0
    var q9=0
    var q10=0
    var q11=0
    
    @IBOutlet weak var question1: UISegmentedControl!
    @IBOutlet weak var question2: UISegmentedControl!
    @IBOutlet weak var question3: UISegmentedControl!
    @IBOutlet weak var question4: UISegmentedControl!
    @IBOutlet weak var question5: UISegmentedControl!
    @IBOutlet weak var question6: UISegmentedControl!
    @IBOutlet weak var question7: UISegmentedControl!
    @IBOutlet weak var question8: UISegmentedControl!
    @IBOutlet weak var question9: UISegmentedControl!
    @IBOutlet weak var question10: UISegmentedControl!
    @IBOutlet weak var question11: UISegmentedControl!
    
    
    @IBOutlet weak var pointLabel: UILabel!
    

    @IBAction func submit(sender: UIButton) {
        count = question1.selectedSegmentIndex+question2.selectedSegmentIndex+question3.selectedSegmentIndex+question4.selectedSegmentIndex+question5.selectedSegmentIndex+question6.selectedSegmentIndex+question7.selectedSegmentIndex+question8.selectedSegmentIndex+question9.selectedSegmentIndex+question10.selectedSegmentIndex+question11.selectedSegmentIndex
        pointLabel.text = String(count)
    }
    
    

    
}