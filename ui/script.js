// HUD Initialization
const healthBar = document.getElementById('health-bar');
const staminaBar = document.getElementById('stamina-bar');

// Listen for messages from FiveM
window.addEventListener('message', (event) => {
  const data = event.data;

  if (data.type === 'updateHealth') {
    updateHealthBar(data.health);
  }

  if (data.type === 'updateStamina') {
    updateStaminaBar(data.stamina);
  }
});

// Update Health Bar
function updateHealthBar(health) {
  healthBar.style.width = `${health}%`;
}

// Update Stamina Bar
function updateStaminaBar(stamina) {
  staminaBar.style.width = `${stamina}%`;
}

document.addEventListener('DOMContentLoaded', () => {
  fetch('/config')
    .then(response => response.json())
    .then(config => {
      // Set health bar properties
      document.getElementById('health-icon').src = config.healthIcon;
      document.getElementById('health-bar').style.backgroundColor = config.healthColor;
      document.getElementById('health-bar-container').style.top = config.healthPosition.top;
      document.getElementById('health-bar-container').style.left = config.healthPosition.left;

      // Set stamina bar properties
      document.getElementById('stamina-icon').src = config.staminaIcon;
      document.getElementById('stamina-bar').style.backgroundColor = config.staminaColor;
      document.getElementById('stamina-bar-container').style.top = config.staminaPosition.top;
      document.getElementById('stamina-bar-container').style.left = config.staminaPosition.left;

      // Set minimap properties
      document.getElementById('minimap').style.bottom = config.minimapPosition.bottom;
      document.getElementById('minimap').style.right = config.minimapPosition.right;
      document.getElementById('minimap').style.backgroundColor = config.minimapColor;
      document.getElementById('minimap').style.borderColor = config.minimapBorderColor;
    })
    .catch(error => console.error('Error loading config:', error));
});
