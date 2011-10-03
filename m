From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS: Add ARCH_EXYNOS and reorganize arch/arm/mach-exynos
Date: Mon, 3 Oct 2011 13:02:16 +0900
Message-ID: <CAH9JG2UNwZxDTPnwjohxhCumKZx_mWcPUn2rROjmjmROoxF07w@mail.gmail.com>
References: <001f01cc80e5$3abd1c80$b0375580$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:43420 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819Ab1JCECS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Oct 2011 00:02:18 -0400
Received: by qyk30 with SMTP id 30so1706731qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Oct 2011 21:02:17 -0700 (PDT)
In-Reply-To: <001f01cc80e5$3abd1c80$b0375580$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@arm.linux.org.uk>, =?EUC-KR?B?waSw5sflL1MvVyBTb2x1dGlvbrCzud/GwChTLkxTSSkvRTUow6XA0ykvu++8usD8?= =?EUC-KR?B?wNo=?= <kyoungheon@samsung.com>

Hi,

I'm afraid to change machine directory name again. mach-s5pv310 ->
mach-exynos4 -> mach-exynos.
As I remember linus blamed the renaming the file names are happened
frequently at ARM

Thank you,
Kyungmin Park

2011/10/2 Kukjin Kim <kgene.kim@samsung.com>:
> The arch/arm/mach-exynos4 directory (CONFIG_ARCH_EXYNOS4) has
> made for plaforms based on EXYNOS4 SoCs. But since upcoming
> Samsung's SoCs such as EXYNOS5 (ARM Cortex A15) can reuse most
> codes in current mach-exynos4, one mach-exynos directory will
> be used for them.
>
> This patch changes to CONFIG_ARCH_EXYNOS (arch/arm/mach-exynos)
> but keeps original CONFIG_ARCH_EXYNOS4 in mach-exynos/Kconfig to
> avoid changing in driver side.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> NOTE: The codes for upcoming SoCs will be implemented soon.
>
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 =A08 +-
> =A0arch/arm/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/configs/exynos4_defconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A07 +--
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/Kconfig =A0 =A0 | =A0 41 =
+++++++++---
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/Makefile =A0 =A0| =A0 =A0=
8 +-
> =A0.../{mach-exynos4 =3D> mach-exynos}/Makefile.boot =A0 =A0| =A0 =A0=
0
> =A0.../clock-exynos4210.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A00
> =A0.../clock-exynos4212.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/clock.c =A0 =A0 | =A0 =A0=
0
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/cpu.c =A0 =A0 =A0 | =A0 6=
9 +++++++++++---------
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/cpuidle.c =A0 | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-ahci.c =A0| =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-audio.c | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-dwmci.c | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-pd.c =A0 =A0| =A0 =A0=
0
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/dev-sysmmu.c | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/dma.c =A0 =A0 =A0 | =A0 =A0=
0
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/headsmp.S =A0 | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/hotplug.c =A0 | =A0 =A00
> =A0.../include/mach/debug-macro.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
> =A0.../include/mach/dma.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A00
> =A0.../include/mach/dwmci.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A00
> =A0.../include/mach/entry-macro.S =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
> =A0.../include/mach/exynos4-clock.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A00
> =A0.../include/mach/gpio.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A00
> =A0.../include/mach/hardware.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A00
> =A0.../include/mach/io.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A00
> =A0.../include/mach/irqs.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A00
> =A0.../include/mach/map.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 32 ++++++----
> =A0.../include/mach/memory.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A00
> =A0.../include/mach/pm-core.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A00
> =A0.../include/mach/pmu.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A00
> =A0.../include/mach/regs-audss.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A00
> =A0.../include/mach/regs-clock.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A00
> =A0.../include/mach/regs-gpio.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
> =A0.../include/mach/regs-irq.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A00
> =A0.../include/mach/regs-mct.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A00
> =A0.../include/mach/regs-mem.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A00
> =A0.../include/mach/regs-pmu.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A00
> =A0.../include/mach/regs-sysmmu.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A00
> =A0.../include/mach/regs-usb-phy.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A00
> =A0.../include/mach/sysmmu.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A00
> =A0.../include/mach/system.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A00
> =A0.../include/mach/timex.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A00
> =A0.../include/mach/uncompress.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A00
> =A0.../include/mach/vmalloc.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/init.c =A0 =A0 =A0| =A0 =A0=
0
> =A0.../{mach-exynos4 =3D> mach-exynos}/irq-combiner.c =A0 | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/irq-eint.c =A0| =A0 =A00
> =A0.../mach-armlex4210.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-nuri.c | =A0 =A00
> =A0.../{mach-exynos4 =3D> mach-exynos}/mach-origen.c =A0 =A0| =A0 =A0=
0
> =A0.../{mach-exynos4 =3D> mach-exynos}/mach-smdk4x12.c =A0| =A0 =A00
> =A0.../{mach-exynos4 =3D> mach-exynos}/mach-smdkv310.c =A0| =A0 =A00
> =A0.../mach-universal_c210.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/mct.c =A0 =A0 =A0 | =A0 =A0=
0
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/platsmp.c =A0 | =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/pm.c =A0 =A0 =A0 =A0| =A0=
 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/pmu.c =A0 =A0 =A0 | =A0 =A0=
