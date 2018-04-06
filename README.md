# Comparing Kitura and Vapor

**Author: Paul Hudson – [@twostraws](https://twitter.com/twostraws)**

Recently I wrote an article drawing [comparisons between Kitura and Vapor for server-side Swift](https://www.hackingwithswift.com/articles/73/server-side-swift-kitura-vs-vapor), but I wanted to do more than just present some discussion – I wanted to give you a real taste of how the two work in practice.

So, I decided to write the same web app in both frameworks. I wanted something simple enough to be understood by a newcomer to server-side Swift, but with enough to let you see a little routing, a little templating, and a little database access side by side.

[Guilherme Rambo](https://twitter.com/_inside) very kindly agreed to let me re-implement his [iOS Architecture Generator](https://iosarchitecture.top/) site. This is [open source on GitHub](https://github.com/insidegui/iosarchitecture), but I only glanced at his code briefly – these are almost entirely written fresh. One version is for Kitura 2 and the other is for Vapor 3.

There are some differences between his version and the two in this repository:

- His was written for Vapor 2; these are written for Vapor 3 and  Kitura 2.
- His has an attractive front-end with CSS styling; mine do not.
- His uses Ajax to communicate between the front-end and back-end; mine do not.
- Mine store the architecture components in a database; his has them hard-coded. (Mine only do this so you can get a glimpse at how databases work.)
- Mine return architecture names and components separately; his does not. (Mine only do this so I can demonstrate loops inside templates.)

In short, I haven’t tried to clone the code or the structure of his site – I’ve simply ripped off his idea, albeit with permission. Thanks, Guilherme!

Now, you might very well wonder why a database ought to be involved, and in truth there is no good reason. I added database usage only so you could see it in action – hard-coding the component types is almost certainly a better solution.

There is no magic in the code. In fact, I’ve tried to make it as boringly simple as possible so everyone can understand it relatively easily.


## Try it yourself

If you want to try the code yourself, here’s the least you need to know:

1. The Vapor version uses an in-memory SQLite database. You should hit the “setup” route in your web browser after the app starts, to inject architecture data.
2. The Kitura version was supposed to use an in-memory SQLite database, but their implementation is broken. You still need to hit the “setup” route in your web browser after the app starts, but it will create a database that will work next time.
3. Kitura uses the SQLite C API. This does not come installed on macOS by default, so you should run **brew install sqlite**. Vapor uses its own SQLite implementation so this isn’t necessary.
4. You can visit the root route (“/“) to see a new architecture; refresh the page to see another.
5. Vapor runs on port 8080 and Kitura on port 8090, so you can run them side by side.
6. You can visit “/architecture” to see a new architecture delivered as JSON.

It would only take 20 minutes or so to turn this into a fully fledged web app – all it lacks really is some styling in the HTML.

If you’d like to make changes here you’re welcome to open a pull request. However, please keep in mind that I’ve deliberately tried to make the code as simple as possible and that. If you’re able to make the code shorter then that’s great, but please don’t add any further complexity!


## License

MIT License.

Copyright (c) 2018 Paul Hudson

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
