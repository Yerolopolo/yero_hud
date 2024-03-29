function rgba(hex,opacity){
    hex = hex.replace('#','');
    redColor = parseInt(hex.substring(0,2), 16);
    greenColor = parseInt(hex.substring(2,4), 16);
    blueColor = parseInt(hex.substring(4,6), 16);

    result = 'rgba('+redColor+','+greenColor+','+blueColor+','+opacity/100+')';
    return result;
}

var loadJS = function(url, implementationCode, location) {
	var scriptTag = document.createElement('script');
	scriptTag.src = url;

	scriptTag.onload = implementationCode;
	scriptTag.onreadystatechange = implementationCode;

	location.appendChild(scriptTag);
};



function ajaxio(method,url,type=null,data=null) {
	return new Promise((resolve, reject) => {
		const req = new XMLHttpRequest();
		req.open(method, url, true); 

		if (method == 'POST') {
			if (type == 'json' && data != null) {
				req.setRequestHeader('Content-Type', 'application/json');
				var data = JSON.stringify(data);
			}
			else { req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); }
		}

		req.onload = () => req.status === 200 ? resolve(req.response) : reject(Error(req.statusText));
		req.onerror = (e) => reject(Error(`Network Error: ${e}`));

		if (method == 'POST') { req.send(data); }
		else { req.send(); }
	});
}


Object.prototype.addMultiListener = function(eventNames, listener) {
	var events = eventNames.split(' ');

	if (NodeList.prototype.isPrototypeOf(this) == true) {
		for (var x=0, xLen=this.length; x<xLen; x++) {
			for (var i=0, iLen=events.length; i<iLen; i++) { this[x].addEventListener(events[i], listener, false); }
		}
	}

	else if (HTMLElement.prototype.isPrototypeOf(this) == true) {
		for (var i=0, iLen=events.length; i<iLen; i++) { this.addEventListener(events[i], listener, false); }
	}
}


window.onload = function () {

		var eventCallback = {
			ui: function(data) {
				var config = data.config;

				if (config.showHealth == true) { document.querySelector('#health').style.display = 'block'; }
				if (config.showDrunk == true) { document.querySelector('#drunk').style.display = 'block'; }
				if (config.showSress == true) { document.querySelector('#stress').style.display = 'block'; }
				if (config.showHunger == true) { document.querySelector('#hunger').style.display = 'block'; }
				if (config.showThirst == true) { document.querySelector('#thirst').style.display = 'block'; }
			},
			element: function(data) {
				if (data.task == 'enable') { document.querySelector('#'+data.value).style.display = 'block'; }
				else if (data.task == 'disable') { document.querySelector('#'+data.value).style.display = 'none'; }
			},
			setText: function(data) {
				var key = document.querySelector('#'+data.id+' span');
				var html = data.value;
				saferInnerHTML(key, html);
			},
			setLogo: function(data) { document.querySelector('#server img').setAttribute('src', data.value); },
		
			createStatus: function(data) {

				var motherStatus = document.querySelector('div#status ul');

				var statusID = data.status;
				var statusPrimaryColor = rgba(data.color,100);
				var statusSecondaryColor = rgba(data.color,75);
				var statusIcon = data.icon + '<span style="background: linear-gradient(0deg, '+statusSecondaryColor+' 0%, '+statusPrimaryColor+' 100%);"></span>';


				if (document.getElementById(statusID)) { }
				else {
					var newStatus = document.createElement('li');
					newStatus.classList.add('icon', 'customstatus');
					newStatus.id = statusID;

					motherStatus.insertBefore(newStatus, motherStatus.firstChild);

					saferInnerHTML(document.getElementById(statusID), statusIcon);
				}
			},


			setStatus: function(data) {

				if (data.isdead == true) {
					if (document.querySelector('#health').classList.contains('dead') == false) {
						document.querySelector('#health').classList.add('dead');
						for (i = 0; i < data.status.length; i++) { document.querySelector('#'+data.status[i].name+' span').style.height = '0'; }	
					}
				}
				else {
					for (i = 0; i < data.status.length; i++) {
						if ((data.status[i].name == 'hunger') || (data.status[i].name == 'thirst')) { var statusValue = Math.floor(100 - data.status[i].value); }
						else { var statusValue = Math.floor(data.status[i].value); }
						if (document.querySelector('#'+data.status[i].name+' span')) { document.querySelector('#'+data.status[i].name+' span').style.height = statusValue+'%'; }
						if (statusValue <= 35) {
							if (document.querySelector('#'+data.status[i].name)) {
								if (document.querySelector('#'+data.status[i].name).classList.contains('dying') == false) {
									document.querySelector('#'+data.status[i].name).classList.add('dying');	
								}
							}
						}
						else {
							if (document.querySelector('#'+data.status[i].name)) { document.querySelector('#'+data.status[i].name).classList.remove('dying'); }
							
						}
					}
					if (document.querySelector('#health').classList.contains('dead')) { document.querySelector('#health').classList.remove('dead'); }
				}
			},

			
		};

		document.querySelectorAll('.icon i').addMultiListener('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () { this.parentElement.classList.remove('pulse'); this.parentElement.classList.remove('shooting'); });

		window.addEventListener('message', function(event) {
			eventCallback[event.data.action](event.data);
		});

}