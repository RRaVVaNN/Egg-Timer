
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    

    
    let eggTimes=["Soft": 3, "Medium" :4, "Hard": 7]
    var totalTime=0
    var secondsPassed=0
    var timer=Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var eggLabel: UILabel!
    @IBAction func hardnessSelection(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime=eggTimes[hardness]!
        secondsPassed=0
        progressBar.progress=0.0
        eggLabel.text=hardness

        /*
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsRemaining > 0 {
                print ("\(self.secondsRemaining) seconds")
                self.secondsRemaining -= 1
            } else {
                Timer.invalidate()
                self.eggLabel.text="Done"
            }
        }
        */
        /**/

        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            print("\(secondsPassed) seconds passed")
            let barr=Float(secondsPassed)/Float(totalTime)
            progressBar.progress=barr
            
            print(barr)
        }
        else{
            timer.invalidate()
            eggLabel.text="DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
        
}
