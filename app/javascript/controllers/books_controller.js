import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start();
const context = require.context("controllers", true, /.js$/);
application.load(definitionsFromContext(context));

// Import and register the component
import StimulusSlimSelect from "stimulus-slimselect"
application.register('slimselect', StimulusSlimSelect)