const { environment } = require('@rails/webpacker');
const { VueLoaderPlugin } = require('vue-loader');
const StimulusControllerLoader = require('stimulus/webpack-helpers');

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin());

// Configura Webpacker para cargar controladores Stimulus
environment.loaders.append('stimulus', {
  test: /stimulus\/(index\.js)?$/,
  use: StimulusControllerLoader,
});

module.exports = environment;