### PNGLib
Originally transpiled from https://github.com/wyozi/lua-pngencoder  
However it has been **heavily** modified to be efficient and work for E2.

## What's new
### 1.4 --
Inlined even more stuff.  
``15897 OPS -> ~14900 OPS``  
Sadly there's really not much else to improve.

### 1.3 --
A lot of boilerplate code was removed in an attempt to lower ops, and I am proud to say it worked.

Went from ``25351 OPS -> 15897 OPS`` with this piece of code, pretty good:
```golo
P = createPNG(2, 2, "rgb")
P:writeRGBFast(255, 0, 0)
P:writeRGBFast(0, 255, 0)
P:writeRGBFast(0, 0, 255)
P:writeRGBFast(255, 255, 255)
print(P:done())
P:export("test.png")

print( opcounter() )
```
A cool goal would be to get this to be able to run in less than 10k ops for a 2x2 image, so it can be used on normal servers...

Version 1.3 doesn't check if a table has the png field set. This may cause some confusion in debugging if you somehow call it on some random tables, but it was necessary for a perf boost. The RGB type is also ignored, but only in the functions that contain *fast* in their names.

## How to use (Version 1.2+):
```golo
P = createPNG(2,2,"rgb") # Third argument is optional
P:writeVectorFast(vec(255,0,0))
P:writeRGB(28.238,0,252.23)
P:writeVector(vec(248.92428,0,255))
P:writeRGBFast(255,255,255)
print(P:done())
P:export("test.png") # Will put the image in data/e2files as the file "test.png".
```

## Notes:
* Only use writeVectorFast/writeRGBFast if you know your digits are rounded so they won't break the image.  

* E2 only recently gained the ability to write .png files, as of 3/24/2021 on the wiremod github.  
If it won't write the file like in the example above, use .txt instead and just rename it after creation.

# PNGLib Documentation
## Autogenerated Docs
More @https://github.com/Vurv78/expression2-public-e2s

## Functions that return **number**

### ![Number](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):done()
 Returns whether all of the pixels of the png have been filled.

## Functions that return **table**

### ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png) = createPNG(Width ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), Height ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), ColorMode ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-String.png))
 Creates a png image object with colormode specified (rgb or rgba)
### ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png) = createPNG(Width ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), Height ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png))
 Create a default RGB Image. Acts like createPNG(Width,Height,"rgb")
### ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):output()
 Returns the output table of the png. Concatenate this with an empty string to get the actual string output.

## Functions that return **void**

### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):export(FilePath ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-String.png))
 Exports the png data to a filepath given (FilePath)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):pngWriteRaw(Pixels ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png))
 Manual mode to write to a png image, this is 20 ops cheaper per call than the write* helper functions. However you should make sure your color mode is the same as well as that your object is really a PNG. It's unsafe in order to be cheap.
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeRGBA(R ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), G ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), B ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), A ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png))
 Write RGBA Pixel (Make sure your png is rgba mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeVector4(V ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Vector4.png))
 Write RGBA Pixel with a vector4 (Make sure your png is rgba mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeVectorFast(V ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Vector.png))
 Write RGB Vector Fast (Doesn't round for you, can lead to image corruption if given decimals!) (Make sure your png is rgb mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeRGBAFast(R ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), G ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), B ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), A ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png))
 Write RGBA Pixel Fast (Doesn't round for you, can lead to image corruption if given decimals!) (Make sure your png is rgba mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeVector(V ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Vector.png))
 Write RGB Vector (Make sure your png is rgba mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeRGBFast(R ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), G ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), B ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png))
 Write RGB Pixel Fast (Make sure your png is rgb mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeRGB(R ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), G ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png), B ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Number.png))
 Write RGB Pixel (Make sure your png is rgb mode or it won't work)
### ![Void](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Void.png) = ![Table](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Table.png):writeVector4Fast(V ![](https://raw.githubusercontent.com/wiki/wiremod/wire/Type-Vector4.png))
 Write RGBA Pixel with a vector4 fast (Doesn't round for you, can lead to image corruption if given decimals!) (Make sure your png is rgba mode or it won't work)


## Changelogs:

## Version 1.2 -- RGBA Images
```golo
# Added createPNG(ResX,ResY,ColorType) (ColorType can be "rgb" or "rgba"), it is optional however.
# Added writeVector4(Vector4RGB)
# Added writeVector4Fast(Vector4RGB)
# Added writeRGBA(R,G,B,A)
# Added writeRGBAFast(R,G,B,A)
# Changed Updated some functions to be more efficient in rounding by using lua methods (writeVector)
```

## Version 1.1 -- Bug Fixes + writeRGB
```golo
# Changed Renamed writePixel to writeVector
# Added writeVectorFast(VectorRGB)
# Added writeRGB(R,G,B)
# Added writeRGBFast(R,G,B)
# Changed Updated writePixel/Vector to round numbers given as not to break the image
# Added Png:export(FilePath)
# Added Png:output()
```

## Version 1.0
Created the library.
