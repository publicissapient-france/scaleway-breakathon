import React, {useState} from 'react';
import Dropzone from './Dropzone/Dropzone';
import Answer from './Answer/Answer';

import './App.css';

function App() {
  const [number, setNumber] = useState(false);

  return (
    <div className="App">
      <Dropzone onResult={result => {setNumber(result); setTimeout(() => setNumber(false), 2000)}} />
      <Answer number={number} />
    </div>
  );
}

export default App;
