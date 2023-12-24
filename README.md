# GmodE2Collection

![last download](https://github.com/thereisnotime/GmodE2Collection/actions/workflows/get-external-collections.yml/badge.svg)

Expression2 Collection that includes all of my E2s and some other external E2s that I like - some are random, some are crappy but all of them will make you happy.
This repository also has an action that will automatically download all external E2s repositories in this one repository every week just to keep them up to date.

## Structure

- `_local` the local files that will be gitignored

## Usage

Just place the files from the repository in your expression2 folder, example:

```powershell
git clone https://github.com/thereisnotime/GmodE2Collection -o C:\SteamLibrary\steamapps\common\GarrysMod\garrysmod\data\expression2
```

## Updating

To update the collection, just run the following command:

```powershell
git pull
```

## Development

You might want to check this nice extension for VSCode - <https://github.com/Vurv78/Expression-LS>.
