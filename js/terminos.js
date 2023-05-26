const checkbox = document.getElementById('box');
const boton = document.getElementById('miBoton');

checkbox.addEventListener('change', function() {
    boton.disabled = !checkbox.checked;
});