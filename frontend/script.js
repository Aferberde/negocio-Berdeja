// Lógica para consumir PokeAPI mediante Fetch API

const searchBtn = document.getElementById('search-btn');
const pokemonInput = document.getElementById('pokemon-input');
const pokemonCard = document.getElementById('pokemon-card');

searchBtn.addEventListener('click', () => {
    const query = pokemonInput.value.trim().toLowerCase();
    
    if (!query) {
        pokemonCard.innerHTML = '<p style="color: red;">Por favor, ingresa un nombre o número.</p>';
        return;
    }

    pokemonCard.innerHTML = '<p>Cargando información...</p>';

    fetch(`https://pokeapi.co/api/v2/pokemon/${query}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Pokémon no encontrado');
            }
            return response.json();
        })
        .then(data => {
            renderPokemon(data);
        })
        .catch(error => {
            pokemonCard.innerHTML = `<p style="color: red;">${error.message}</p>`;
        });
});