From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [BUG][BISECT] NFSv4 root failures after "fs/locks: allow a lock
 request to block other requests."
Date: Wed, 15 Aug 2018 14:28:32 +0200
Message-ID: <CAJKOXPc2cb1OK3tmRCO2p+docdXY=PoU1MEBa-VDyEM4mG1eSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.com>, Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, "J. Bruce Fields" <bfields@fieldses.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Bisect pointed commit ce3147990450a68b3f549088b30f087742a08b5d
("fs/locks: allow a lock request to block other requests.") to failure
boot of NFSv4 with root on several boards.

Log is here:
https://krzk.eu/#/builders/21/builds/836/steps/12/logs/serial0

With several errors:
kernel BUG at ../fs/locks.c:336!
Unable to handle kernel NULL pointer dereference at virtual address 00000004

Configuration:
1. exynos_defconfig
2. Arch ARM Linux
3. Boards:
a. Odroid family (ARMv7, octa-core (Cortex-A7+A15), Exynos5422 SoC)
b. Toradex Colibri VF50 (ARMv7, UP, Cortex-A5)
4. Systemd: v236, 238
5. All boards boot from TFTP with NFS root (NFSv4)

On Colibri VF50 I got slightly different errors:
[   11.663204] Internal error: Oops - undefined instruction: 0 [#1] ARM
[   12.455273] Unable to handle kernel NULL pointer dereference at
virtual address 00000004
and only with some specific GCC (v6.3) or with other conditions which
I did not bisect yet. Maybe Colibri's failure is unrelated to that
commit.

Best regards,
Krzysztof
