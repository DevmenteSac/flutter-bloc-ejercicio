# Proyecto de ejercicio para aprender arquitectura BLoC en Flutter

En este proyecto se crea un counter y un gestor de usuario simple para aprender a gestionar los estados de estas 2 funcionalidades e implementar arquitectura BLoC con gestion de bases de datos, para entender como funciona, todo esto con la ayuda de la libreria flutter_bloc.

![Screen Counter](assets\1.png)
![Screen Counter](assets\2.png)
![Screen Counter](assets\3.png)
![Screen Counter](assets\4.png)

## Temas clave

- MultiBlocProvider, widget de Flutter que proporciona proveedores bloc a sus hijos.
- BlocBuilder, widget de Flutter que maneja la construcción del widget en respuesta a nuevos estados.
- BlocConsumer, widget de Flutter que maneja la construcción del widget y para ejecutar acciones en respuesta a nuevos estados.
- Bloc
- Agregar eventos con context.read<>.add()
- Estructura BLoC


## Configuracion
```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_bloc: ^8.1.6
  meta: ^1.15.0
  shared_preferences: ^2.3.3
```
## Estructura del Proyecto
La aplicación utiliza una estructura de directorio basada en BLoC. Esta estructura de proyecto nos permite escalar el proyecto al tener separada la logica y la UI.


```plaintext
└── 📁lib
    └── 📁bloc
        └── 📁counter
            └── counter_bloc.dart
            └── counter_event.dart
            └── counter_state.dart
        └── 📁user
            └── user_bloc.dart
            └── user_event.dart
            └── user_state.dart
    └── 📁data
        └── 📁models
            └── user_model.dart
        └── 📁providers
            └── user_shared_preferences.dart
        └── 📁repositories
            └── user_repository.dart
    └── 📁utils
        └── 📁dialogs
            └── showInputDialog.dart
    └── main.dart
    └── my_app.dart
    └── my_home_page.dart
```


## Instalación
Sigue estos pasos para instalar y ejecutar el proyecto en tu máquina local:


1. Clona el repositorio:


   ```bash
   git clone https://github.com/DevmenteSac/flutter-bloc-ejercicio
    ```


2. Navega al directorio:


    ```bash
    cd flutter-bloc-ejercicio
    ```


3. Instala las dependencias:


    ```bash
    flutter pub get
    ```


4. Ejecuta la aplicación:


    ```bash
    flutter run
    ```


## Contacto
Devmente Sac - [devmentesacontacto@gmail.com](mailto:devmentesacontacto@gmail.com)  
GitHub: [DevmenteSac](https://github.com/DevmenteSac)