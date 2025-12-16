const vscode = require('vscode');

/**
 * Macro configuration settings
 * { [name: string]: {              ... Name of the macro
 *    no: number,                   ... Order of the macro
 *    func: ()=> string | undefined ... Name of the body of the macro function
 *  }
 * }
 */
module.exports.macroCommands = {
    ModeLecture: {
        no: 1,
        func: configureLecture
    },
    ModeDeveloper: {
        no: 2,
        func: configureDeveloper
    },
};

/**
 * Configure VScode for use in a lecture
 */
function configureLecture() {
    let configWindow = vscode.workspace.getConfiguration("window");
    configWindow.update("zoomLevel", 2.5, true);

    let configEditor = vscode.workspace.getConfiguration("editor");
    configEditor.update("rulers", [], true);
    configEditor.update("fontLigatures", false, true);
}

/**
 * Configure VScode for use in day to day development
 */
function configureDeveloper() {
    let configWindow = vscode.workspace.getConfiguration("window");
    configWindow.update("zoomLevel", 1, true);

    let configEditor = vscode.workspace.getConfiguration("editor");
    configEditor.update("rulers", [80, 120], true);
    configEditor.update("fontLigatures", true, true);
}
