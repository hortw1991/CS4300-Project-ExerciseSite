/* Example function to create a new "article of the day" on the main page.
 */
function addArticleOfDay() {
	// div
	let outerDiv = document.createElement('div');
	let outerDivClass = "media pb-4";
	outerDiv.className = outerDivClass;

	// img
	let img = document.createElement('img');
	let imgId = "small-main-picture";
	let imgSrc = "./assets/deadlift.jpeg";
	let imgClass = "align-self-start mr-3";
	let imgAlt = "img here";
	img.id = imgId;
	img.src = imgSrc;
	img.className = imgClass;
	img.alt = imgAlt;

	// inner div
	let innerDiv = document.createElement('div');
	let innerDivClass = "media-body";
	innerDiv.className = innerDivClass;

	// heading 5
	let h5 = document.createElement('h5');
	let h5Class = "mt-0";
	h5.innerHTML = "Exercise of the Day: Not Deadlift"
	h5.className = h5Class;

	// paragraphs
	let p1 = document.createElement('p');
	p1.innerHTML = "You probably should deadlift though";
	
	outerDiv.appendChild(img);
	outerDiv.appendChild(innerDiv);
	innerDiv.appendChild(h5);
	innerDiv.appendChild(p1);

	let body = document.getElementsByTagName("body")[0];
	body.appendChild(outerDiv);
	
}