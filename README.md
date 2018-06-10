# macOS zip service

Do your own easy way to compress files or directories as a clean zip with simple services on macOS Finder.

## Feature
* Zip files or directories without any **hidden** or **garbage** file.
e.g. .DS_Store, __MACOSX . 
* Zip files or directories with the **full path** beginning ~/, known as *username*, to the ~/Documents directory.
## Install
There are two way to create the services.
##### Way 1: Copy and Paste
1. Directly download this project and uncompress it.
2. Move two service files to the local service folder. You can easily move directory __*Library*__ under __*./dest/*__ of this project to your local __*$USER*__ directory.  (Please set your Finder eanble to see hidden directories via shortcut key **[Shift] + [Command] + [.]**  first.)
3. Done !
##### Way 2: Create services yourself.
1. Open **Automator** app.
2. Press **[Command] + [N]** to new a document which type is *Service*.
3. Select __*Action > Library > Files & Folders > Get Selected Finder Items*__ and drag it to the right side as Step One.
4. Select __*Action > Library > Utillities > Run Shell Script*__ and drag it to the right side as Step Two.
5. Drop down **Pass input** of Step Two and select the **as arguments**.
6. Copy content text of file from this project, __*./src/zip.sh*__, paste it as the Step Two shell content text.
7. Look up the top, drop down **Service recives selected** and select **files or folders**.
8. Press **[Command] + [S]** to save this service with specified name "**ZIP**" (or any custom name yourself). 
9. Done !
10. To create second Service, **ZIP With Path**, just repeat Way 2 and change to copy content text from __*./src/zip_with_path.sh*__.

## Usage
1. Select files or directories in Finder, open conetxt menu and select Service > **ZIP** (or **ZIP with path**).
2. That's all !

## FYI
* You can add shortcut key for those two services via macOS to make more easily.
* You may find script not elegant itself, because I never code any shell script before, and I bought my first mac month ago. I look forward to any suggestion or fork.

## License
MIT License

