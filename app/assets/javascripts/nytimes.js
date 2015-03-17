console.log('nytimes.js running')

var baseURL = "/nytimes";

function getResults() {

  $.ajax({
    url: baseURL,
    dataType: 'json',
    success: 
    renderResults
  });
};


function renderResults(data){
	// debugger;
	// var article = {
	// 	abstract: data["results"][0]["abstract"],
	// 	byline: data["results"][0]["byline"],
	// 	title: data["results"][0]["title"],
	// 	url: data["results"][0]["url"],
	// 	created_date: data["results"][0]["created_date"]
	// }
	var ul = document.getElementById('nytimes');
	for (var i = 0; i < 19; i++){
		var li = document.createElement("li");
		var nytdiv = document.createElement('div');
		li.appendChild(nytdiv);
		ul.appendChild(li);

		var link = document.createElement('a');
		link.setAttribute("href", (data["results"][i]["url"]));
		link.setAttribute("target", "_blank");
		nytdiv.appendChild(link);
		var headline = document.createElement('h3');
		headline.innerHTML = data["results"][i]["title"];
		link.appendChild(headline);

		var abstract = document.createElement('p');
		abstract.innerHTML = data["results"][i]["abstract"];
		nytdiv.appendChild(abstract);
		// var br = document.createElement("br");
		// li.appendChild(br);
	}
}

getResults();