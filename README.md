# macOS zip service

Do your own easy way to compress files or folders as a clean zip with simple services on macOS Finder.

[中文版](https://github.com/pilisir/macOSzip/wiki/%E4%B8%AD%E6%96%87%E7%89%88-README)

## Feature
* Zip files or folders without any **.DS_Store** and **__MACOSX** file.
* Zip files or folders with the **full parent path** beginning under ~/, known as *username*, to the ~/Documents folder.
## Install
There are two way to create the services.
##### Way 1: Copy and Paste (If you run into a problem about encoding of workflow file while trying this way, please try Way 2 instead.)
1. Directly download this project and uncompress it.
2. Move two service files to the local service folder. You can easily copy *ZIP.workflow* and *ZIP with path.workflow* under folder __*./dist/Library/Services/*__ of this project to your local __*$USER/Library/Services/*__ folder.
3. Done !
##### Way 2: Create services yourself. 
1. Open **Automator** app.
2. Press **[Command] + [N]** to new a document which type is *Service*.
3. Select __*Action > Library > Files & Folders > Get Selected Finder Items*__ and drag it to the right side as Step One.
4. Select __*Action > Library > Utillities > Run Shell Script*__ and drag it to the right side as Step Two.
5. Drop down **Pass input** of Step Two and select the **to stdin**.
6. Copy content text of file from this project, __*./src/zip.sh*__, paste it as the Step Two shell content text.
7. Look up the top, drop down **Service recives selected** and select **files or folders**.
8. Press **[Command] + [S]** to save this service with specified name "**ZIP**" (or any custom name yourself). 
9. Done !
10. To create second Service, **ZIP With Path**, just repeat Way 2 and change to copy content text from __*./src/zip_with_path.sh*__.

## Usage
1. Select files or folders in Finder, open conetxt menu and select Service > **ZIP** (or **ZIP with path**).
2. That's all !
![context menu](https://github.com/pilisir/macOSzip/blob/master/doc/image/contextmenu.png)

## Recommend Setting Hot Key
* You can assign shortcut key for services via Keyboard in System Preferences to make more easily.
* Recommend **[Control] + [Command] + [Z]**, meaning as **Zip** and **[Control] + [Command] + [P]**, meaning as **zip with full parent Path**.
* [Tutorial](https://apple.stackexchange.com/questions/43998/how-do-i-assign-a-keyboard-shortcut-to-a-service-in-os-x)

## FYI
* **ZIP with path** would ignore path, /Documents, if files or folders are already under ~/Documents.
* You can custom destination folder of **ZIP with path** via edit the variable **destDir**.
* I never test it lower than High Sierra.
* You may find out the script not elegant itself, because I never code any shell script before, and I bought my first mac a month ago. I look forward to any suggestion or fork.

## License
MIT License

## Donate
[Donate me via PayPal](https://www.paypal.me/pilisir/0.99usd)\
[Donate me via OPay(歐付寶)](https://p.opay.tw/unUun)
