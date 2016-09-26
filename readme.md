# Planet Maps

Custom builds of OpenLayers 3.

## Use

Install `planet-maps` as a dependency with [`npm`](http://nodejs.org/).

    npm install planet-maps --save-dev

Use [Browserify](http://browserify.org/) to `require` OpenLayers 3.

```js
// see below for a list of custom builds
var ol = require('@planet/maps/common');
```

You'll also want to import the stylesheet:

```css
/* Make sure to use the path to your node_modules */
@import url('./node_modules/planet-maps/ol.css');
```

## Builds

### `common`

```js
var ol = require('@planet/maps/common');
```

Support for everything required by Scenes, Mosaics, Labs, etc.  See `config/common.json` for details on what is included.

### `explorer`

```js
var ol = require('@planet/maps/explorer');
```

Support for everything required by Planet Explorer.  See `config/explorer.json` for details on what is included.

### `debug`

This is a debug build that should never be used in production.

## Publishing a new release

Edit the `config` files to include what you need exported and commit the changes.  Then you'll want to bump the version number in `package.json`, commit this change, and create a tag.  This should be done with the `npm version` command (choose one of `patch`, `minor`, or `major`).  E.g.

    npm version minor

Next you'll want to push your commits (and the tag) and publish your changes to npmjs.org.

    git push --tags origin master
    npm publish

Before publishing, the `prepublish` step will run `make`.  This will create builds that are *not* tracked by `git` but that are pushed to the npmjs.org repository for use by consuming packages.

Note the new version number in `package.json` and use it in packages that depend on this one.
