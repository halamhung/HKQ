// Khởi tạo hiệu ứng slider bằng javascript
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none"; // Ẩn tất cả các slide
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1} // Lặp lại từ slide đầu tiên
  slides[slideIndex-1].style.display = "block"; // Hiển thị slide hiện tại
  setTimeout(showSlides, 3000); // Thay đổi slide sau mỗi 3 giây
}