import './web-components/forest-demo.js'

// This is called BEFORE your Elm app starts up.
// The value returned here will be passed as flags
// into your `Shared.elm` function. 
export const flags = ({ env }) => {
    return {
        message: "Hello from JS!"
    }
};


// This is called AFTER your Elm app starts up.
// Here you can work with `app.ports` to send messages
// to your Elm app, or subscribe to messages from your
export const onReady = ({ app, env }) => {
    if (app.ports && app.ports.outgoing) {
        app.ports.outgoing.subscribe(( { tag, data } ) => {
            switch (tag) {
                case 'OPEN_WINDOW_DIALOG' :
                    window.alert(data);
                    return;
                default:
                    console.warn(`Unknown outgoing message tag: ${tag}`);
                    return;
            }
        })
    }
};