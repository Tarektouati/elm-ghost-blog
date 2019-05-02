import './main.css';
import { Elm } from './Main.elm';
import registerServiceWorker from './registerServiceWorker';

Elm.Main.init({
  node: document.getElementById('root'),
  flags: {
    api: process.env.ELM_APP_URL,
    key: process.env.ELM_APP_KEY
  }
});

registerServiceWorker();
