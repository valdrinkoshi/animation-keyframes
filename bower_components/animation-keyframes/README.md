[![Published on webcomponents.org](https://img.shields.io/badge/webcomponents.org-published-blue.svg)](https://www.webcomponents.org/element/valdrinkoshi/animation-keyframes)
[![Build Status](https://travis-ci.org/valdrinkoshi/animation-keyframes.svg?branch=master)](https://travis-ci.org/valdrinkoshi/animation-keyframes)

# \<animation-keyframes\>

\<animation-keyframes\> generates keyframes for performant expand/collapse. See more details on this technique [here](https://developers.google.com/web/updates/2017/03/performant-expand-and-collapse).

Use this element to generate the stylesheet and save it as a static resource.

<!-- 
  The next comment block is used by webcomponents.org to enable inline demo.
  Visit https://www.webcomponents.org/publish for more details.
-->
<!--
```
<custom-element-demo>
  <template>
    <script src="../webcomponentsjs/webcomponents-lite.js"></script>
    <link rel="import" href="animation-keyframes.html">
    <script src="../webcomponentsjs/webcomponents-loader.js"></script>
    <link rel="import" href="animation-keyframes.html">
    <style>
      body:not(.animate) * {
        animation-name: none !important;
      }
    </style>
    <p><button id="playButton">Play animation</button></p>
    <next-code-block></next-code-block>
    <script>
      var playButton = document.querySelector('#playButton');
      playButton.addEventListener('click', function() {
        requestAnimationFrame(function() {
          playButton.disabled = true;
          document.body.classList.add('animate');
        });
      });
      document.body.addEventListener('animationend', function() {
        setTimeout(function() {
          playButton.disabled = false;
          document.body.classList.remove('animate');
        }, 300);
      });
    </script>
  </template>
</custom-element-demo>
```
-->
```html
<animation-keyframes
      animation-name="myAnimation"
      preset="vertical-expand"
      duration="200">
</animation-keyframes>

<style>
  .myAnimation { outline: 1px solid lightgray; }
  .myAnimationInverse { padding: 10px; }
  .myAnimation, .myAnimationInverse {
    transform-origin: top left;
    animation-delay: 400ms;
    animation-fill-mode: both;
  }
</style>
<div class="myAnimation">
  <div class="myAnimationInverse">
    <h3>Performant expand animation!</h3>
    <p>animation-keyframes generated the keyframes for this animation.</p>
    <ul>
      <li>item 1</li>
      <li>item 2</li>
      <li>item 3</li>
    </ul>
  </div>
</div>
```

## Live demo

https://valdrinkoshi.github.io/animation-keyframes/

## Contributing

### Install the Polymer-CLI

First, make sure you have the [Polymer CLI](https://www.npmjs.com/package/polymer-cli) installed. Then run `polymer serve` to serve your element locally.

### Viewing Your Element

```
$ polymer serve
```

### Running Tests

```
$ polymer test
```

Your application is already set up to be tested via [web-component-tester](https://github.com/Polymer/web-component-tester). Run `polymer test` to run your application's test suite locally.

## License

[MIT](https://opensource.org/licenses/MIT)
