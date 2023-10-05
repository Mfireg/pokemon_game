import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["health", "pokemonCapturesFrame", "throwPokeball", "attack", "pokemonId", "pokemonName", "pokemonElement"];
  
  attack() {
    const damage = this.calculate_damage();
    this.healthTarget.textContent = this.healthTarget.textContent - damage;
  }

  calculate_damage() {
    const min = 1;
    const max = 38;

    const randomNumber = Math.floor(Math.random() * (max - min + 1)) + min;
    return randomNumber;
  }

  async throw_a_pokeball() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const url = 'characters/1/throw_pokeball';
    const data = {
      pokemon_id: Number(this.pokemonIdTarget.textContent),
      pokemon_name: this.pokemonNameTarget.textContent,
      pokemon_element: this.pokemonElementTarget.textContent
    };

    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      body: JSON.stringify(data),
    });

    if (response.ok) {
      // TODO => let redirectURL = ''; 
      const captured = await response.json();
      this.throwPokeballTarget.disabled = true;
      this.attackTarget.disabled = true;

      if (captured) {
        this.pokemonCapturesFrameTarget.innerHTML = 'Pokemon captured!';
      } else {
        this.pokemonCapturesFrameTarget.innerHTML = 'You were not lucky this time.';
      }
    }
  }
}