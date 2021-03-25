import React, {useCallback} from 'react'
import {useDropzone} from 'react-dropzone'

import './Dropzone.css';

function Dropzone({onResult}) {
  const onDrop = useCallback(acceptedFiles => {
    const formData = new FormData();
    formData.append('file', acceptedFiles[0])
    fetch('/predict', {method: 'POST', body: formData})
    .then(response => response.json())
    .then(onResult);
  }, [onResult])
  const {getRootProps, getInputProps, isDragActive} = useDropzone({onDrop})

  return (
    <div {...getRootProps()} className="Dropzone">
      <input {...getInputProps()} />
      {
        isDragActive ?
          <p>Drop the files here ...</p> :
          <p>Drag 'n' drop the zip file!</p>
      }
    </div>
  )
}

export default Dropzone;