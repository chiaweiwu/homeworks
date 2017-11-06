document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = "rgb(206,93,123)";
  ctx.fillRect(0, 0, 200, 300);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "rgb(255,229,189)";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "rgb(236,155,159)";
  ctx.fill();
  ctx.moveTo(75,50);
  ctx.lineTo(100,75);
  ctx.lineTo(100,25);
  ctx.fill();
});
