# royarg-repo

An unofficial Arch repository hosting packages that I use daily.

## Instructions to use

> [!IMPORTANT]\
> The signing key of this repository has been recently changed. **Existing users** must follow the steps below again.

1. Since the hosted packages are signed, `pacman` will require the PGP key of the packager. Get it [here](https://royarg02.github.io/royarg-repo/key.txt).

2. Add the downloaded key to pacman's list of trusted keys:

    ```shellscript
    # pacman-key --add /path/to/downloaded/keyfile
    ```

3. Ensure that the key is genuine by comparing its fingerprint with **7B1F 570C 7895 E15E 73D1  3591 23D2 9A86 BCFC C858`**:

    ```shellscript
    $ pacman-key --finger BCFCC858
    ```

4. Locally sign the imported key:

    ```shellscript
    # pacman-key --lsign-key BCFCC858
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
