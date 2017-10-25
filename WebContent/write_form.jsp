<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/result-light.css">
<style type="text/css">
input {
    font: 14px sans-serif;
}
</style>

<title>�ı� �ۼ�</title>

<script type="text/javascript">

// �����Ϸ��� mouseClick ��ġ �ν��ؼ� �� �κ��� input �����ְ� 
// �ȿ� text�� ���� �� �ְ� �ϸ� �� �� 
// ���� Ŭ���ϸ� ����� �߰�, �ؽ�Ʈ�ڽ��� Ŭ���ϸ� ���� ���� �� �� �ְ� 
// �ð� ������ �����ϰھ��ϴ�,,,

window.onload=function(){
	var canvas = document.getElementById('myCanvas'),
  	ctx = canvas.getContext('2d'),
  	font = '14px sans-serif',
  	hasInput = false,
  	btn = document.getElementById('btn'), 
	// count �� �߰� ��ư�� ���� Ƚ�� 
  	count = 0;
	
	var texts = [];
			
	// �⺻ �������� �����
	ctx.beginPath();
	ctx.arc(100, 100, 3, Math.PI*1.5, Math.PI*4);
	ctx.arc(100, 700, 3, Math.PI*1.5, Math.PI*4);
	ctx.fill();
	ctx.stroke();
	addInput(120, 100-6);
	addInput(120, 700-6);
	
	// �߰� ��ư�� ������ ���� �ؽ�Ʈ �ڽ��� �׷���  
	// �߰� ��ư�� ������ �� ����� �� �� �ؽ�Ʈ�� �� ĭ ���� �ø��� �� + �ؽ�Ʈ�ڽ� �߰� 
	btn.onclick = function(e) {
		if (hasInput) return;
		count++;
		var y = 600/(count+1) + 100;
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		// ��� �׸��� 
		drawPath(y);
	}
	
	function drawPath(y){
		ctx.beginPath();
		ctx.arc(100, 100, 3, Math.PI*1.5, Math.PI*4);
		ctx.arc(100, 700, 3, Math.PI*1.5, Math.PI*4);
		ctx.fill();
		ctx.stroke();
		var textY = 100;
		
		// �ؽ�Ʈ ���� �����
		for(var i=0; i<texts.length; i++){
			var text = texts[i].text;
			drawText(text, 120, textY-6);
			textY += 600/(count+1);
		}
		// ��, �ؽ�Ʈ �ڽ� �߰� 
 		for(var i=0; i<count; i++){
			ctx.beginPath();
			ctx.arc(100, y, 3, Math.PI*1.5, Math.PI*4);
			ctx.fill();
			ctx.stroke();
			y += 600/(count+1);
 		}
 		addInput(120, 700-6);
	}
	
	function addInput(x, y) {
 		// input element ���� 
 		var input = document.createElement('input');
  
		input.type = 'text';
		input.style.position = 'fixed';
		input.style.left = (x+870) + 'px';
		input.style.top = y + 'px';

 		// ����ڰ� Ű������ Ű�� ���� �� �߻� 
		input.onkeydown = handleEnter;
  
 		// body�� input �ֱ� 
		document.body.appendChild(input);

		input.focus();
  
		hasInput = true;
	}

	// Ű������ Ű�� ������ �� 
	function handleEnter(e) {
		var keyCode = e.keyCode;
		// ���� ����ڰ� ���� ������ drawText �ϰ� 
  		if (keyCode === 13) {
  	   		// �ؽ�Ʈ�� �׸��� �ؽ�Ʈ�ڽ��� �����
      		drawText(this.value, parseInt(this.style.left, 10)-870, parseInt(this.style.top, 10));
  	    	// texts �迭�� �� �ֱ�
  	  	  	texts.push({
  	    		text: this.value
  	  		  });
     		document.body.removeChild(this);
      		hasInput = false;
  		}
	}
	
	// canvas�� text �׸��� 
	function drawText(txt, x, y) {
		ctx.textBaseline = 'top';
  		ctx.textAlign = 'left';
  		ctx.font = font;
  		ctx.fillText(txt, x - 4, y - 4);
	}
} 
</script>
</head>
<body>
<div class="row">
	<div class="col-md-8">
		<form action="/servlet" method="post"> 
		<table width="100%"> 
			<tr>
				<td>����</td>
				<td><input type="text" id="title" name="title" /></td>
			</tr> 
			<tr>
				<td>����</td>
				<td>���� ���⿡ ���������͸� ������......</td>
			</tr>
			<tr> 
				<td colspan="2">
					<input type="submit" value="�ۼ�"/> 
					<input type="button" value="���"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div class="col-md-4">
		<canvas id="myCanvas" width="400" height="800"></canvas>
		<button id="btn" type="button" class="btn btn-default btn-lg">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> ��� �߰�
		</button>
	</div>
</div>
</body>
</html>