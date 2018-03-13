# Muezzin-BitBar
This is a BitBar plugin for showing Islamic prayer times in your menu bar. It uses [MuezzinAPI](https://github.com/mehmetakiftutuncu/MuezzinAPI) to get its data.

## Dependencies
You will need [BitBar](https://getbitbar.com/) running in your system.

This plugin also requires following to run
- httpie - https://httpie.org/
- jq - https://stedolan.github.io/jq/

You can install them with Homebrew using

```
brew install httpie jq
```

## Installation
Download [muezzin.5m.sh](https://github.com/mehmetakiftutuncu/Muezzin-BitBar/raw/master/muezzin.5m.sh), put it into your BitBar plugin directory and make it executable.

## Configuration
See [MuezzinAPI's country, city and district documentation](https://github.com/mehmetakiftutuncu/MuezzinAPI) to get ids for your desired location. Then open `muezzin.5m.sh` in your favorite text editor to edit `COUNTRY_ID`, `CITY_ID` and `DISTRICT_ID` values. By default, they are set to `Istanbul, Turkey` location.

## Contributing
Feel free to file issues and pull requests.

## License
Muezzin BitBar is licensed under the terms of the MIT License.

```
MIT License

Copyright (c) 2018 Mehmet Akif Tütüncü

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```