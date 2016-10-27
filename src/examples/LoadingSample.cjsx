React = require 'react'

Loading = require 'ReactComponents/Loading'
{LoadingOrValue, SpinLoading} = Loading

module.exports = ->
  <div>
    <div className='example'>
      <code className='example-code'>
        Loading = require 'Components/Loading'
        &#123;LoadingOrValue, SpinLoading&#125; = Loading
        &lt;Loading/&gt;
      </code>
      <Loading/>
    </div>

    <div className='example'>
      <code>&lt;SpinLoading/&gt;&lt;SpinLoading/&gt;</code>
      <SpinLoading/><SpinLoading/>
    </div>

    <div className='example'>
      <code>
        &lt;LoadingOrValue isLoading='false'&gt; string or component &lt;/LoadingOrValue&gt;
      </code>
      <LoadingOrValue isLoading={false}> string or component </LoadingOrValue>
      <br/>
      <code>
        &lt;LoadingOrValue isLoading='true'&gt; string or component &lt;/LoadingOrValue&gt;
      </code>
      <LoadingOrValue isLoading={true}> string or component </LoadingOrValue>
    </div>
  </div>
