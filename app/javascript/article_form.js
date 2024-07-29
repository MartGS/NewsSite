function saveData(step) {
  const formData = new FormData(document.querySelector('form'));
  localStorage.setItem('articleData', JSON.stringify(Object.fromEntries(formData)));
}

function nextStep(currentStep) {
  saveData(currentStep);
  toggleStep(currentStep, currentStep + 1);
}

function prevStep(currentStep) {
  toggleStep(currentStep, currentStep - 1);
}

function toggleStep(hide, show) {
  document.getElementById(`step-${hide}`).style.display = 'none';
  document.getElementById(`step-${show}`).style.display = 'block';
}

window.addEventListener('DOMContentLoaded', () => {
  const savedData = localStorage.getItem('articleData');
  if (savedData) {
    document.querySelector('form').elements.namedItem('article[title]').value = JSON.parse(savedData).get('article[title]');
    document.querySelector('form').elements.namedItem('article[source]').value = JSON.parse(savedData).get('article[source]');
    document.querySelector('form').elements.namedItem('article[link]').value = JSON.parse(savedData).get('article[link]');
    document.querySelector('form').elements.namedItem('article[html]').value = JSON.parse(savedData).get('article[html]');
    document.querySelector('form').elements.namedItem('article[category_id]').value = JSON.parse(savedData).get('article[category_id]');
    document.querySelector('form').elements.namedItem('article[age_group]').value = JSON.parse(savedData).get('article[age_group]');
  }
});