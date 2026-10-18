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
function renderPokemon(data) {
    const types = data.types.map(t => t.type.name).join(', ');
    
    pokemonCard.innerHTML = `
        <h2>${data.name.toUpperCase()} (#${data.id})</h2>
        <img src="${data.sprites.front_default}" alt="${data.name}">
        <p><strong>Tipo:</strong> ${types}</p>
        <p><strong>Altura:</strong> ${data.height / 10} m</p>
        <p><strong>Peso:</strong> ${data.weight / 10} kg</p>
    `;
}