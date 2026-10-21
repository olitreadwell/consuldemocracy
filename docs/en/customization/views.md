# Customizing views and HTML

Just like most Ruby on Rails application, Consul Democracy uses ERB templates to render HTML. These templates are traditionally placed in the `app/views/` folder.

Unlike [Ruby code](models.md), [CSS code](css.md) or [JavaScript code](javascript.md), it isn't possible to overwrite only certain parts of an ERB template. So, in order to customize a view, find the correct file under the `app/views/` folder and copy it to `app/views/custom/`, keeping as well any sub-folder structure, and then apply your customizations. For example, to customize `app/views/welcome/index.html.erb`, copy it to `app/views/custom/welcome/index.html.erb`.

In order to keep track of your custom changes, when using git, we recommend copying the original file to the custom folder in one commit (without any modifications) and then modifying the custom file in a different commit. When upgrading to a new version of Consul Democracy, this will make it easier to check the differences between the view in the old version of Consul Democracy, the view in the new version of Consul Democracy, and your custom changes.

As mentioned earlier, the custom file will completely overwrite the original one. This means that, when upgrading to a new version of Consul Democracy, the changes in the original file will be ignored. You'll have to check the changes in the original file and apply them to your custom file if appropriate.

**Note**: Consul Democracy only uses the `app/views/` folder for code written before 2021. Code written since then is placed under the `app/components/` folder. The main reason is that components allow extracting some of the logic to a Ruby file, and maintaining custom Ruby code is easier than maintaining custom ERB code.

## Customizing the help page

The help page is rendered by the `app/views/pages/help/index.html.erb` view, which is shown when visiting `/help`. It contains a section with information about each enabled feature, as well as links to the `/help/how-to-use` and `/help/faq` subpages.

There are several ways to customize it:

### Customizing the help page view

As with any other view, copy `app/views/pages/help/index.html.erb` to `app/views/custom/pages/help/index.html.erb` and apply your changes there. Note that the page includes links to specific sections (debates, proposals, budgets, polls and processes) and to the `/help/how-to-use` and `/help/faq` subpages, so make sure these links keep working after your changes.

### Customizing the help page controller

The `show` action in `PagesController` renders a custom page when a `SiteCustomization::Page` with the matching slug exists, and the `pages/help/index.html.erb` view otherwise. You can customize this action by creating the file `app/controllers/custom/pages_controller.rb` and overriding the `show` method, so `/help` renders a different page. Check the [controllers customization](controllers.md) section for more information.

### Replacing the help page using the admin interface

If you'd rather not change any code, you can replace the help page using the admin interface:

1. Disable the "Help page" feature in **Settings > Features**.
2. Create a custom page in **Site content > Custom pages** with the content you want and a slug of your choice (for example, `how-to`).
3. Add a content block in **Site content > Custom content blocks** named "Main Navigation Right" with a link to your custom page (for example, `<li><a href="/how-to">Help</a></li>`), so it appears in the main navigation where the help link used to be. If your site uses several languages, create a similar content block for each one.

Since the "Help page" feature is disabled, the default help page won't be shown anymore.
