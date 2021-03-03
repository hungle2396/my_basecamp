const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

environment.plugins.prepend("Provide",
    new webpack.ProvidePlugin({
        s: "jquery/src/jquery",
        JQuery: "jquery/src/jquery"
    })
)
module.exports = environment
