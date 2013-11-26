From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: linux 3.13-rc1 make dw_mmc-exynos more worse
Date: Tue, 26 Nov 2013 01:41:26 +0100
Message-ID: <1468386.irfukHHsPa@flatron>
References: <BLU0-SMTP154F63148320A2FFA456BFADE20@phx.gbl> <CAOesGMim3niC75g3VK1Ue=98NySmUVHyRAOvd-+RWwZ3gHVx2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34636 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752645Ab3KZAl3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Nov 2013 19:41:29 -0500
In-Reply-To: <CAOesGMim3niC75g3VK1Ue=98NySmUVHyRAOvd-+RWwZ3gHVx2w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: randy <lxr1234@hotmail.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Seungwon Jeon <tgih.jun@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

On Sunday 24 of November 2013 22:18:46 Olof Johansson wrote:
> Hi,
> 
> On Sun, Nov 24, 2013 at 4:07 AM, randy <lxr1234@hotmail.com> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > After pull the merge of 3.13-rc1, the dw_mmc-exynos will make the boot
> > stock.In 3.13, it is just stocked udev in 3.13 and makse udev timeout
> > but kernel report the emmc device is found.
> >
> > And in the Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt I
> > saw that it is need to define which gpio ports that a emmc slot use,
> > but when I watched others dts, they use pinctrl, which is correct?
> > Here is the log and dts
> 
> [..]
> 
> > =======================log begin =============================
> [..]
> > [    0.000000] CPU EXYNOS4412 (id 0xe4412011)
> 
> [..]
> 
> > [    1.095000] mmc0: no vmmc regulator found
> > [    1.130000] mmc0: SDHCI controller on samsung-hsmmc
> > [12530000.sdhci] using ADMA
> > [    1.130000] Synopsys Designware Multimedia Card Interface Driver
> > [    1.130000] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000002a
> > [    1.130000] pgd = c0004000
> > [    1.130000] [0000002a] *pgd=00000000
> > [    1.135000] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> > [    1.140000] Modules linked in:
> > [    1.140000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> > 3.13.0-rc1-00008-g584fa45-dirty #3
> > [    1.150000] task: ef0a4000 ti: ef0a8000 task.ti: ef0a8000
> > [    1.155000] PC is at clk_get_rate+0x18/0x5c
> > [    1.160000] LR is at clk_prepare_lock+0xc/0xd8
> > [    1.165000] pc : [<c0319400>]    lr : [<c0318864>]    psr: a0000113
> > [    1.165000] sp : ef0a9e20  ip : ee94eb40  fp : 00000000
> > [    1.175000] r10: c0571510  r9 : ef0a8000  r8 : ef227a10
> > [    1.180000] r7 : c043544c  r6 : fffffffe  r5 : ee94ead0  r4 : fffffffe
> > [    1.185000] r3 : ef0a4000  r2 : 00000001  r1 : 000002b9  r0 : 00000001
> > [    1.195000] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> > Segment kernel
> > [    1.200000] Control: 10c5387d  Table: 4000404a  DAC: 00000015
> > [    1.205000] Process swapper/0 (pid: 1, stack limit = 0xef0a8240)
> > [    1.210000] Stack: (0xef0a9e20 to 0xef0aa000)
> > [    1.215000] 9e20: c0308474 ee9ea610 ee94ead0 c0308488 c0308474
> > ee9ea610 00000000 c030592c
> > [    1.225000] 9e40: ef227a10 00001000 c043544c c020a920 c0838b04
> > 17d78400 ee9ea610 ef227a00
> > [    1.235000] 9e60: ef227a10 c05d6b1c 00000000 c05d6b1c c05890b0
> > ef0a8000 c0571510 c0269448
> > [    1.240000] 9e80: c0269430 ef227a10 c061291c c0268088 00000000
> > ef227a10 c05d6b1c ef227a44
> > [    1.250000] 9ea0: 00000000 c026822c 00000000 c05d6b1c c02681a0
> > c02668a8 ef005478 ef212740
> > [    1.255000] 9ec0: c05d6b1c ef2c7900 c05cf438 c0267864 c0511e38
> > c05d6b1c 00000006 c05d6b1c
> > [    1.265000] 9ee0: 00000006 c059575c c05df580 c026884c 00000000
> > c05a2e14 00000006 c00088dc
> > [    1.275000] 9f00: c0603f70 ef163e00 c040e334 60000113 c05b5000
> > a0000113 c05b5054 c05b5050
> > [    1.280000] 9f20: c05df580 c054ad68 c0839c96 c04247b4 00000093
> > c0035158 c05b5054 c05a2a20
> > [    1.290000] 9f40: c050ae2c c054a438 00000006 00000006 00000000
> > c05a2e14 00000006 c059575c
> > [    1.300000] 9f60: c05df580 00000093 c0595768 c0571510 00000000
> > c0571c48 00000006 00000006
> > [    1.305000] 9f80: c0571510 c003df68 00000000 c0403544 00000000
> > 00000000 00000000 00000000
> > [    1.315000] 9fa0: 00000000 c040354c 00000000 c000e738 00000000
> > 00000000 00000000 00000000
> > [    1.320000] 9fc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [    1.330000] 9fe0: 00000000 00000000 00000000 00000000 00000013
> > 00000000 be73efa4 ffffbffd
> > [    1.340000] [<c0319400>] (clk_get_rate+0x18/0x5c) from [<c0308488>]
> > (dw_mci_exynos_setup_clock+0x14/0x2c)
> > [    1.350000] [<c0308488>] (dw_mci_exynos_setup_clock+0x14/0x2c) from
> > [<c030592c>] (dw_mci_probe+0x15c/0xca4)
> > [    1.360000] [<c030592c>] (dw_mci_probe+0x15c/0xca4) from
> > [<c0269448>] (platform_drv_probe+0x18/0x48)
> > [    1.365000] [<c0269448>] (platform_drv_probe+0x18/0x48) from
> > [<c0268088>] (driver_probe_device+0x100/0x218)
> > [    1.375000] [<c0268088>] (driver_probe_device+0x100/0x218) from
> > [<c026822c>] (__driver_attach+0x8c/0x90)
> > [    1.385000] [<c026822c>] (__driver_attach+0x8c/0x90) from
> > [<c02668a8>] (bus_for_each_dev+0x54/0x88)
> > [    1.395000] [<c02668a8>] (bus_for_each_dev+0x54/0x88) from
> > [<c0267864>] (bus_add_driver+0xd4/0x1d0)
> > [    1.405000] [<c0267864>] (bus_add_driver+0xd4/0x1d0) from
> > [<c026884c>] (driver_register+0x78/0xf4)
> > [    1.415000] [<c026884c>] (driver_register+0x78/0xf4) from
> > [<c00088dc>] (do_one_initcall+0xec/0x148)
> > [    1.420000] [<c00088dc>] (do_one_initcall+0xec/0x148) from
> > [<c0571c48>] (kernel_init_freeable+0xfc/0x1c8)
> > [    1.430000] [<c0571c48>] (kernel_init_freeable+0xfc/0x1c8) from
> > [<c040354c>] (kernel_init+0x8/0x110)
> > [    1.440000] [<c040354c>] (kernel_init+0x8/0x110) from [<c000e738>]
> > (ret_from_fork+0x14/0x3c)
> > [    1.450000] Code: ebfffd18 e3540000 01a05004 0a000008 (e594302c)
> 
> 
> Looks like a clock issue on 4412? I only have 5250 that I boot test
> on, no EXYNOS4 coverage at all (I had an Odroid-X but it wasn't useful
> due to the very old u-boot it came with so I gave it away).
> 
> Tomasz, is this something you can reproduce on 4210/4412?

Nope. All of our boards (exynos4210-trats, exynos4412-trats2) are
configured to use sdhci-s3c for all MMC slots[1], as at the time they got
submitted to mainline, this driver was considered more reliable than
dw-mmc. Not sure about today, though.

[1] On Exynos4 there is one dw-mmc block and four sdhci-s3c blocks,
while there are just four physical busses. Using pin control you can
configure any of the four sets of pins to work either using its dedicated
sdhci-s3c or the only one dw-mmc.

Best regards,
Tomasz
