# RickiMorty_Api

## Descripción del proyecto

RickiMorty_Api es una aplicación multiplataforma (Flutter) que consume la API oficial de Rick and Morty para mostrar personajes, episodios y detalles relacionados. La interfaz proporciona:

- Exploración de personajes con buscador.
- Visualización en tarjetas y diseño responsive tipo grid.
- Navegación fluida entre pantallas y detalles de cada personaje.
- Integración con provider y servicios de API para manejo de estado y datos.

Esta aplicación es un ejemplo completo de consumo de API REST en Flutter, arquitectura por capas (models/providers/services) y buenas prácticas en UI/UX para mobile/web/desktop.

## Instrucciones de instalación

1. Asegúrate de tener Flutter instalado y configurado en tu equipo. Verifica con:

   ```bash
   flutter doctor
   ```

2. Abre una terminal en la carpeta raíz del proyecto:

   ```bash
   cd c:\Users\sarit\proyecto\RickiMorty_Api
   ```

3. Descarga las dependencias:

   ```bash
   flutter pub get
   ```

## Ejecución

- Para Android:

  ```bash
  flutter run
  ```

- Para web:

  ```bash
  flutter run -d chrome
  ```

- Para desktop (Windows/macOS/Linux):

  ```bash
  flutter run -d windows
  ```

## Estructura del proyecto

- `lib/models/`: modelado de datos (character/episode).
- `lib/providers/`: lógica de estado y conexión a API.
- `lib/screens/`: pantallas principales (home, favoritos, personaje).
- `lib/services/`: servicios HTTP y búsqueda.

## Captura de pantalla

### screen Home

![screen Home](/web/Img/Home.png)

### screen busqueda

![screen busqueda](/web/Img/Busqueda.png)

### screen favoritos

![screen Favoritos](/web/Img/Favoritos.png)