0
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-fimc.c | =A0 =A00
> =A0.../{mach-exynos4 =3D> mach-exynos}/setup-fimd0.c =A0 =A0| =A0 =A0=
0
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c0.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c1.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c2.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c3.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c4.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c5.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c6.c | =A0 =A00
> =A0.../arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c7.c | =A0 =A00
> =A0.../{mach-exynos4 =3D> mach-exynos}/setup-keypad.c =A0 | =A0 =A00
> =A0.../setup-sdhci-gpio.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 | =A0 =A00
> =A0.../{mach-exynos4 =3D> mach-exynos}/setup-sdhci.c =A0 =A0| =A0 =A0=
0
> =A0.../{mach-exynos4 =3D> mach-exynos}/setup-usb-phy.c =A0| =A0 =A00
> =A0arch/arm/{mach-exynos4 =3D> mach-exynos}/sleep.S =A0 =A0 | =A0 =A0=
0
> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/plat-s5p/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 =A06 +-
> =A0arch/arm/plat-samsung/include/plat/exynos4.h =A0 =A0 =A0 | =A0 =A0=
6 +-
> =A077 files changed, 104 insertions(+), 77 deletions(-)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/Kconfig (91%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/Makefile (89%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/Makefile.boot (100=
%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/clock-exynos4210.c=
 (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/clock-exynos4212.c=
 (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/clock.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/cpu.c (91%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/cpuidle.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-ahci.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-audio.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-dwmci.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-pd.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/dev-sysmmu.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/dma.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/headsmp.S (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/hotplug.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/debug=
-macro.S (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/dma.h=
 (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/dwmci=
=2Eh (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/entry=
-macro.S (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/exyno=
s4-clock.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/gpio.=
h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/hardw=
are.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/io.h =
(100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/irqs.=
h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/map.h=
 (93%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/memor=
y.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/pm-co=
re.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/pmu.h=
 (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
audss.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
clock.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
gpio.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
irq.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
mct.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
mem.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
pmu.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
sysmmu.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/regs-=
usb-phy.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/sysmm=
u.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/syste=
m.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/timex=
=2Eh (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/uncom=
press.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/include/mach/vmall=
oc.h (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/init.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/irq-combiner.c (10=
0%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/irq-eint.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-armlex4210.c =
(100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-nuri.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-origen.c (100=
%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-smdk4x12.c (1=
00%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-smdkv310.c (1=
00%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mach-universal_c21=
0.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/mct.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/platsmp.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/pm.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/pmu.c (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-fimc.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-fimd0.c (100=
%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c0.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c1.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c2.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c3.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c4.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c5.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c6.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-i2c7.c (100%=
)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-keypad.c (10=
0%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-sdhci-gpio.c=
 (100%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-sdhci.c (100=
%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/setup-usb-phy.c (1=
00%)
> =A0rename arch/arm/{mach-exynos4 =3D> mach-exynos}/sleep.S (100%)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index bea81d0..21dbf01 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -781,8 +781,8 @@ config ARCH_S5PV210
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S5PV210/S5PC110 series based systems
>
> -config ARCH_EXYNOS4
> - =A0 =A0 =A0 bool "Samsung EXYNOS4"
> +config ARCH_EXYNOS
> + =A0 =A0 =A0 bool "SAMSUNG EXYNOS"
> =A0 =A0 =A0 =A0select CPU_V7
> =A0 =A0 =A0 =A0select ARCH_SPARSEMEM_ENABLE
> =A0 =A0 =A0 =A0select ARCH_HAS_HOLES_MEMORYMODEL
> @@ -795,7 +795,7 @@ config ARCH_EXYNOS4
> =A0 =A0 =A0 =A0select HAVE_S3C2410_I2C if I2C
> =A0 =A0 =A0 =A0select HAVE_S3C2410_WATCHDOG if WATCHDOG
> =A0 =A0 =A0 =A0help
> - =A0 =A0 =A0 =A0 Samsung EXYNOS4 series based systems
> + =A0 =A0 =A0 =A0 Support for SAMSUNG's EXYNOS SoCs (EXYNOS4/5)
>
> =A0config ARCH_SHARK
> =A0 =A0 =A0 =A0bool "Shark"
> @@ -1021,7 +1021,7 @@ source "arch/arm/mach-s5pc100/Kconfig"
>
> =A0source "arch/arm/mach-s5pv210/Kconfig"
>
> -source "arch/arm/mach-exynos4/Kconfig"
> +source "arch/arm/mach-exynos/Kconfig"
>
> =A0source "arch/arm/mach-shmobile/Kconfig"
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 70c424e..289439e 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -177,7 +177,7 @@ machine-$(CONFIG_ARCH_S3C64XX) =A0 =A0 =A0 =A0 =A0=
 =A0 =A0:=3D s3c64xx
> =A0machine-$(CONFIG_ARCH_S5P64X0) =A0 =A0 =A0 =A0 :=3D s5p64x0
> =A0machine-$(CONFIG_ARCH_S5PC100) =A0 =A0 =A0 =A0 :=3D s5pc100
> =A0machine-$(CONFIG_ARCH_S5PV210) =A0 =A0 =A0 =A0 :=3D s5pv210
> -machine-$(CONFIG_ARCH_EXYNOS4) =A0 =A0 =A0 =A0 :=3D exynos4
> +machine-$(CONFIG_ARCH_EXYNOS4) =A0 =A0 =A0 =A0 :=3D exynos
> =A0machine-$(CONFIG_ARCH_SA1100) =A0 =A0 =A0 =A0 =A0:=3D sa1100
> =A0machine-$(CONFIG_ARCH_SHARK) =A0 =A0 =A0 =A0 =A0 :=3D shark
> =A0machine-$(CONFIG_ARCH_SHMOBILE) =A0 =A0 =A0 =A0:=3D shmobile
> diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/ex=
ynos4_defconfig
> index cd40bb5..b0d3c13 100644
> --- a/arch/arm/configs/exynos4_defconfig
> +++ b/arch/arm/configs/exynos4_defconfig
> @@ -4,10 +4,9 @@ CONFIG_KALLSYMS_ALL=3Dy
> =A0CONFIG_MODULES=3Dy
> =A0CONFIG_MODULE_UNLOAD=3Dy
> =A0# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_ARCH_EXYNOS4=3Dy
> +CONFIG_ARCH_EXYNOS=3Dy
> =A0CONFIG_S3C_LOWLEVEL_UART_PORT=3D1
> =A0CONFIG_MACH_SMDKC210=3Dy
> -CONFIG_MACH_SMDKV310=3Dy
> =A0CONFIG_MACH_ARMLEX4210=3Dy
> =A0CONFIG_MACH_UNIVERSAL_C210=3Dy
> =A0CONFIG_MACH_NURI=3Dy
> @@ -16,7 +15,6 @@ CONFIG_NO_HZ=3Dy
> =A0CONFIG_HIGH_RES_TIMERS=3Dy
> =A0CONFIG_SMP=3Dy
> =A0CONFIG_NR_CPUS=3D2
> -CONFIG_HOTPLUG_CPU=3Dy
> =A0CONFIG_PREEMPT=3Dy
> =A0CONFIG_AEABI=3Dy
> =A0CONFIG_CMDLINE=3D"root=3D/dev/ram0 rw ramdisk=3D8192 initrd=3D0x41=
000000,8M console=3DttySAC1,115200 init=3D/linuxrc mem=3D256M"
> @@ -61,12 +59,9 @@ CONFIG_DETECT_HUNG_TASK=3Dy
> =A0CONFIG_DEBUG_RT_MUTEXES=3Dy
> =A0CONFIG_DEBUG_SPINLOCK=3Dy
> =A0CONFIG_DEBUG_MUTEXES=3Dy
> -CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
> =A0CONFIG_DEBUG_INFO=3Dy
> -# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> =A0CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
> =A0CONFIG_DEBUG_USER=3Dy
> -CONFIG_DEBUG_ERRORS=3Dy
> =A0CONFIG_DEBUG_LL=3Dy
> =A0CONFIG_EARLY_PRINTK=3Dy
> =A0CONFIG_DEBUG_S3C_UART=3D1
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos/Kco=
nfig
> similarity index 91%
> rename from arch/arm/mach-exynos4/Kconfig
> rename to arch/arm/mach-exynos/Kconfig
> index 6dfde07..999989e 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -1,4 +1,4 @@
> -# arch/arm/mach-exynos4/Kconfig
> +# arch/arm/mach-exynos/Kconfig
> =A0#
> =A0# Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> =A0# =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com/
> @@ -7,21 +7,42 @@
>
> =A0# Configuration options for the EXYNOS4
>
> -if ARCH_EXYNOS4
> +if ARCH_EXYNOS
> +
> +menu "SAMSUNG EXYNOS SoCs Support"
> +
> +choice
> + =A0 =A0 =A0 prompt "EXYNOS System Type"
> + =A0 =A0 =A0 default ARCH_EXYNOS4
> +
> +config ARCH_EXYNOS4
> + =A0 =A0 =A0 bool "SAMSUNG EXYNOS4"
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Samsung EXYNOS4 SoCs based systems
> +
> +endchoice
> +
> +comment "EXYNOS SoCs"
>
> =A0config CPU_EXYNOS4210
> - =A0 =A0 =A0 bool
> + =A0 =A0 =A0 bool "SAMSUNG EXYNOS4210"
> + =A0 =A0 =A0 default y
> + =A0 =A0 =A0 depends on ARCH_EXYNOS4
> =A0 =A0 =A0 =A0select SAMSUNG_DMADEV
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Enable EXYNOS4210 CPU support
>
> =A0config SOC_EXYNOS4212
> - =A0 =A0 =A0 bool
> + =A0 =A0 =A0 bool "SAMSUNG EXYNOS4212"
> + =A0 =A0 =A0 default y
> + =A0 =A0 =A0 depends on ARCH_EXYNOS4
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Enable EXYNOS4212 SoC support
>
> =A0config SOC_EXYNOS4412
> - =A0 =A0 =A0 bool
> + =A0 =A0 =A0 bool "SAMSUNG EXYNOS4412"
> + =A0 =A0 =A0 default y
> + =A0 =A0 =A0 depends on ARCH_EXYNOS4
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Enable EXYNOS4412 SoC support
>
> @@ -119,7 +140,7 @@ config EXYNOS4_SETUP_USB_PHY
>
> =A0# machine support
>
> -menu "EXYNOS4 Machines"
> +if ARCH_EXYNOS4
>
> =A0comment "EXYNOS4210 Boards"
>
> @@ -286,12 +307,11 @@ config MACH_SMDK4412
> =A0 =A0 =A0 =A0select MACH_SMDK4212
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung SMDK4412
> +endif
>
> -endmenu
> -
> -comment "Configuration for HSMMC bus width"
> +if ARCH_EXYNOS4
>
> -menu "Use 8-bit bus width"
> +comment "Configuration for HSMMC 8-bit bus width"
>
> =A0config EXYNOS4_SDHCI_CH0_8BIT
> =A0 =A0 =A0 =A0bool "Channel 0 with 8-bit bus"
> @@ -304,6 +324,7 @@ config EXYNOS4_SDHCI_CH2_8BIT
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support HSMMC Channel 2 8-bit bus.
> =A0 =A0 =A0 =A0 =A0If selected, Channel 3 is disabled.
> +endif
>
> =A0endmenu
>
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos/Ma=
kefile
> similarity index 89%
> rename from arch/arm/mach-exynos4/Makefile
> rename to arch/arm/mach-exynos/Makefile
> index c9b2e1f..fa715eb 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -1,4 +1,4 @@
> -# arch/arm/mach-exynos4/Makefile
> +# arch/arm/mach-exynos/Makefile
> =A0#
> =A0# Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> =A0# =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com/
> @@ -12,8 +12,8 @@ obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0:=3D
>
> =A0# Core support for EXYNOS4 system
>
> -obj-$(CONFIG_ARCH_EXYNOS4) =A0 =A0 +=3D cpu.o init.o clock.o irq-com=
biner.o
> -obj-$(CONFIG_ARCH_EXYNOS4) =A0 =A0 +=3D setup-i2c0.o irq-eint.o dma.=
o pmu.o
> +obj-$(CONFIG_ARCH_EXYNOS) =A0 =A0 =A0+=3D cpu.o init.o clock.o irq-c=
ombiner.o setup-i2c0.o
> +obj-$(CONFIG_ARCH_EXYNOS4) =A0 =A0 +=3D irq-eint.o dma.o pmu.o
> =A0obj-$(CONFIG_CPU_EXYNOS4210) =A0 +=3D clock-exynos4210.o
> =A0obj-$(CONFIG_SOC_EXYNOS4212) =A0 +=3D clock-exynos4212.o
> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o sleep.o
> @@ -39,7 +39,7 @@ obj-$(CONFIG_MACH_SMDK4412) =A0 =A0 =A0 =A0 =A0 +=3D=
 mach-smdk4x12.o
>
> =A0# device support
>
> -obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D dev-audio.o
> +obj-$(CONFIG_ARCH_EXYNOS4) =A0 =A0 =A0 =A0 =A0 =A0 +=3D dev-audio.o
> =A0obj-$(CONFIG_EXYNOS4_DEV_AHCI) =A0 =A0 =A0 =A0 +=3D dev-ahci.o
> =A0obj-$(CONFIG_EXYNOS4_DEV_PD) =A0 =A0 =A0 =A0 =A0 +=3D dev-pd.o
> =A0obj-$(CONFIG_EXYNOS4_DEV_SYSMMU) =A0 =A0 =A0 +=3D dev-sysmmu.o
> diff --git a/arch/arm/mach-exynos4/Makefile.boot b/arch/arm/mach-exyn=
os/Makefile.boot
> similarity index 100%
> rename from arch/arm/mach-exynos4/Makefile.boot
> rename to arch/arm/mach-exynos/Makefile.boot
> diff --git a/arch/arm/mach-exynos4/clock-exynos4210.c b/arch/arm/mach=
-exynos/clock-exynos4210.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/clock-exynos4210.c
> rename to arch/arm/mach-exynos/clock-exynos4210.c
> diff --git a/arch/arm/mach-exynos4/clock-exynos4212.c b/arch/arm/mach=
-exynos/clock-exynos4212.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/clock-exynos4212.c
> rename to arch/arm/mach-exynos/clock-exynos4212.c
> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos/clo=
ck.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/clock.c
> rename to arch/arm/mach-exynos/clock.c
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos/cpu.c
> similarity index 91%
> rename from arch/arm/mach-exynos4/cpu.c
> rename to arch/arm/mach-exynos/cpu.c
> index 5b1765b..90ec247 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos/cpu.c
> @@ -1,4 +1,4 @@
> -/* linux/arch/arm/mach-exynos4/cpu.c
> +/* linux/arch/arm/mach-exynos/cpu.c
> =A0*
> =A0* Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> @@ -40,28 +40,47 @@ extern int combiner_init(unsigned int combiner_nr=
, void __iomem *base,
> =A0extern void combiner_cascade_irq(unsigned int combiner_nr, unsigne=
d int irq);
>
> =A0/* Initial IO mappings */
> -static struct map_desc exynos4_iodesc[] __initdata =3D {
> +static struct map_desc exynos_iodesc[] __initdata =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_SYSTIMER,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_SYSTIMER),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS_PA_SYSTIMER),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_CMU,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_CMU),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_128K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_PMU,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_PMU),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS_PA_PMU),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_64K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_COMBINER_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_COMBINER),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS_PA_COMBINER),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GIC_CPU,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS_PA_GIC_CPU),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GIC_DIST,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS_PA_GIC_DIST),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct map_desc exynos4_iodesc[] __initdata =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_CMU,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_CMU),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_128K,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> + =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_COREPERI_BASE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(EXYNOS4_PA_COREPERI),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_8K,
> @@ -92,11 +111,6 @@ static struct map_desc exynos4_iodesc[] __initdat=
a =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S3C_VA_UART,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(S3C_PA_UART),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_512K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> - =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.virtual =A0 =A0 =A0 =A0=3D (unsigned =
long)S5P_VA_SROMC,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(EXYNOS4_PA_SROMC),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> @@ -106,16 +120,6 @@ static struct map_desc exynos4_iodesc[] __initda=
ta =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys=
_to_pfn(EXYNOS4_PA_HSPHY),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.length =A0 =A0 =A0 =A0 =3D SZ_4K,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVIC=
E,
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GIC_CPU,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_GIC_CPU),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned l=
ong)S5P_VA_GIC_DIST,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_=
to_pfn(EXYNOS4_PA_GIC_DIST),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_64K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .type =A0 =A0 =A0 =A0 =A0 =3D MT_DEVICE=
,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -137,7 +141,7 @@ static struct map_desc exynos4_iodesc1[] __initda=
ta =3D {
> =A0 =A0 =A0 =A0},
> =A0};
>
> -static void exynos4_idle(void)
> +static void exynos_idle(void)
> =A0{
> =A0 =A0 =A0 =A0if (!need_resched())
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cpu_do_idle();
> @@ -151,12 +155,13 @@ static void exynos4_sw_reset(void)
> =A0}
>
> =A0/*
> - * exynos4_map_io
> + * exynos_map_io
> =A0*
> =A0* register the standard cpu IO areas
> =A0*/
> =A0void __init exynos4_map_io(void)
> =A0{
> + =A0 =A0 =A0 iotable_init(exynos_iodesc, ARRAY_SIZE(exynos_iodesc));
> =A0 =A0 =A0 =A0iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc=
));
>
> =A0 =A0 =A0 =A0if (soc_is_exynos4210() && samsung_rev() =3D=3D EXYNOS=
4210_REV_0)
> @@ -250,7 +255,6 @@ static int __init exynos4_core_init(void)
> =A0{
> =A0 =A0 =A0 =A0return sysdev_class_register(&exynos4_sysclass);
> =A0}
> -
> =A0core_initcall(exynos4_core_init);
>
> =A0#ifdef CONFIG_CACHE_L2X0
> @@ -279,15 +283,16 @@ static int __init exynos4_l2x0_cache_init(void)
> =A0early_initcall(exynos4_l2x0_cache_init);
> =A0#endif
>
> -int __init exynos4_init(void)
> +int __init exynos_init(void)
> =A0{
> - =A0 =A0 =A0 printk(KERN_INFO "EXYNOS4: Initializing architecture\n"=
);
> + =A0 =A0 =A0 printk(KERN_INFO "EXYNOS: Initializing architecture\n")=
;
>
> =A0 =A0 =A0 =A0/* set idle function */
> - =A0 =A0 =A0 pm_idle =3D exynos4_idle;
> + =A0 =A0 =A0 pm_idle =3D exynos_idle;
>
> =A0 =A0 =A0 =A0/* set sw_reset function */
> - =A0 =A0 =A0 s5p_reset_hook =3D exynos4_sw_reset;
> + =A0 =A0 =A0 if (soc_is_exynos4210() || soc_is_exynos4212() || soc_i=
s_exynos4412())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s5p_reset_hook =3D exynos4_sw_reset;
>
> =A0 =A0 =A0 =A0return sysdev_register(&exynos4_sysdev);
> =A0}
> diff --git a/arch/arm/mach-exynos4/cpuidle.c b/arch/arm/mach-exynos/c=
puidle.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/cpuidle.c
> rename to arch/arm/mach-exynos/cpuidle.c
> diff --git a/arch/arm/mach-exynos4/dev-ahci.c b/arch/arm/mach-exynos/=
dev-ahci.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/dev-ahci.c
> rename to arch/arm/mach-exynos/dev-ahci.c
> diff --git a/arch/arm/mach-exynos4/dev-audio.c b/arch/arm/mach-exynos=
/dev-audio.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/dev-audio.c
> rename to arch/arm/mach-exynos/dev-audio.c
> diff --git a/arch/arm/mach-exynos4/dev-dwmci.c b/arch/arm/mach-exynos=
/dev-dwmci.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/dev-dwmci.c
> rename to arch/arm/mach-exynos/dev-dwmci.c
> diff --git a/arch/arm/mach-exynos4/dev-pd.c b/arch/arm/mach-exynos/de=
v-pd.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/dev-pd.c
> rename to arch/arm/mach-exynos/dev-pd.c
> diff --git a/arch/arm/mach-exynos4/dev-sysmmu.c b/arch/arm/mach-exyno=
s/dev-sysmmu.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/dev-sysmmu.c
> rename to arch/arm/mach-exynos/dev-sysmmu.c
> diff --git a/arch/arm/mach-exynos4/dma.c b/arch/arm/mach-exynos/dma.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/dma.c
> rename to arch/arm/mach-exynos/dma.c
> diff --git a/arch/arm/mach-exynos4/headsmp.S b/arch/arm/mach-exynos/h=
eadsmp.S
> similarity index 100%
> rename from arch/arm/mach-exynos4/headsmp.S
> rename to arch/arm/mach-exynos/headsmp.S
> diff --git a/arch/arm/mach-exynos4/hotplug.c b/arch/arm/mach-exynos/h=
otplug.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/hotplug.c
> rename to arch/arm/mach-exynos/hotplug.c
> diff --git a/arch/arm/mach-exynos4/include/mach/debug-macro.S b/arch/=
arm/mach-exynos/include/mach/debug-macro.S
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/debug-macro.S
> rename to arch/arm/mach-exynos/include/mach/debug-macro.S
> diff --git a/arch/arm/mach-exynos4/include/mach/dma.h b/arch/arm/mach=
-exynos/include/mach/dma.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/dma.h
> rename to arch/arm/mach-exynos/include/mach/dma.h
> diff --git a/arch/arm/mach-exynos4/include/mach/dwmci.h b/arch/arm/ma=
ch-exynos/include/mach/dwmci.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/dwmci.h
> rename to arch/arm/mach-exynos/include/mach/dwmci.h
> diff --git a/arch/arm/mach-exynos4/include/mach/entry-macro.S b/arch/=
arm/mach-exynos/include/mach/entry-macro.S
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/entry-macro.S
> rename to arch/arm/mach-exynos/include/mach/entry-macro.S
> diff --git a/arch/arm/mach-exynos4/include/mach/exynos4-clock.h b/arc=
h/arm/mach-exynos/include/mach/exynos4-clock.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/exynos4-clock.h
> rename to arch/arm/mach-exynos/include/mach/exynos4-clock.h
> diff --git a/arch/arm/mach-exynos4/include/mach/gpio.h b/arch/arm/mac=
h-exynos/include/mach/gpio.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/gpio.h
> rename to arch/arm/mach-exynos/include/mach/gpio.h
> diff --git a/arch/arm/mach-exynos4/include/mach/hardware.h b/arch/arm=
/mach-exynos/include/mach/hardware.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/hardware.h
> rename to arch/arm/mach-exynos/include/mach/hardware.h
> diff --git a/arch/arm/mach-exynos4/include/mach/io.h b/arch/arm/mach-=
exynos/include/mach/io.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/io.h
> rename to arch/arm/mach-exynos/include/mach/io.h
> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mac=
h-exynos/include/mach/irqs.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/irqs.h
> rename to arch/arm/mach-exynos/include/mach/irqs.h
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach=
-exynos/include/mach/map.h
> similarity index 93%
> rename from arch/arm/mach-exynos4/include/mach/map.h
> rename to arch/arm/mach-exynos/include/mach/map.h
> index 918a979..058541d 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -1,4 +1,4 @@
> -/* linux/arch/arm/mach-exynos4/include/mach/map.h
> +/* linux/arch/arm/mach-exynos/include/mach/map.h
> =A0*
> =A0* Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> =A0* =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> @@ -145,39 +145,45 @@
> =A0#define S3C_PA_IIC5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4=
_PA_IIC(5)
> =A0#define S3C_PA_IIC6 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4=
_PA_IIC(6)
> =A0#define S3C_PA_IIC7 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4=
_PA_IIC(7)
> -#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_AD=
C
> -#define SAMSUNG_PA_ADC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0EXYNOS4_PA_ADC1
> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_PA_RTC
> =A0#define S3C_PA_WDT =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_PA_WATCHDOG
> +#define S3C_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_UART
>
> =A0#define S5P_PA_CHIPID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_CHIPID
> +#define S5P_PA_EHCI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_EHCI
> =A0#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_FIMC0
> =A0#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_FIMC1
> =A0#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_FIMC2
> =A0#define S5P_PA_FIMC3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_FIMC3
> +#define S5P_PA_FIMD0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_=
=46IMD0
> +#define S5P_PA_HDMI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_HDMI
> +#define S5P_PA_IIC_HDMIPHY =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_IIC_HD=
MIPHY
> +#define S5P_PA_MFC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_MFC
> =A0#define S5P_PA_MIPI_CSIS0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_PA_MI=
PI_CSIS0
> =A0#define S5P_PA_MIPI_CSIS1 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_PA_MI=
PI_CSIS1
> -#define S5P_PA_FIMD0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_=
=46IMD0
> +#define S5P_PA_MIXER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_=
MIXER
> =A0#define S5P_PA_ONENAND =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_=
ONENAND
> =A0#define S5P_PA_ONENAND_DMA =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_ONEN=
AND_DMA
> +#define S5P_PA_SDO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_SDO
> =A0#define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_SDRAM
> =A0#define S5P_PA_SROMC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_SROMC
> -#define S5P_PA_MFC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_MFC
> =A0#define S5P_PA_SYSCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_SYSCON
> =A0#define S5P_PA_TIMER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_TIMER
> -#define S5P_PA_EHCI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_EHCI
> -
> -#define S5P_PA_SDO =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_P=
A_SDO
> =A0#define S5P_PA_VP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNO=
S4_PA_VP
> -#define S5P_PA_MIXER =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_=
MIXER
> -#define S5P_PA_HDMI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_HDMI
> -#define S5P_PA_IIC_HDMIPHY =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_IIC_HD=
MIPHY
>
> +#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_AD=
C
> +#define SAMSUNG_PA_ADC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0EXYNOS4_PA_ADC1
> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_PA_KE=
YPAD
>
> -/* UART */
> +#define EXYNOS_PA_COMBINER =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_COMBIN=
ER
> +#define EXYNOS_PA_GIC_CPU =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_PA_GIC_=
CPU
> +#define EXYNOS_PA_GIC_DIST =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_GIC_DI=
ST
> +#define EXYNOS_PA_PMU =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_PA_=
PMU
> +#define EXYNOS_PA_SYSTIMER =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_PA_SYSTIM=
ER
>
> -#define S3C_PA_UART =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0EXYNOS4_P=
A_UART
> +/* Compatibility UART */
> +
> +#define S3C_VA_UARTx(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
>
> =A0#define S5P_PA_UART(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (S3C_PA_UAR=
T + ((x) * S3C_UART_OFFSET))
> =A0#define S5P_PA_UART0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_PA_UA=
RT(0)
> diff --git a/arch/arm/mach-exynos4/include/mach/memory.h b/arch/arm/m=
ach-exynos/include/mach/memory.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/memory.h
> rename to arch/arm/mach-exynos/include/mach/memory.h
> diff --git a/arch/arm/mach-exynos4/include/mach/pm-core.h b/arch/arm/=
mach-exynos/include/mach/pm-core.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/pm-core.h
> rename to arch/arm/mach-exynos/include/mach/pm-core.h
> diff --git a/arch/arm/mach-exynos4/include/mach/pmu.h b/arch/arm/mach=
-exynos/include/mach/pmu.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/pmu.h
> rename to arch/arm/mach-exynos/include/mach/pmu.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-audss.h b/arch/a=
rm/mach-exynos/include/mach/regs-audss.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-audss.h
> rename to arch/arm/mach-exynos/include/mach/regs-audss.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/a=
rm/mach-exynos/include/mach/regs-clock.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-clock.h
> rename to arch/arm/mach-exynos/include/mach/regs-clock.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-gpio.h b/arch/ar=
m/mach-exynos/include/mach/regs-gpio.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-gpio.h
> rename to arch/arm/mach-exynos/include/mach/regs-gpio.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-irq.h b/arch/arm=
/mach-exynos/include/mach/regs-irq.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-irq.h
> rename to arch/arm/mach-exynos/include/mach/regs-irq.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-mct.h b/arch/arm=
/mach-exynos/include/mach/regs-mct.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-mct.h
> rename to arch/arm/mach-exynos/include/mach/regs-mct.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-mem.h b/arch/arm=
/mach-exynos/include/mach/regs-mem.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-mem.h
> rename to arch/arm/mach-exynos/include/mach/regs-mem.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h b/arch/arm=
/mach-exynos/include/mach/regs-pmu.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-pmu.h
> rename to arch/arm/mach-exynos/include/mach/regs-pmu.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-sysmmu.h b/arch/=
arm/mach-exynos/include/mach/regs-sysmmu.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-sysmmu.h
> rename to arch/arm/mach-exynos/include/mach/regs-sysmmu.h
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-usb-phy.h b/arch=
/arm/mach-exynos/include/mach/regs-usb-phy.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/regs-usb-phy.h
> rename to arch/arm/mach-exynos/include/mach/regs-usb-phy.h
> diff --git a/arch/arm/mach-exynos4/include/mach/sysmmu.h b/arch/arm/m=
ach-exynos/include/mach/sysmmu.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/sysmmu.h
> rename to arch/arm/mach-exynos/include/mach/sysmmu.h
> diff --git a/arch/arm/mach-exynos4/include/mach/system.h b/arch/arm/m=
ach-exynos/include/mach/system.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/system.h
> rename to arch/arm/mach-exynos/include/mach/system.h
> diff --git a/arch/arm/mach-exynos4/include/mach/timex.h b/arch/arm/ma=
ch-exynos/include/mach/timex.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/timex.h
> rename to arch/arm/mach-exynos/include/mach/timex.h
> diff --git a/arch/arm/mach-exynos4/include/mach/uncompress.h b/arch/a=
rm/mach-exynos/include/mach/uncompress.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/uncompress.h
> rename to arch/arm/mach-exynos/include/mach/uncompress.h
> diff --git a/arch/arm/mach-exynos4/include/mach/vmalloc.h b/arch/arm/=
mach-exynos/include/mach/vmalloc.h
> similarity index 100%
> rename from arch/arm/mach-exynos4/include/mach/vmalloc.h
> rename to arch/arm/mach-exynos/include/mach/vmalloc.h
> diff --git a/arch/arm/mach-exynos4/init.c b/arch/arm/mach-exynos/init=
=2Ec
> similarity index 100%
> rename from arch/arm/mach-exynos4/init.c
> rename to arch/arm/mach-exynos/init.c
> diff --git a/arch/arm/mach-exynos4/irq-combiner.c b/arch/arm/mach-exy=
nos/irq-combiner.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/irq-combiner.c
> rename to arch/arm/mach-exynos/irq-combiner.c
> diff --git a/arch/arm/mach-exynos4/irq-eint.c b/arch/arm/mach-exynos/=
irq-eint.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/irq-eint.c
> rename to arch/arm/mach-exynos/irq-eint.c
> diff --git a/arch/arm/mach-exynos4/mach-armlex4210.c b/arch/arm/mach-=
exynos/mach-armlex4210.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mach-armlex4210.c
> rename to arch/arm/mach-exynos/mach-armlex4210.c
> diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos=
/mach-nuri.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mach-nuri.c
> rename to arch/arm/mach-exynos/mach-nuri.c
> diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exyn=
os/mach-origen.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mach-origen.c
> rename to arch/arm/mach-exynos/mach-origen.c
> diff --git a/arch/arm/mach-exynos4/mach-smdk4x12.c b/arch/arm/mach-ex=
ynos/mach-smdk4x12.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mach-smdk4x12.c
> rename to arch/arm/mach-exynos/mach-smdk4x12.c
> diff --git a/arch/arm/mach-exynos4/mach-smdkv310.c b/arch/arm/mach-ex=
ynos/mach-smdkv310.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mach-smdkv310.c
> rename to arch/arm/mach-exynos/mach-smdkv310.c
> diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/m=
ach-exynos/mach-universal_c210.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mach-universal_c210.c
> rename to arch/arm/mach-exynos/mach-universal_c210.c
> diff --git a/arch/arm/mach-exynos4/mct.c b/arch/arm/mach-exynos/mct.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/mct.c
> rename to arch/arm/mach-exynos/mct.c
> diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exynos/p=
latsmp.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/platsmp.c
> rename to arch/arm/mach-exynos/platsmp.c
> diff --git a/arch/arm/mach-exynos4/pm.c b/arch/arm/mach-exynos/pm.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/pm.c
> rename to arch/arm/mach-exynos/pm.c
> diff --git a/arch/arm/mach-exynos4/pmu.c b/arch/arm/mach-exynos/pmu.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/pmu.c
> rename to arch/arm/mach-exynos/pmu.c
> diff --git a/arch/arm/mach-exynos4/setup-fimc.c b/arch/arm/mach-exyno=
s/setup-fimc.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-fimc.c
> rename to arch/arm/mach-exynos/setup-fimc.c
> diff --git a/arch/arm/mach-exynos4/setup-fimd0.c b/arch/arm/mach-exyn=
os/setup-fimd0.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-fimd0.c
> rename to arch/arm/mach-exynos/setup-fimd0.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c0.c b/arch/arm/mach-exyno=
s/setup-i2c0.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c0.c
> rename to arch/arm/mach-exynos/setup-i2c0.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c1.c b/arch/arm/mach-exyno=
s/setup-i2c1.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c1.c
> rename to arch/arm/mach-exynos/setup-i2c1.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c2.c b/arch/arm/mach-exyno=
s/setup-i2c2.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c2.c
> rename to arch/arm/mach-exynos/setup-i2c2.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c3.c b/arch/arm/mach-exyno=
s/setup-i2c3.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c3.c
> rename to arch/arm/mach-exynos/setup-i2c3.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c4.c b/arch/arm/mach-exyno=
s/setup-i2c4.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c4.c
> rename to arch/arm/mach-exynos/setup-i2c4.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c5.c b/arch/arm/mach-exyno=
s/setup-i2c5.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c5.c
> rename to arch/arm/mach-exynos/setup-i2c5.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c6.c b/arch/arm/mach-exyno=
s/setup-i2c6.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c6.c
> rename to arch/arm/mach-exynos/setup-i2c6.c
> diff --git a/arch/arm/mach-exynos4/setup-i2c7.c b/arch/arm/mach-exyno=
s/setup-i2c7.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-i2c7.c
> rename to arch/arm/mach-exynos/setup-i2c7.c
> diff --git a/arch/arm/mach-exynos4/setup-keypad.c b/arch/arm/mach-exy=
nos/setup-keypad.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-keypad.c
> rename to arch/arm/mach-exynos/setup-keypad.c
> diff --git a/arch/arm/mach-exynos4/setup-sdhci-gpio.c b/arch/arm/mach=
-exynos/setup-sdhci-gpio.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-sdhci-gpio.c
> rename to arch/arm/mach-exynos/setup-sdhci-gpio.c
> diff --git a/arch/arm/mach-exynos4/setup-sdhci.c b/arch/arm/mach-exyn=
os/setup-sdhci.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-sdhci.c
> rename to arch/arm/mach-exynos/setup-sdhci.c
> diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-ex=
ynos/setup-usb-phy.c
> similarity index 100%
> rename from arch/arm/mach-exynos4/setup-usb-phy.c
> rename to arch/arm/mach-exynos/setup-usb-phy.c
> diff --git a/arch/arm/mach-exynos4/sleep.S b/arch/arm/mach-exynos/sle=
ep.S
> similarity index 100%
> rename from arch/arm/mach-exynos4/sleep.S
> rename to arch/arm/mach-exynos/sleep.S
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index f9241a7..4e98f09 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -7,7 +7,7 @@
>
> =A0config PLAT_S5P
> =A0 =A0 =A0 =A0bool
> - =A0 =A0 =A0 depends on (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV21=
0 || ARCH_EXYNOS4)
> + =A0 =A0 =A0 depends on (ARCH_S5P64X0 || ARCH_S5PC100 || ARCH_S5PV21=
0 || ARCH_EXYNOS)
> =A0 =A0 =A0 =A0default y
> =A0 =A0 =A0 =A0select ARM_VIC if !ARCH_EXYNOS4
> =A0 =A0 =A0 =A0select ARM_GIC if ARCH_EXYNOS4
> diff --git a/arch/arm/plat-s5p/cpu.c b/arch/arm/plat-s5p/cpu.c
> index 7b0a28f..a56959e 100644
> --- a/arch/arm/plat-s5p/cpu.c
> +++ b/arch/arm/plat-s5p/cpu.c
> @@ -75,7 +75,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D exynos4_ma=
p_io,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_clocks =A0 =A0=3D exynos4_init_c=
locks,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_uarts =A0 =A0 =3D exynos4_init_u=
arts,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos4_i=
nit,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos_in=
it,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D name_exy=
nos4210,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.idcode =A0 =A0 =A0 =A0 =3D EXYNOS4212=
_CPU_ID,
> @@ -83,7 +83,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D exynos4_ma=
p_io,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_clocks =A0 =A0=3D exynos4_init_c=
locks,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_uarts =A0 =A0 =3D exynos4_init_u=
arts,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos4_i=
nit,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos_in=
it,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D name_exy=
nos4212,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.idcode =A0 =A0 =A0 =A0 =3D EXYNOS4412=
_CPU_ID,
> @@ -91,7 +91,7 @@ static struct cpu_table cpu_ids[] __initdata =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.map_io =A0 =A0 =A0 =A0 =3D exynos4_ma=
p_io,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_clocks =A0 =A0=3D exynos4_init_c=
locks,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.init_uarts =A0 =A0 =3D exynos4_init_u=
arts,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos4_i=
nit,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .init =A0 =A0 =A0 =A0 =A0 =3D exynos_in=
it,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D name_exy=
nos4412,
> =A0 =A0 =A0 =A0},
> =A0};
> diff --git a/arch/arm/plat-samsung/include/plat/exynos4.h b/arch/arm/=
plat-samsung/include/plat/exynos4.h
> index 20d73bf..f546e88 100644
> --- a/arch/arm/plat-samsung/include/plat/exynos4.h
> +++ b/arch/arm/plat-samsung/include/plat/exynos4.h
> @@ -18,8 +18,8 @@ extern void exynos4210_register_clocks(void);
> =A0extern void exynos4212_register_clocks(void);
> =A0extern void exynos4_setup_clocks(void);
>
> -#ifdef CONFIG_ARCH_EXYNOS4
> -extern =A0int exynos4_init(void);
> +#ifdef CONFIG_ARCH_EXYNOS
> +extern =A0int exynos_init(void);
> =A0extern void exynos4_init_irq(void);
> =A0extern void exynos4_map_io(void);
> =A0extern void exynos4_init_clocks(int xtal);
> @@ -31,5 +31,5 @@ extern struct sys_timer exynos4_timer;
> =A0#define exynos4_init_clocks NULL
> =A0#define exynos4_init_uarts NULL
> =A0#define exynos4_map_io NULL
> -#define exynos4_init NULL
> +#define exynos_init NULL
> =A0#endif
> --
> 1.7.1
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
