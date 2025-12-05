# challenge_crypto_tracker_lite

**Versión:** `1.0.0+1`  
**Descripción:** Challenge para aplicar a posición Front End (Puul).  
**SDK:** `Dart ^3.10.1` + `Flutter`

> Aplicación Flutter para visualizar datos del mercado de criptomonedas con arquitectura limpia, navegación con `go_router`, manejo de estado con `flutter_bloc`, gráficos con `fl_chart`, persistencia local con `shared_preferences` y DI con `get_it`.

---

## Tabla de contenido

- [Características](#características)
- [Stack técnico](#stack-técnico)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Requisitos de entorno](#requisitos-de-entorno)
- [Configuración inicial](#configuración-inicial)
- [Compilación de archivos autogenerados](#compilación-de-archivos-autogenerados)
- [Ejecución](#ejecución)
  - [Android](#android)
  - [iOS](#ios)
- [Scripts útiles](#scripts-útiles)
- [Convenciones y lint](#convenciones-y-lint)
- [Assets](#assets)
- [Solución de problemas](#solución-de-problemas)
- [Licencia](#licencia)

---

## Características

- Arquitectura por capas (core, data, domain, presentation).
- Navegación declarativa con `go_router`.
- Estado y lógica con `flutter_bloc`.
- Gráficas interactivas con `fl_chart`.
- Persistencia ligera con `shared_preferences`.
- Inyección de dependencias con `get_it`.
- Modelos inmutables y serialización con `freezed`/`json_serializable`.
- Internacionalización básica con `intl`.

---

## Stack técnico

**Dependencias principales:**

- `flutter` (SDK)
- `cupertino_icons ^1.0.8`
- `freezed_annotation ^3.1.0`
- `go_router ^17.0.0`
- `flutter_bloc ^9.1.1`
- `shared_preferences ^2.5.3`
- `fl_chart ^1.1.1`
- `json_annotation ^4.9.0`
- `dio ^5.9.0`
- `get_it ^9.1.1`
- `nested ^1.0.0`
- `intl ^0.20.2`

**Dependencias de desarrollo:**

- `flutter_test` (SDK)
- `flutter_lints ^6.0.0`
- `build_runner ^2.10.4`
- `freezed ^3.2.3`
- `json_serializable ^6.11.2`

---

## Estructura del proyecto

```
lib/
├─ core/
│  ├─ utils/
│  ├─ widgets/
│  └─ core.dart
├─ data/
│  ├─ datasource/
│  ├─ dto/
│  ├─ interfaces/
│  ├─ repositories/
│  └─ data.dart
├─ domain/
│  ├─ entities/
│  ├─ usecases/
│  └─ domain.dart
├─ presentation/
│  ├─ crypto_details/
│  │  ├─ bloc/
│  │  ├─ di/
│  │  ├─ logics/
│  │  ├─ screens/
│  │  └─ widgets/
│  │
│  ├─ crypto_favorites/
│  ├─ crypto_market/
│  ├─ crypto_market_chart/
│  ├─ crypto_details_index.dart
│  ├─ presentation.dart
│  └─ main.dart
```

---

## Requisitos de entorno

**Android:**

- API Level: 36 (Android 15)
- Java: JDK 17

**iOS:**

- Ruby: 3.14.1
- CocoaPods: 1.16.0
- Xcode: 15+

**Flutter/Dart:**

- Flutter compatible con Dart ^3.10.1

---

## Configuración inicial

```bash
git clone https://github.com/noejego/challenge_crypto_tracker_lite.git
cd challenge_crypto_tracker_lite
flutter clean
flutter pub get
```

Para iOS:

```bash
cd ios
pod install
cd ..
```

---

## Compilación de archivos autogenerados

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Ejecución

### Android

```bash
flutter run -d android
```

### iOS

```bash
flutter run -d ios
```

---

## Scripts útiles

```bash
flutter analyze
flutter test
dart run build_runner build --delete-conflicting-outputs
```

---

## Assets

Declarados en `pubspec.yaml`:

```yaml
assets:
  - assets/images/.
```

---

## Solución de problemas

- Verifica versiones de Ruby y CocoaPods.
- Usa `--delete-conflicting-outputs` en build_runner.

---

## Licencia

Challenge técnico.
