# Planet Maps

Custom builds of OpenLayers 3.

## Use

Install `planet-maps` as a dependency with [`npm`](http://nodejs.org/).

    npm install planet-maps --save-dev

Use [Browserify](http://browserify.org/) to `require` OpenLayers 3.

    /* See below for a list of custom builds */
    var ol = require('planet-maps/dist/ol-base');

You'll also want to import the stylesheet:

    /* Make sure to use the path to your node_modules */
    @import url('./node_modules/planet-maps/dist/ol.css');

## Builds

### `ol-base`

Support for vector and raster souces.  See `config/ol-base.json` for details on what is included.
