
class Calculette {
  constructor(resultSpan) {
    this.resultSpan = resultSpan
    this.url = resultSpan.dataset.resultUrl
    console.log(this.url);
    window.setTimeout(this.fetchResult.bind(this), 2000)
  }

  fetchResult() {
    let self = this
    let now = new Date()
    window.fetch(self.url).
      then((response) => response.json()).
      then((data) => { 
        var result = data.result
        console.log(result);
        if (result) {
          console.log("Done!");
          self.resultSpan.innerHTML = result;
        } else {
          console.log("Try again...");
          let waitTime = 2000 + 10 * ((new Date()) - now)
          console.log(waitTime)
          window.setTimeout(self.fetchResult.bind(self), waitTime)
        }
      })
  }

  static initialize() {
    var resultSpan = document.getElementById('calculation-result');
    if (resultSpan) {
      new Calculette(resultSpan)
    }
  }
}

document.addEventListener('DOMContentLoaded', Calculette.initialize);
