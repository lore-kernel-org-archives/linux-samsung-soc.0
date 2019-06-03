From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [BUG BISECT] bug mm/vmalloc.c:470 (mm/vmalloc.c: get rid of one
 single unlink_va() when merge)
Date: Mon, 3 Jun 2019 11:07:46 +0200
Message-ID: <CAJKOXPcTVpLtSSs=Q0G3fQgXYoVa=kHxWcWXyvS13ie73ByZBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Hillf Danton <hdanton@sina.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On recent next I see bugs during boot (after bringing up user-space or
during reboot):
kernel BUG at ../mm/vmalloc.c:470!
On all my boards. On QEMU I see something similar, although the
message is "Internal error: Oops - undefined instruction: 0 [#1] ARM",

The calltrace is:
[   34.565126] [<c0275c9c>] (__free_vmap_area) from [<c0276044>]
(__purge_vmap_area_lazy+0xd0/0x170)
[   34.573963] [<c0276044>] (__purge_vmap_area_lazy) from [<c0276d50>]
(_vm_unmap_aliases+0x1fc/0x244)
[   34.582974] [<c0276d50>] (_vm_unmap_aliases) from [<c0279500>]
(__vunmap+0x170/0x200)
[   34.590770] [<c0279500>] (__vunmap) from [<c01d5a70>]
(do_free_init+0x40/0x5c)
[   34.597955] [<c01d5a70>] (do_free_init) from [<c01478f4>]
(process_one_work+0x228/0x810)
[   34.606018] [<c01478f4>] (process_one_work) from [<c0147f0c>]
(worker_thread+0x30/0x570)
[   34.614077] [<c0147f0c>] (worker_thread) from [<c014e8b4>]
(kthread+0x134/0x164)
[   34.621438] [<c014e8b4>] (kthread) from [<c01010b4>]
(ret_from_fork+0x14/0x20)

Full log here:
https://krzk.eu/#/builders/1/builds/3356/steps/14/logs/serial0
https://krzk.eu/#/builders/22/builds/1118/steps/35/logs/serial0

Bisect pointed to:
728e0fbf263e3ed359c10cb13623390564102881 is the first bad commit
commit 728e0fbf263e3ed359c10cb13623390564102881
Author: Uladzislau Rezki (Sony) <urezki@gmail.com>
Date:   Sat Jun 1 12:20:19 2019 +1000
    mm/vmalloc.c: get rid of one single unlink_va() when merge

Boards:
1. Arch ARM Linux
2. exynos_defconfig
3. Exynos boards (Odroid XU3, etc), ARMv7, octa-core (Cortex-A7+A15),
Exynos5422 SoC
4. Systemd: v239, static IP set in kernel command line

Best regards,
Krzysztof
