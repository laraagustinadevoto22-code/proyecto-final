(function(){
// Tabs: same markup across pages; highlights current tab
function initTabs(){
const tabs = document.querySelectorAll('#tabs .tab');
tabs.forEach(t=>t.addEventListener('click',()=>{
tabs.forEach(x=>x.classList.remove('active'));
t.classList.add('active');
// navigate to other page if data-href provided
const href = t.dataset.href;
if(href && location.pathname.indexOf(href) === -1){
window.location = href;
}
}));
}


// Carousels
function initCarousel(root){
const track = root.querySelector('.carousel-track');
if(!track) return;
const slides = Array.from(track.children);
let index=0;
const prevNextBtns = root.querySelectorAll('[data-action]');
prevNextBtns.forEach(btn=>btn.addEventListener('click',e=>{
if(e.target.dataset.action==='next') index=(index+1)%slides.length; else index=(index-1+slides.length)%slides.length;
track.style.transform = `translateX(-${index*100}%)`;
}));
// auto-advance (optional): comment out if not desired
// setInterval(()=>{ index=(index+1)%slides.length; track.style.transform = `translateX(-${index*100}%)`; },5000);
}


document.addEventListener('DOMContentLoaded', ()=>{
initTabs();
document.querySelectorAll('.carousel').forEach(initCarousel);


// subscribe modal
const modal = document.getElementById('modal');
const subscribeBtn = document.getElementById('subscribeBtn');
if(subscribeBtn) subscribeBtn.addEventListener('click',()=>modal.style.display='flex');
window.closeModal = function(){ modal.style.display='none'; };
const confirmSub = document.getElementById('confirmSub');
if(confirmSub) confirmSub.addEventListener('click',()=>{
const email = document.getElementById('email').value.trim();
if(!email || !email.includes('@')){ alert('Ingresá un email válido.'); return }
alert('Gracias por suscribirte! — ' + email);
closeModal();
});


// open wattpad
window.openW = function(url){ window.open(url,'_blank'); };


// playAll placeholder
const playAll = document.getElementById('playAll');
if(playAll) playAll.addEventListener('click', ()=>alert('Función reproducir: integrá tu reproductor o playlists.'));


// modal bio & crono buttons fallback
const bioBtn = document.getElementById('btn-bio');
const cronoBtn = document.getElementById('btn-crono');
if(bioBtn){ bioBtn.addEventListener('click', e=>{ e.preventDefault(); document.getElementById('modal-bio').style.display='flex'; }); }
if(cronoBtn){ cronoBtn.addEventListener('click', e=>{ e.preventDefault(); document.getElementById('modal-crono').style.display='flex'; }); }


// close modal by clicking outside
window.addEventListener('click', (e)=>{
if(e.target && e.target.id === 'modal-bio') document.getElementById('modal-bio').style.display = 'none';
if(e.target && e.target.id === 'modal-crono') document.getElementById('modal-crono').style.display = 'none';
if(e.target && e.target.id === 'modal') document.getElementById('modal').style.display = 'none';
});
});
})();





    