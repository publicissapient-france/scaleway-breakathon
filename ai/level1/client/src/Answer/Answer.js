import React from 'react'
import classnames from 'classnames';

import './Answer.css';

function Answer({number}) {
  return (
    <div className="Answer">
      <div className={classnames('Answer_number', number !== false && 'Answer_number_visible')}>
        {number}
      </div>
    </div>
  )
}

export default Answer;