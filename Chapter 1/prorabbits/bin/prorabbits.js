// Generated by dart2js, the Dart to JavaScript compiler version: 1.3.0.
(function($){function dart(){this.x=0}var A=new dart
delete A.x
var B=new dart
delete B.x
var C=new dart
delete C.x
var D=new dart
delete D.x
var E=new dart
delete E.x
var F=new dart
delete F.x
var G=new dart
delete G.x
var H=new dart
delete H.x
var J=new dart
delete J.x
var K=new dart
delete K.x
var L=new dart
delete L.x
var M=new dart
delete M.x
var N=new dart
delete N.x
var O=new dart
delete O.x
var P=new dart
delete P.x
var Q=new dart
delete Q.x
var R=new dart
delete R.x
var S=new dart
delete S.x
var T=new dart
delete T.x
var U=new dart
delete U.x
var V=new dart
delete V.x
var W=new dart
delete W.x
var X=new dart
delete X.x
var Y=new dart
delete Y.x
var Z=new dart
delete Z.x
function I(){}
init()
$=I.p
var $$={}
;(function (reflectionData) {
  "use strict";
  function map(x){x={x:x};delete x.x;return x}
    function processStatics(descriptor) {
      for (var property in descriptor) {
        if (!hasOwnProperty.call(descriptor, property)) continue;
        if (property === "^") continue;
        var element = descriptor[property];
        var firstChar = property.substring(0, 1);
        var previousProperty;
        if (firstChar === "+") {
          mangledGlobalNames[previousProperty] = property.substring(1);
          var flag = descriptor[property];
          if (flag > 0) descriptor[previousProperty].$reflectable = flag;
          if (element && element.length) init.typeInformation[previousProperty] = element;
        } else if (firstChar === "@") {
          property = property.substring(1);
          $[property]["@"] = element;
        } else if (firstChar === "*") {
          globalObject[previousProperty].$defaultValues = element;
          var optionalMethods = descriptor.$methodsWithOptionalArguments;
          if (!optionalMethods) {
            descriptor.$methodsWithOptionalArguments = optionalMethods = {}
          }
          optionalMethods[property] = previousProperty;
        } else if (typeof element === "function") {
          globalObject[previousProperty = property] = element;
          functions.push(property);
          init.globalFunctions[property] = element;
        } else if (element.constructor === Array) {
          addStubs(globalObject, element, property, true, descriptor, functions);
        } else {
          previousProperty = property;
          var newDesc = {};
          var previousProp;
          for (var prop in element) {
            if (!hasOwnProperty.call(element, prop)) continue;
            firstChar = prop.substring(0, 1);
            if (prop === "static") {
              processStatics(init.statics[property] = element[prop]);
            } else if (firstChar === "+") {
              mangledNames[previousProp] = prop.substring(1);
              var flag = element[prop];
              if (flag > 0) element[previousProp].$reflectable = flag;
            } else if (firstChar === "@" && prop !== "@") {
              newDesc[prop.substring(1)]["@"] = element[prop];
            } else if (firstChar === "*") {
              newDesc[previousProp].$defaultValues = element[prop];
              var optionalMethods = newDesc.$methodsWithOptionalArguments;
              if (!optionalMethods) {
                newDesc.$methodsWithOptionalArguments = optionalMethods={}
              }
              optionalMethods[prop] = previousProp;
            } else {
              var elem = element[prop];
              if (prop !== "^" && elem != null && elem.constructor === Array && prop !== "<>") {
                addStubs(newDesc, elem, prop, false, element, []);
              } else {
                newDesc[previousProp = prop] = elem;
              }
            }
          }
          $$[property] = [globalObject, newDesc];
          classes.push(property);
        }
      }
    }
  function addStubs(descriptor, array, name, isStatic, originalDescriptor, functions) {
    var f, funcs = [originalDescriptor[name] = descriptor[name] = f = array[0]];
    f.$stubName = name;
    functions.push(name);
    for (var index = 0; index < array.length; index += 2) {
      f = array[index + 1];
      if (typeof f != "function") break;
      f.$stubName = array[index + 2];
      funcs.push(f);
      if (f.$stubName) {
        originalDescriptor[f.$stubName] = descriptor[f.$stubName] = f;
        functions.push(f.$stubName);
      }
    }
    for (var i = 0; i < funcs.length; index++, i++) {
      funcs[i].$callName = array[index + 1];
    }
    var getterStubName = array[++index];
    array = array.slice(++index);
    var requiredParameterInfo = array[0];
    var requiredParameterCount = requiredParameterInfo >> 1;
    var isAccessor = (requiredParameterInfo & 1) === 1;
    var isSetter = requiredParameterInfo === 3;
    var isGetter = requiredParameterInfo === 1;
    var optionalParameterInfo = array[1];
    var optionalParameterCount = optionalParameterInfo >> 1;
    var optionalParametersAreNamed = (optionalParameterInfo & 1) === 1;
    var isIntercepted = requiredParameterCount + optionalParameterCount != funcs[0].length;
    var functionTypeIndex = array[2];
    var unmangledNameIndex =  2 * optionalParameterCount + requiredParameterCount + 3;
    var isReflectable = array.length > unmangledNameIndex;

    if (getterStubName) {
      f = tearOff(funcs, array, isStatic, name, isIntercepted);
      f.getterStub = true;
      if (isStatic) init.globalFunctions[name] = f;
      originalDescriptor[getterStubName] = descriptor[getterStubName] = f;
      funcs.push(f);
      if (getterStubName) functions.push(getterStubName);
      f.$stubName = getterStubName;
      f.$callName = null;
      if (isIntercepted) init.interceptedNames[getterStubName] = true;
    }
    if (isReflectable) {
      for (var i = 0; i < funcs.length; i++) {
        funcs[i].$reflectable = 1;
        funcs[i].$reflectionInfo = array;
      }
      var mangledNames = isStatic ? init.mangledGlobalNames : init.mangledNames;
      var unmangledName = array[unmangledNameIndex];
      var reflectionName = unmangledName;
      if (getterStubName) mangledNames[getterStubName] = reflectionName;
      if (isSetter) {
        reflectionName += "=";
      } else if (!isGetter) {
        reflectionName += ":" + requiredParameterCount + ":" + optionalParameterCount;
      }
      mangledNames[name] = reflectionName;
      funcs[0].$reflectionName = reflectionName;
      funcs[0].$metadataIndex = unmangledNameIndex + 1;
      if (optionalParameterCount) descriptor[unmangledName + "*"] = funcs[0];
    }
  }
  function tearOffGetterNoCsp(funcs, reflectionInfo, name, isIntercepted) {
    return isIntercepted
        ? new Function("funcs", "reflectionInfo", "name", "H", "c",
            "return function tearOff_" + name + (functionCounter++)+ "(x) {" +
              "if (c === null) c = H.qm(" +
                  "this, funcs, reflectionInfo, false, [x], name);" +
              "return new c(this, funcs[0], x, name);" +
            "}")(funcs, reflectionInfo, name, H, null)
        : new Function("funcs", "reflectionInfo", "name", "H", "c",
            "return function tearOff_" + name + (functionCounter++)+ "() {" +
              "if (c === null) c = H.qm(" +
                  "this, funcs, reflectionInfo, false, [], name);" +
              "return new c(this, funcs[0], null, name);" +
            "}")(funcs, reflectionInfo, name, H, null)
  }
  function tearOffGetterCsp(funcs, reflectionInfo, name, isIntercepted) {
    var cache = null;
    return isIntercepted
        ? function(x) {
            if (cache === null) cache = H.qm(this, funcs, reflectionInfo, false, [x], name);
            return new cache(this, funcs[0], x, name)
          }
        : function() {
            if (cache === null) cache = H.qm(this, funcs, reflectionInfo, false, [], name);
            return new cache(this, funcs[0], null, name)
          }
  }
  function tearOff(funcs, reflectionInfo, isStatic, name, isIntercepted) {
    var cache;
    return isStatic
        ? function() {
            if (cache === void 0) cache = H.qm(this, funcs, reflectionInfo, true, [], name).prototype;
            return cache;
          }
        : tearOffGetter(funcs, reflectionInfo, name, isIntercepted);
  }
  var functionCounter = 0;
  var tearOffGetter = (typeof dart_precompiled == "function")
      ? tearOffGetterCsp : tearOffGetterNoCsp;
  if (!init.libraries) init.libraries = [];
  if (!init.mangledNames) init.mangledNames = map();
  if (!init.mangledGlobalNames) init.mangledGlobalNames = map();
  if (!init.statics) init.statics = map();
  if (!init.typeInformation) init.typeInformation = map();
  if (!init.globalFunctions) init.globalFunctions = map();
  if (!init.interceptedNames) init.interceptedNames = map();
  var libraries = init.libraries;
  var mangledNames = init.mangledNames;
  var mangledGlobalNames = init.mangledGlobalNames;
  var hasOwnProperty = Object.prototype.hasOwnProperty;
  var length = reflectionData.length;
  for (var i = 0; i < length; i++) {
    var data = reflectionData[i];
    var name = data[0];
    var uri = data[1];
    var metadata = data[2];
    var globalObject = data[3];
    var descriptor = data[4];
    var isRoot = !!data[5];
    var fields = descriptor && descriptor["^"];
    var classes = [];
    var functions = [];
    processStatics(descriptor);
    libraries.push([name, uri, classes, functions, metadata, fields, isRoot,
                    globalObject]);
  }
})
([["_foreign_helper","dart:_foreign_helper",,H,{
"^":"",
FK:{
"^":"a;tT"}}],["_interceptors","dart:_interceptors",,J,{
"^":"",
x:function(a){return void 0},
vB:{
"^":"a;",
bu:function(a){return H.a5(a)}},
yE:{
"^":"bool/vB;",
bu:function(a){return String(a)}},
PE:{
"^":"Null/vB;",
bu:function(a){return"null"}},
P:{
"^":"num/vB;",
yu:function(a){var z
if(a>=-2147483648&&a<=2147483647)return a|0
if(isFinite(a)){z=a<0?Math.ceil(a):Math.floor(a)
return z+0}throw H.b(P.f(''+a))},
UD:function(a){if(a<0)return-Math.round(-a)
else return Math.round(a)},
bu:function(a){if(a===0&&1/a<0)return"-0.0"
else return""+a},
$isnum:true,
static:{"^":"SA,N6"}},
im:{
"^":"int/P;",
$isnum:true,
$isint:true},
VA:{
"^":"double/P;",
$isnum:true},
O:{
"^":"String/vB;",
j:function(a,b){if(b>=a.length)throw H.b(P.N(b))
return a.charCodeAt(b)},
Nj:function(a,b,c){if(c==null)c=a.length
if(typeof c!=="number"||Math.floor(c)!==c)H.vh(P.u(c))
if(b<0)throw H.b(P.N(b))
if(typeof c!=="number")return H.s(c)
if(b>c)throw H.b(P.N(b))
if(c>a.length)throw H.b(P.N(c))
return a.substring(b,c)},
yn:function(a,b){return this.Nj(a,b,null)},
bu:function(a){return a},
$isString:true}}],["_js_helper","dart:_js_helper",,H,{
"^":"",
d:function(a){var z
if(typeof a==="string")return a
if(typeof a==="number"){if(a!==0)return""+a}else if(!0===a)return"true"
else if(!1===a)return"false"
else if(a==null)return"null"
z=J.AG(a)
if(typeof z!=="string")throw H.b(P.u(a))
return z},
lh:function(a){var z,y
z=C.AS(J.x(a))
if(z==="Object"){y=String(a.constructor).match(/^\s*function\s*(\S*)\s*\(/)[1]
if(typeof y==="string")z=y}if(J.rY(z).j(z,0)===36)z=C.xB.yn(z,1)
return z+H.ia(H.oX(a),0,null)},
a5:function(a){return"Instance of '"+H.lh(a)+"'"},
s:function(a){throw H.b(P.u(a))},
b:function(a){var z
if(a==null)a=new P.LK()
z=new Error()
z.dartException=a
if("defineProperty" in Object){Object.defineProperty(z, "message", { get: H.Ju })
z.name=""}else z.toString=H.Ju
return z},
Ju:function(){return J.AG(this.dartException)},
vh:function(a){var z
if(a==null)a=new P.LK()
z=new Error()
z.dartException=a
if("defineProperty" in Object){Object.defineProperty(z, "message", { get: H.Ju })
z.name=""}else z.toString=H.Ju
throw z},
oX:function(a){if(a==null)return
return a.$builtinTypeInfo},
Ko:function(a,b){if(a==null)return"dynamic"
else if(typeof a==="object"&&a!==null&&a.constructor===Array)return a[0].builtin$cls+H.ia(a,1,b)
else if(typeof a=="function")return a.builtin$cls
else if(typeof a==="number"&&Math.floor(a)===a)return C.jn.bu(a)
else return},
ia:function(a,b,c){var z,y,x,w,v,u
if(a==null)return""
z=P.p9("")
for(y=b,x=!0,w=!0;y<a.length;++y){if(x)x=!1
else z.vM=z.vM+", "
v=a[y]
if(v!=null)w=!1
u=H.Ko(v,c)
u=typeof u==="string"?u:H.d(u)
z.vM=z.vM+u}return w?"":"<"+H.d(z)+">"}}],["dart.core","dart:core",,P,{
"^":"",
JS:function(a){H.qw(a)},
Ge:{
"^":"a;"},
LK:{
"^":"Ge;",
bu:function(a){return"Throw of null."}},
AT:{
"^":"Ge;G1",
bu:function(a){var z=this.G1
if(z!=null)return"Illegal argument(s): "+H.d(z)
return"Illegal argument(s)"},
static:{u:function(a){return new P.AT(a)}}},
bJ:{
"^":"AT;G1",
bu:function(a){return"RangeError: "+H.d(this.G1)},
static:{N:function(a){return new P.bJ("value "+H.d(a))}}},
ub:{
"^":"Ge;G1",
bu:function(a){return"Unsupported operation: "+this.G1},
static:{f:function(a){return new P.ub(a)}}},
c8:{
"^":"a;",
bu:function(a){return"null"}},
a:{
"^":";",
bu:function(a){return H.a5(this)}},
Rn:{
"^":"a;vM",
bu:function(a){return this.vM},
PD:function(a){this.vM=a},
static:{p9:function(a){var z=new P.Rn("")
z.PD(a)
return z}}}}],["dart2js._js_primitives","dart:_js_primitives",,H,{
"^":"",
qw:function(a){if(typeof dartPrint=="function"){dartPrint(a)
return}if(typeof console=="object"&&typeof console.log=="function"){console.log(a)
return}if(typeof window=="object")return
if(typeof print=="function"){print(a)
return}throw "Unable to print message: " + String(a)}}],["","prorabbits_v6.dart",,R,{
"^":"",
E2:function(){var z,y,x
P.JS("The number of rabbits increases as:\n")
for(z=0;z<=10;++z){y=Math.log(15)
y=C.jn.yu(C.CD.yu(C.CD.UD(2*Math.pow(2.718281828459045,y*z))))
x="After "+z+" years:\t "+y+" animals"
H.qw(x)}}},1],])
I.$finishClasses($$,$,null)
$$=null
J.rY=function(a){if(typeof a=="string")return J.O.prototype
if(a==null)return a
return a}
J.x=function(a){if(typeof a=="number"){if(Math.floor(a)==a)return J.im.prototype
return J.VA.prototype}if(typeof a=="string")return J.O.prototype
if(a==null)return J.PE.prototype
if(typeof a=="boolean")return J.yE.prototype
if(a.constructor==Array)return J.Q.prototype
return a}
J.AG=function(a){return J.x(a).bu(a)}
C.jn=J.im.prototype
C.CD=J.P.prototype
C.xB=J.O.prototype
C.AS=function getTagFallback(o) {
  var constructor = o.constructor;
  if (typeof constructor == "function") {
    var name = constructor.name;
    if (typeof name == "string"
        && name !== ""
        && name !== "Object"
        && name !== "Function.prototype") {
      return name;
    }
  }
  var s = Object.prototype.toString.call(o);
  return s.substring(8, s.length - 1);
}
$.libraries_to_load = {}
$.yj=0
$.mJ=null
$.P4=null
$.oK=null

init.functionAliases={}
init.metadata=[];$=null
I = I.$finishIsolateConstructor(I)
$=new I()
function convertToFastObject(properties) {
  function MyClass() {};
  MyClass.prototype = properties;
  new MyClass();
  return properties;
}
A = convertToFastObject(A)
B = convertToFastObject(B)
C = convertToFastObject(C)
D = convertToFastObject(D)
E = convertToFastObject(E)
F = convertToFastObject(F)
G = convertToFastObject(G)
H = convertToFastObject(H)
J = convertToFastObject(J)
K = convertToFastObject(K)
L = convertToFastObject(L)
M = convertToFastObject(M)
N = convertToFastObject(N)
O = convertToFastObject(O)
P = convertToFastObject(P)
Q = convertToFastObject(Q)
R = convertToFastObject(R)
S = convertToFastObject(S)
T = convertToFastObject(T)
U = convertToFastObject(U)
V = convertToFastObject(V)
W = convertToFastObject(W)
X = convertToFastObject(X)
Y = convertToFastObject(Y)
Z = convertToFastObject(Z)
;(function (callback) {
  if (typeof document === "undefined") {
    callback(null);
    return;
  }
  if (document.currentScript) {
    callback(document.currentScript);
    return;
  }

  var scripts = document.scripts;
  function onLoad(event) {
    for (var i = 0; i < scripts.length; ++i) {
      scripts[i].removeEventListener("load", onLoad, false);
    }
    callback(event.target);
  }
  for (var i = 0; i < scripts.length; ++i) {
    scripts[i].addEventListener("load", onLoad, false);
  }
})(function(currentScript) {
  init.currentScript = currentScript;

  if (typeof dartMainRunner === "function") {
    dartMainRunner(R.E2, []);
  } else {
    R.E2([]);
  }
})
function init(){I.p={}
function generateAccessor(a,b,c){var y=a.split("-")
var x=y[0]
var w=x.length
var v=x.charCodeAt(w-1)
var u
if(y.length>1)u=true
else u=false
v=v>=60&&v<=64?v-59:v>=123&&v<=126?v-117:v>=37&&v<=43?v-27:0
if(v){var t=v&3
var s=v>>2
var r=x=x.substring(0,w-1)
var q=x.indexOf(":")
if(q>0){r=x.substring(0,q)
x=x.substring(q+1)}if(t){var p=t&2?"r":""
var o=t&1?"this":"r"
var n="return "+o+"."+x
var m=c+".prototype.g"+r+"="
var l="function("+p+"){"+n+"}"
if(u)b.push(m+"$reflectable("+l+");\n")
else b.push(m+l+";\n")}if(s){var p=s&2?"r,v":"v"
var o=s&1?"this":"r"
var n=o+"."+x+"=v"
var m=c+".prototype.s"+r+"="
var l="function("+p+"){"+n+"}"
if(u)b.push(m+"$reflectable("+l+");\n")
else b.push(m+l+";\n")}}return x}I.p.$generateAccessor=generateAccessor
function defineClass(a,b,c){var y=[]
var x="function "+b+"("
var w=""
for(var v=0;v<c.length;v++){if(v!=0)x+=", "
var u=generateAccessor(c[v],y,b)
var t="parameter_"+u
x+=t
w+="this."+u+" = "+t+";\n"}x+=") {\n"+w+"}\n"
x+=b+".builtin$cls=\""+a+"\";\n"
x+="$desc=$collectedClasses."+b+";\n"
x+="if($desc instanceof Array) $desc = $desc[1];\n"
x+=b+".prototype = $desc;\n"
if(typeof defineClass.name!="string"){x+=b+".name=\""+b+"\";\n"}x+=y.join("")
return x}var z=function(){function tmp(){}var y=Object.prototype.hasOwnProperty
return function(a,b){tmp.prototype=b.prototype
var x=new tmp()
var w=a.prototype
for(var v in w)if(y.call(w,v))x[v]=w[v]
x.constructor=a
a.prototype=x
return x}}()
I.$finishClasses=function(a,b,c){var y={}
if(!init.allClasses)init.allClasses={}
var x=init.allClasses
var w=Object.prototype.hasOwnProperty
if(typeof dart_precompiled=="function"){var v=dart_precompiled(a)}else{var u="function $reflectable(fn){fn.$reflectable=1;return fn};\n"+"var $desc;\n"
var t=[]}for(var s in a){if(w.call(a,s)){var r=a[s]
if(r instanceof Array)r=r[1]
var q=r["^"],p,o=s,n=q
if(typeof q=="string"){var m=q.split("/")
if(m.length==2){o=m[0]
n=m[1]}}var l=n.split(";")
n=l[1]==""?[]:l[1].split(",")
p=l[0]
m=p.split(":")
if(m.length==2){p=m[0]
var k=m[1]
if(k)r.$signature=function(d){return function(){return init.metadata[d]}}(k)}if(typeof dart_precompiled!="function"){u+=defineClass(o,s,n)
t.push(s)}if(p)y[s]=p}}if(typeof dart_precompiled!="function"){u+="return [\n  "+t.join(",\n  ")+"\n]"
var v=new Function("$collectedClasses",u)(a)
u=null}for(var j=0;j<v.length;j++){var i=v[j]
var s=i.name
var r=a[s]
var h=b
if(r instanceof Array){h=r[0]||b
r=r[1]}x[s]=i
h[s]=i}v=null
var g={}
init.interceptorsByTag=Object.create(null)
init.leafTags={}
function finishClass(a2){var f=Object.prototype.hasOwnProperty
if(f.call(g,a2))return
g[a2]=true
var e=y[a2]
if(!e||typeof e!="string")return
finishClass(e)
var d=x[a2]
var a0=x[e]
if(!a0)a0=c[e]
var a1=z(d,a0)}for(var s in y)finishClass(s)}
I.$lazy=function(a,b,c,d,e){var y={}
var x={}
a[c]=y
a[d]=function(){var w=$[c]
try{if(w===y){$[c]=x
try{w=$[c]=e()}finally{if(w===y){if($[c]===x){$[c]=null}}}}else{if(w===x)H.eQ(b)}return w}finally{$[d]=function(){return this[c]}}}}
I.$finishIsolateConstructor=function(a){var y=a.p
function Isolate(){var x=Object.prototype.hasOwnProperty
for(var w in y)if(x.call(y,w))this[w]=y[w]
function ForceEfficientMap(){}ForceEfficientMap.prototype=this
new ForceEfficientMap()}Isolate.prototype=a.prototype
Isolate.prototype.constructor=Isolate
Isolate.p=y
Isolate.$finishClasses=a.$finishClasses
return Isolate}}
})()

//# sourceMappingURL=prorabbits.js.map
//@ sourceMappingURL=prorabbits.js.map
