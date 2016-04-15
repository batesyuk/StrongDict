import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let person = self.loadPerson()
    self.nameLabel.text = person[.name]
    let age: Int = person[.age]!
    self.ageLabel.text = "\(age)"
  }

  private func loadPerson() -> Person {
    let json: [String: AnyObject] = self.loadJSON("Person")
    return Person(dictionary: json)
  }

  private func loadJSON<T>(fileName: String) -> T {
    let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")!
    let data = NSData(contentsOfFile: filePath)!
    return try! NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as! T
  }
  
  private func tryJSONObjectWithData(data: NSData,
                                     options: NSJSONReadingOptions) -> AnyObject? {
    var jsonObject: AnyObject? = nil
    do {
      try jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: options)
    } catch let error as NSError { print(error) }
    return jsonObject
  }

}

