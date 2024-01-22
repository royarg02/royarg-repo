---
title: 'royarg-repo'
---

An unofficial ArchLinux repository, hosting packages I use daily.

## Instructions to use

1. Since the hosted packages are signed, `pacman` will require the PGP key of
the packager. [Get it here][1].

2. Add the downloaded key to pacman's list of trusted keys:

    ```console
    # pacman-key --add /path/to/downloaded/keyfile
    ```

3. Ensure that the key is genuine by comparing its fingerprint with **`7B1F 570C
7895 E15E 73D1  3591 23D2 9A86 BCFC C858`**:

    ```console
    $ pacman-key --finger BCFCC858
    gpg: Note: trustdb not writable
    pub   rsa4096 2023-05-17 [SC]
          7B1F 570C 7895 E15E 73D1  3591 23D2 9A86 BCFC C858
    uid           [  full  ] Anurag Roy <anuragr9847@gmail.com>
    ```

4. Locally sign the imported key:

    ```console
    # pacman-key --lsign-key BCFCC858
    ```

5. Add the following lines at the end of `pacman.conf`:

   ```txt
   [royarg-repo]
   Server = https://royarg02.github.io/$repo/os/$arch
   ```

6. Force a refresh(and update) of the package databases:

   ```console
   # pacman -Syyu
   ```

[1]: {{< baseurl >}}key.txt
