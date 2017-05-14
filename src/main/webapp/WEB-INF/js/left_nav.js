out = 0;
btNum = 5;
function fade() {
	if(out == 0) {
		out = 1;
		for(var i = 1; i <= btNum; ++i) {
			var bt = "#b" + i.toString();
			var moveHeight = (50 + (i * 60) + 5).toString() + 'px';
			var moveSpeed = (30 + (i - 1) * 20);
			$(bt).animate({ top: moveHeight }, moveSpeed);
			$(bt).animate({ top: '-=1px' }, moveSpeed);
		}
	} else {
		out = 0;
		for(var i = 1; i <= btNum; ++i) {
			var bt = "#b" + i.toString();
			var moveSpeed = (30 + (i - 1) * 20);
			$(bt).animate({ top: '50px' }, moveSpeed);
		}
	}
	showInfo();
}

function fadeMenu() {
	var MainButton = document.getElementById('bmain');
	MainButton.addEventListener('click', fade);
}

function showInfo() {
	for(var i = 1; i <= btNum; ++i) {
		var bt = 'b' + i.toString();
		var Bt = document.getElementById(bt);
		var Height = (50 + (i * 60) + 10).toString() + 'px';
		var info = '#i' + i.toString();
		$(info).css('top', Height);
		if(out == 0) {
			$(info).css('opacity', '0');
		} else {
			$(info).css('opacity', '0.5');
		}
	}
}