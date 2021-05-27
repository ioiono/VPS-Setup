# VPS-Setup

## Usage 
*Format is borrowed from [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh). :)*
### Basic Installation

| Method    | Command                                                                                           |
|:----------|:--------------------------------------------------------------------------------------------------|
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh)"` |

#### Manual inspection

It's a good idea to inspect the install script from projects you don't yet know. You can do
that by downloading the install script first, looking through it so everything looks normal,
then running it:

```shell
wget https://raw.githubusercontent.com/ioiono/VPS-Setup/master/src/init.sh -O install.sh
sh install.sh
```