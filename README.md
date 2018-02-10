## Get Started

Install [PureScript](http://www.purescript.org/) (the language itself), [Pulp](https://github.com/purescript-contrib/pulp) (the build tool), and [psc-package](https://github.com/purescript/psc-package) (a package manager):
```bash
yarn global add purescript pulp psc-package
```

Do not install `bower`.

Create a new directory, and initialize the project:
```bash
mkdir my-purescript-project

cd my-purescript-project

pulp --psc-package init
```

To add packages to a project, run the command `psc-package install package-name`. Note that you should drop `purescript-` from the beginning of any package name. This command will automatically insert the package into your `.psc-package.json` file.

Put your source files in the `/src` directory. To compile, `pulp build`. To compile with dead code elimination, `pulp build --optimise`. Output files will end up in the `/output` directory as CommonJS modules, so you can `require()` them.

You can also output optimised JavaScript as a bundle, `pulp build --to code.js`, or use Browserify to bundle it: `pulp browserify --to code.js` (this command will include any npm packages you `require()` in your PureScript code files. You optimise the last step, as well: `pulp browserify --optimise --to code.js`, but this should only be done for production code (to lesson compile times during development).

You can also run your code directly in node, compiling if necessary beforehand with `pulp run`.

See the [pulp documentation](https://github.com/purescript-contrib/pulp) for more information about testing, building documentation, the PureScript REPL, webpack integration, etc.

## Add custom package sets

Fork `https://github.com/purescript/package-sets` and edit your newly copied `/package-sets/packages.json`, adding any necessary packages to the file according to this pattern:
```js
{

  ...

  "package-name": {
    "dependencies": [
      "functions",
      "eff",
      "some-other-dependency"
    ],
    "repo": "https://github.com/username/purescript-package-name.git",
    "version": "v0.1.0"
  }

  ...

}
```

Then, create a new release for your `package-sets` repo, giving it whatever tag and name you like. For example: `https://github.com/sjsyrek/package-sets/releases/tag/schokoriegel`. Then, you can add that tag name as a `set` to your `psc-package.json` file:
```js
{
    "name": "my-purescript-project",
    "set": "schokoriegel",
    "source": "https://github.com/sjsyrek/package-sets.git",
    "depends": [
        "react-basic",
        "prelude"
    ]
}
```

Now you can run:
```bash
psc-package update
```

And you should have everything you need.
