# royarg-repo

A custom/unofficial Arch repository hosting packages built from custom `PKGBUILDS`.

## Instructions to use

1. Since the hosted packages are signed, `pacman` will require the PGP key of the packager. Get mine [here](https://royarg02.github.io/assets/anurag.aexpk).

2. Add the downloaded key to pacman's list of trusted keys:

    ```shellscript
    # pacman-key --add /path/to/downloaded/keyfile
    ```

3. Ensure that the key is genuine by comparing its fingerprint with **`F304 C077 661C EE88 30C5  FDC1 D794 9DA4 D7EB D6CF`**:

    ```shellscript
    $ pacman-key --finger D7EBD6CF
    ```

4. Locally sign the imported key:

    ```shellscript
    # pacman-key --lsign-key D7EBD6CF
    ```

5. Add the following lines at the end of `pacman.conf` to include this repository:

   ```shellscript
   [royarg-repo]
   Server = https://royarg02.github.io/$repo/os/$arch
   ```

6. Force a refresh(and update if necessary) of the package databases:

   ```shellscript
   # pacman -Syyu
   ```
