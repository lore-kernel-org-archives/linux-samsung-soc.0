From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [BUG BISECT] NFS root failure (NULL pointer)
Date: Thu, 6 Sep 2018 09:10:31 +0200
Message-ID: <CAJKOXPc49jh8RCDvn2Meci9iDcnnwGEHo6F7RuhkXpen=f_E8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Today's next fails to mount NFS root under my ARM targets and fails to
mount root from file image under QMU.

[ 21.512866] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[ 21.695484] [<c03bcc04>] (nfs_fs_mount) from [<c02cf6a4>]
(legacy_get_tree+0x34/0xec)
[ 21.703225] [<c02cf6a4>] (legacy_get_tree) from [<c029442c>]
(vfs_get_tree+0x64/0x180)
[ 21.711119] [<c029442c>] (vfs_get_tree) from [<c02b9140>]
(do_mount+0x21c/0x958)
[ 21.718478] [<c02b9140>] (do_mount) from [<c02b9c38>] (ksys_mount+0x8c/0xbc)
[ 21.725513] [<c02b9c38>] (ksys_mount) from [<c0101000>]
(ret_fast_syscall+0x0/0x28)

Full log from ARM (NFS root):
https://krzk.eu/#/builders/25/builds/750/steps/12/logs/serial0

The NFS root failure bisected to:
bae551929c5433bd56ec4dcb97c7d4a50153d357 is the first bad commit
commit bae551929c5433bd56ec4dcb97c7d4a50153d357
Author: David Howells <dhowells@redhat.com>
Date:   Tue Jul 10 21:43:37 2018 +0100

    vfs: Separate changing mount flags full remount

    Separate just the changing of mount flags (MS_REMOUNT|MS_BIND) from full
    remount because the mount data will get parsed with the new fs_context
    stuff prior to doing a remount - and this causes the syscall to fail under
    some circumstances.

The QEMU issue seems slightly different and I did not bisect it. The
QEMU just cannot find rootfs:
[    1.008052] Filesystem requires source device
[    1.008513] VFS: Cannot open root device "mmcblk0" or
unknown-block(179,0): error -2
[    1.008790] Please append a correct "root=" boot option; here are
the available partitions:
[    1.009300] 0100           16384 ram0
[    1.009337]  (driver?)
[    1.009806] fe00            5120 vda
[    1.009843]  driver: virtio_blk
[    1.010296] b300          110592 mmcblk0
[    1.010319]  driver: mmcblk
[    1.010859] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(179,0)
[    1.011580] ---[ end Kernel panic - not syncing: VFS: Unable to
mount root fs on unknown-block(179,0) ]---



Boards config:
1. Arch ARM Linux
2. exynos_defconfig
  - Odroid HC1
    ARMv7, octa-core (Cortex-A7+A15), Exynos5422 SoC
    Systemd: v239
  - Odroid U3
    ARMv7, quad-core, Exynos4412 SoC
    Systemd: v238
  - Odroid XU
    ARMv7, octa-core (Cortex-A7+A15) but only A15 working, Exynos5410 SoC
    Systemd: v236
  - Odroid XU3
    ARMv7, octa-core (Cortex-A7+A15), Exynos5422 SoC
    Systemd: v236
3. Custom VF50 defconfig
  - Toradex Colibri VF50 on Iris board
    ARMv7, UP, Cortext-A5, NXP VF500
    Systemd: v232
4. All boards boot from TFTP with NFS root (NFSv4)
5. QEMU
    ARMv7, vexpress-v2p-ca9, 128 MB RAM



Best regards,
Krzysztof
