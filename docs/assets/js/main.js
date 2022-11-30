const openMenuAnim = anime({
  targets: "#mobileMenu",
  opacity: [0, 1],
  scale: [0.95, 1],
  direction: "normal",
  loop: false,
  autoplay: false,
  duration: 150,
  easing: "easeOutQuart",
  begin: function (_anim) {
    document.querySelector("#mobileMenu").style.display = "block";
  },
});

const closeMenuAnim = anime({
  targets: "#mobileMenu",
  opacity: [1, 0],
  scale: [1, 0.95],
  direction: "normal",
  loop: false,
  autoplay: false,
  duration: 100,
  easing: "easeInQuart",
  complete: function (_anim) {
    document.querySelector("#mobileMenu").style.display = "none";
  },
});

document.querySelector("#openMenuBtn").onclick = openMenuAnim.play;
document.querySelector("#closeMenuBtn").onclick = closeMenuAnim.play;
