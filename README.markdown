## should

BDD style assertions for ActionScript 3 and Flex -- test framework agnostic

### Example

```as3
it(null).should.be.nil();
it(any).should.not.be.nil();
it(any).should.not.be.same_as(nothing);

it(5).should.equal(5);
it(5).should.not.equal(4);
it(5).should.be.greater.than(4);

it([1, 2, 3]).should.be.array.like([1, 2, 3]);
it([1, 2, 3]).should.have.items([2, 3]);

it(true).should.be.kind.of(Boolean);

it({property:any}).should.have.property("property");

var dispatcher:EventDispatcher = new EventDispatcher();
dispatcher.addEventListener("EVENT", function (e:Event):* {});

it(dispatcher).should.have.listener("EVENT");
it(dispatcher).should.not.have.listener("MOUSE_UP");
```

... *and much more*

Please see all examples in ItExtensionsTest.as

### Syntactic sugar

* not
* array
* objects
* messages &amp; events

### How to build

```
mvn install
```

### Run tests with IntelliJ IDEA

![Test Results](https://github.com/ivan-dyachenko/should/raw/master/readme/images/test-results.png)

### License

New BSD License.