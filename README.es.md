# Tap de Homebrew para Kuali

[English](README.md) · **Español**

Este tap instala la versión oficial de
[Kuali](https://github.com/igarrux/kuali) para macOS. Kuali transcribe reuniones
localmente y conserva la atribución en vivo de cada participante en Discord y
llamadas del navegador.

## Instalar

```sh
brew install --cask igarrux/kuali/kuali
xattr -dr com.apple.quarantine /Applications/Kuali.app
```

El nombre completo hace que Homebrew confíe únicamente en el cask de Kuali y
añada el tap automáticamente. Actualmente requiere macOS 11 o posterior en un
Mac con Apple Silicon.

Kuali está firmado de manera ad hoc, pero aún no está notarizado por Apple. El
segundo comando elimina explícitamente el atributo de cuarentena únicamente de
`Kuali.app`. Revísalo y ejecútalo solo si confías en este repositorio y en la
release enlazada.

## Actualizar

```sh
brew update
brew upgrade --cask kuali
```

## Desinstalar

Eliminar solamente la aplicación:

```sh
brew uninstall --cask kuali
```

Eliminar la aplicación y los datos guardados por Kuali en sus ubicaciones
predeterminadas:

```sh
brew uninstall --cask --zap kuali
```

La limpieza completa no elimina archivos ajenos ni modelos trasladados a una
carpeta externa personalizada.

## Licencia

El tap está disponible bajo la [licencia MIT](LICENSE). Las licencias de Kuali
se encuentran en el [repositorio principal](https://github.com/igarrux/kuali#license).
