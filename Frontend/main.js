import { Server } from "socket.io";

const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

const a = 2 * Math.PI / 6;
const r = 50;

function init() {
    x = r
    y = r
    l = r * Math.cos(Math.PI / 6)
    s = 2 * r * Math.sin(Math.PI / 6) // r
    for (var j = 0; j < 3; j++) {
        drawHexagon(x,y);
        y = y + l
        x = x + (.5 * s) + r
    }
    drawHexagon(x,y);
    // y' -> y + l
    // x' -> x + s/2 + r 
    // drawHexagon(150, 100);
    // drawHexagon(150, 150);
}
function drawHexagon(x, y) {
  ctx.beginPath();
  for (var i = 0; i < 6; i++) {
    ctx.lineTo(x + r * Math.cos(a * i), y + r * Math.sin(a * i));
  }
  ctx.closePath();
  ctx.stroke();
}
init();
