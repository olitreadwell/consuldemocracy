# Personalización de vistas y HTML

Al igual que la mayoría de aplicaciones hechas con Ruby on Rails, Consul Democracy utiliza ficheros ERB para generar HTML. Estos ficheros tradicionalmente se encuentran en el directorio `app/views/`.

A diferencia del [código de Ruby](models.md), [código de CSS](css.md) o [código de JavaScript](javascript.md), no es posible sobrescribir solamente partes de un fichero ERB. Así que, para personalizar una vista, tendrás que encontrar el archivo que quieras cambiar en el directorio `app/views/` y copiarlo en `app/views/custom/`, manteniendo la estructura de subdirectorios, y posteriormente aplicar las personalizaciones. Por ejemplo, si quieres personalizar `app/views/welcome/index.html.erb`, tendrás que copiarlo en `app/views/custom/welcome/index.html.erb`.

Para que sea más fácil llevar la cuenta de tus cambios personalizados, al utilizar el sistema de control de versiones git, recomendamos copiar el archivo original al directorio personalizado en un "commit" (sin modificar este fichero) y modificar el archivo personalizado en otro "commit" distinto. Esto hará que, al actualizar a una nueva versión de Consul Democracy, sea más fácil comprobar las diferencias entre la vista de la versión anterior de Consul Democracy, la vista de la nueva versión de Consul Democracy, y tus cambios personalizados.

Como se ha mencionado anteriormente, el archivo personalizado sobrescribirá el original completamente. Esto quiere decir que, al actualizar a una nueva versión de Consul Democracy, los cambios en el archivo original serán ignorados. Tendrás que comprobar los cambios en el archivo original y aplicarlos a tu fichero personalizado cuando corresponda.

**Nota**: Consul Democracy solamente utiliza el directorio `app/views/` para código escrito antes del año 2021. El código escrito desde entonces se encuentra en el directorio `app/components/`. La razón principal es que los componentes permiten extraer parte de la lógica en un archivo de Ruby, y mantener código Ruby personalizado es más sencillo que mantener código ERB personalizado.

## Personalizar la página de ayuda

La página de ayuda se renderiza con la vista `app/views/pages/help/index.html.erb`, que se muestra al visitar `/help`. Contiene una sección con información sobre cada funcionalidad activada, así como enlaces a las subpáginas `/help/how-to-use` y `/help/faq`.

Hay varias formas de personalizarla:

### Personalizar la vista de la página de ayuda

Como con cualquier otra vista, copia `app/views/pages/help/index.html.erb` en `app/views/custom/pages/help/index.html.erb` y aplica allí tus cambios. Ten en cuenta que la página incluye enlaces a secciones concretas (debates, propuestas, presupuestos, votaciones y procesos) y a las subpáginas `/help/how-to-use` y `/help/faq`, así que asegúrate de que estos enlaces sigan funcionando después de tus cambios.

### Personalizar el controlador de la página de ayuda

La acción `show` de `PagesController` renderiza una página personalizada cuando existe una `SiteCustomization::Page` con el slug correspondiente, y la vista `pages/help/index.html.erb` en caso contrario. Puedes personalizar esta acción creando el archivo `app/controllers/custom/pages_controller.rb` y sobrescribiendo el método `show`, para que `/help` renderice una página distinta. Consulta la sección de [personalización de controladores](controllers.md) para más información.

### Sustituir la página de ayuda usando el panel de administración

Si prefieres no cambiar código, puedes sustituir la página de ayuda usando el panel de administración:

1. Desactiva la funcionalidad "Página de ayuda" en **Configuración > Funcionalidades**.
2. Crea una página personalizada en **Contenido del sitio > Personalizar páginas** con el contenido que quieras y un slug de tu elección (por ejemplo, `how-to`).
3. Añade un bloque de contenido en **Contenido del sitio > Personalizar bloques** llamado "Navegación principal derecha" con un enlace a tu página personalizada (por ejemplo, `<li><a href="/how-to">Ayuda</a></li>`), para que aparezca en la navegación principal donde antes estaba el enlace de ayuda. Si tu sitio utiliza varios idiomas, crea un bloque de contenido similar para cada uno.

Como la funcionalidad "Página de ayuda" está desactivada, la página de ayuda por defecto ya no se mostrará.
