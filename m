From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 00/14] ARM: S5PV310: Updates clock
Date: Mon, 23 Aug 2010 11:05:58 +0900
Message-ID: <AANLkTinjfjiHQ7W5FpwKHKbdAhDxVKwET+9F5082nxhg@mail.gmail.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:44656 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751290Ab0HWCF7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Aug 2010 22:05:59 -0400
Received: by wwd20 with SMTP id 20so506148wwd.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Aug 2010 19:05:58 -0700 (PDT)
In-Reply-To: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Russell King - ARM Linux <linux@arm.linux.org.uk>

Well,

The current V310 clock codes don't work. I wonder these codes are
should be tested by your team. but it's just hang at clock init.

With this patch, it's also don't boot. We also fixed the wrong uart
clock bit. but same. don't works.

Question? Do you can boot with this codes at your board?

Thank you,
Kyungmin Park

Uncompressing Linux... done, booting the kernel.
[    0.000000] Linux version 2.6.36-rc1-ga400ca7-dirty
(dofmind@dofmind-linux) (gcc version 4.4.1 (GCC) ) #334 PREEMPT Mon
Aug 23 10:45:59 KST 2010
[    0.000000] CPU: ARMv7 Processor [412fc091] revision 1 (ARMv7), cr=3D=
10c53c7f
[    0.000000] CPU: VIPT nonaliasing data cache, VIPT nonaliasing
instruction cache
[    0.000000] Machine: UNIVERSAL_C210
[    0.000000] bootconsole [earlycon0] enabled
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] CPU S5PV310 (id 0x43200200)
[    0.000000] S3C24XX Clocks, Copyright 2004 Simtec Electronics
[    0.000000] s3c_register_clksrc: clock armclk has no registers set
[    0.000000] S5PV310: PLL settings, A=3D800000000, M=3D660000000,
E=3D96000000 V=3D108000000
[    0.000000] S5PV310: ARMCLK=3D800000000, DMC=3D330000000, ACLK200=3D=
165000000
[    0.000000] ACLK100=3D82500000, ACLK160=3D132000000, ACLK133=3D11000=
0000
[    0.000000] uclk1: source is mout_mpll (6), rate is 82500000
[    0.000000] uclk1: source is mout_mpll (6), rate is 82500000
[    0.000000] uclk1: source is mout_mpll (6), rate is 82500000
[    0.000000] uclk1: source is mout_mpll (6), rate is 82500000
[    0.000000] sclk_pwm: source is mout_mpll (6), rate is 73333333
[    0.000000] sclk_csis: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_csis: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_cam: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_cam: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimc: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimc: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimc: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimc: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimd: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimd: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_sata: source is mout_mpll (0), rate is 110000000
[    0.000000] sclk_spi: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_spi: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_spi: source is ext_xtal (0), rate is 24000000
[    0.000000] sclk_fimg2d: source is mout_g2d0 (0), rate is 0
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.
Total pages: 130048
[    0.000000] Kernel command line: root=3Dubi0!rootfs rootfstype=3Dubi=
fs
rootflags=3Dbulk_read,no_chk_data_crc ubi.mtd=3D8 ubi.mtd=3D3 ubi.mtd=3D=
6
earlyprintk console=3DttySAC2,115200n8 mem=3D512M mtdparts=3Dsamsung-on=
enan)
[    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144=
 bytes)
[    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 =
bytes)
[    0.000000] Memory: 512MB =3D 512MB total
[    0.000000] Memory: 517040k/517040k available, 7248k reserved, 0K hi=
ghmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
[    0.000000]     vmalloc : 0xe0800000 - 0xf0000000   ( 248 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xe0000000   ( 512 MB)
[    0.000000]     modules : 0xbf000000 - 0xc0000000   (  16 MB)
[    0.000000]       .init : 0xc0008000 - 0xc001f000   (  92 kB)
[    0.000000]       .text : 0xc001f000 - 0xc023b000   (2160 kB)
[    0.000000]       .data : 0xc0250000 - 0xc0271340   ( 133 kB)
[    0.000000] SLUB: Genslabs=3D11, HWalign=3D32, Order=3D0-3, MinObjec=
ts=3D0,
CPUs=3D1, Nodes=3D1
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  RCU-based detection of stalled CPUs is disabled.
[    0.000000]  Verbose stalled-CPUs detection is disabled.
[    0.000000] NR_IRQS:440
[    0.000000] Console: colour dummy device 80x30
s3c24xx_serial_initconsole
s3c24xx_serial_init_ports: initialising ports...
s3c24xx_serial_init_port: port=3Dc026caa0, platdev=3Dc0271b20
s3c24xx_serial_init_port: c026caa0 (hw 0)...
resource c02564b8 (13800000..13800100)
port: map=3D13800000, mem=3Df5000000, irq=3D16 (16,18), clock=3D1
s3c24xx_serial_init_port: port=3Dc026cb68, platdev=3Dc0256f08
s3c24xx_serial_init_port: c026cb68 (hw 1)...
resource c0256528 (13810000..13810100)
port: map=3D13810000, mem=3Df5010000, irq=3D20 (20,22), clock=3D1
s3c24xx_serial_init_port: port=3Dc026cc30, platdev=3Dc0256fe8
s3c24xx_serial_init_port: c026cc30 (hw 2)...
resource c0256598 (13820000..13820100)
port: map=3D13820000, mem=3Df5020000, irq=3D24 (24,26), clock=3D1
s3c24xx_serial_init_port: port=3Dc026ccf8, platdev=3Dc02570c8
s3c24xx_serial_init_port: c026ccf8 (hw 3)...
resource c0256608 (13830000..13830100)
port: map=3D13830000, mem=3Df5030000, irq=3D28 (28,30), clock=3D1
s3c24xx_serial_console_setup: co=3Dc026cd9c (2), 115200n8
s3c24xx_serial_console_setup: port=3Dc026cc30 (2)
s3c24xx_serial_console_setup: baud 115200
selecting clock fffffffe
fracval =3D 0000
config: 8bits/char


On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> This patch updates clock for S5PV310/S5PC210.
>
> [PATCH 01/14] ARM: S5PV310: Adds clock addresses for S5PV310
> [PATCH 02/14] ARM: S5PV310: Removed unused clock
> [PATCH 03/14] ARM: S5PV310: Adds clkset_aclk for removing clkset_aclk=
_xxx
> [PATCH 04/14] ARM: S5PV310: Fix on PLL setting for S5PV310
> [PATCH 05/14] ARM: S5PV310: Adds clk_sclk_usbphy0, _usbphy1, and _hdm=
iphy
> [PATCH 06/14] ARM: S5PV310: Should be clk_sclk_apll not clk_mout_apll
> [PATCH 07/14] ARM: S5PV310: Adds printing ACLK200, ACLK100, ACLK160 a=
nd ACLK133
> [PATCH 08/14] ARM: S5PV310: Adds enable and ctrlbit for clk_vpllsrc
> [PATCH 09/14] ARM: S5PV310: Adds SDMMC clock for S5PV310
> [PATCH 10/14] ARM: S5PV310: Adds uart clocks
> [PATCH 11/14] ARM: S5PV310: Bug fix on uclk1 and sclk_pwm
> [PATCH 12/14] ARM: S5PV310: Add various clocks
> [PATCH 13/14] ARM: S5PV310: Add video clocks
> [PATCH 14/14] ARM: S5PV310: Adds various special clocks
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
