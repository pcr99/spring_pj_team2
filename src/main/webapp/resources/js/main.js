/**
 * 
 */
     	document.addEventListener('DOMContentLoaded', (event) => {
        const wrapper = document.querySelector('.hero-content-wrapper');
        const slides = document.querySelectorAll('.hero-content');
        const totalSlides = slides.length;
        let currentIndex = 0;

        function showSlide(index) {
            const newTransform = -index * 100 + '%';
            wrapper.style.transform = `translateX(${newTransform})`;
        }

        function nextSlide() {
            currentIndex = (currentIndex + 1) % totalSlides;
            showSlide(currentIndex);
        }

        function prevSlide() {
            currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
            showSlide(currentIndex);
        }

        document.getElementById('next').addEventListener('click', nextSlide);
        document.getElementById('prev').addEventListener('click', prevSlide);

        // Set the interval for auto sliding
        setInterval(nextSlide, 3000); // Change slide every 3 seconds
    	});
        function slideIn() { 
            const heroOverlay = document.querySelector('.hero-overlay');
            heroOverlay.style.animation = 'none';
            setTimeout(() => {
                heroOverlay.style.animation = '';
                heroOverlay.style.animation = 'slideIn 1s ease-out forwards';
            }, 10);
        }

        // 일정 시간 간격으로 슬라이딩 애니메이션 실행
        setInterval(slideIn, 5000); // 5초마다 슬라이딩