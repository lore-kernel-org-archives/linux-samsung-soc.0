From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: exynos4: fix secondary CPU boot
Date: Wed, 29 Jun 2011 14:52:37 +0900
Message-ID: <BANLkTimeBUaBujqybqZiuzV5GWsjiO1mvw@mail.gmail.com>
References: <1305899190-16732-1-git-send-email-marc.zyngier@arm.com>
	<4DDD3C57.6020705@samsung.com>
	<1306346645.27474.182.camel@e102391-lin.cambridge.arm.com>
	<4DDD531A.50604@samsung.com>
	<1306422710.27474.237.camel@e102391-lin.cambridge.arm.com>
	<BANLkTi=fjq5ki8BGDhQxHVD3u-s7W-C1rw@mail.gmail.com>
	<1307003689.31098.6.camel@e102391-lin.cambridge.arm.com>
	<BANLkTi=mvCgi_6Y57aVjpwrMhL58zPcUHw@mail.gmail.com>
	<1307004853.31098.12.camel@e102391-lin.cambridge.arm.com>
	<BANLkTi=hEBKTpEq6daMyEdLo63aet52Gbg@mail.gmail.com>
	<BANLkTinov=XKF5dH9EOpMj=oQC7oyKGKfA@mail.gmail.com>
	<4DF8811B.9090506@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:56723 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750892Ab1F2Fwj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2011 01:52:39 -0400
Received: by vws1 with SMTP id 1so663749vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jun 2011 22:52:38 -0700 (PDT)
In-Reply-To: <4DF8811B.9090506@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Angus Ainslie <angus.ainslie@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

It's first step to handle the EVT.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>


> Jazz is not dead. It just smells funny...
> From a24392183d396fab790557b0efb35e840c9e8a81 Mon Sep 17 00:00:00 200=
1
> From: Marc Zyngier <marc.zyngier@arm.com>
> Date: Fri, 20 May 2011 14:38:25 +0100
> Subject: [PATCH] ARM: exynos4: fix secondary CPU boot on early SoC re=
visions
>
> It appears that the system-wide flags register that used to be at
> 0x02025000 on the first revision of Exynos4 has moved to 0x02020000.
>
> The kernel has been updated accordingly, but this unfortunately leave=
s
> early boards without SMP support (the secondary CPU spins endlessly
> in BL0 waiting for an address to be written at that memory location).
>
> Solve the problem by providing an s3c_get_chip_id() function, common
> to all s3c/s5p implementations, and test the result on the secondary =
boot
> path.
>
> Revision table, as provided by Kyungmin Park <kmpark@infradead.org>:
> 0x4320 0200 EVT0
> 0x4321 0210 EVT1
> 0x4321 0211 EVT2
>
> The last 8 bits can be overrided by efuses, so only bits [16:19] are
> used to identify the revision.
>
> Tested on a vintage SMDK-v310.
>
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Kyungmin Park <kmpark@infradead.org>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---
> =A0arch/arm/mach-exynos4/include/mach/map.h | =A0 =A01 +
> =A0arch/arm/mach-exynos4/platsmp.c =A0 =A0 =A0 =A0 =A0| =A0 22 ++++++=
+++++++++++++++-
> =A0arch/arm/plat-samsung/include/plat/cpu.h | =A0 =A02 ++
> =A0arch/arm/plat-samsung/init.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A08 ++=
++++++
> =A04 files changed, 32 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach=
-exynos4/include/mach/map.h
> index 57d8074..da08f5c 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -24,6 +24,7 @@
> =A0#include <plat/map-s5p.h>
>
> =A0#define EXYNOS4_PA_SYSRAM =A0 =A0 =A0 =A0 =A0 =A0 =A00x02020000
> +#define EXYNOS4_PA_SYSRAM_EVT0 =A0 =A0 =A0 =A0 0x02025000
>
> =A0#define EXYNOS4_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x11800000
> =A0#define EXYNOS4_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x11810000
> diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exynos4/=
platsmp.c
> index c5e65a0..086d1e3 100644
> --- a/arch/arm/mach-exynos4/platsmp.c
> +++ b/arch/arm/mach-exynos4/platsmp.c
> @@ -26,6 +26,8 @@
> =A0#include <asm/smp_scu.h>
> =A0#include <asm/unified.h>
>
> +#include <plat/cpu.h>
> +
> =A0#include <mach/hardware.h>
> =A0#include <mach/regs-clock.h>
>
> @@ -170,6 +172,24 @@ void __init platform_smp_prepare_cpus(unsigned i=
nt max_cpus)
> =A0 =A0 =A0 =A0 * system-wide flags register. The boot monitor waits
> =A0 =A0 =A0 =A0 * until it receives a soft interrupt, and then the
> =A0 =A0 =A0 =A0 * secondary CPU branches to this address.
> + =A0 =A0 =A0 =A0*
> + =A0 =A0 =A0 =A0* EVT0 has the system-wide flags register at a diffe=
rent
> + =A0 =A0 =A0 =A0* address, hence the following hackery...
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 __raw_writel(BSYM(virt_to_phys(exynos4_secondary_startu=
p)), S5P_VA_SYSRAM);
> + =A0 =A0 =A0 if (s3c_get_chip_id() & 0xF0000UL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(BSYM(virt_to_phys(exynos4_=
secondary_startup)),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_VA_SYSRA=
M);
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 void __iomem *sysram_evt0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sysram_evt0 =3D ioremap(EXYNOS4_PA_SYSR=
AM_EVT0, SZ_4K);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!sysram_evt0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Unable to remap=
 EXYNOS4_PA_SYSRAM_EVT0\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(BSYM(virt_to_phys(exynos4_=
secondary_startup)),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sysram_evt0)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(sysram_evt0);
> + =A0 =A0 =A0 }
> +
> =A0}
> diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat=
-samsung/include/plat/cpu.h
> index c0a5741..41573cc 100644
> --- a/arch/arm/plat-samsung/include/plat/cpu.h
> +++ b/arch/arm/plat-samsung/include/plat/cpu.h
> @@ -44,6 +44,8 @@ struct cpu_table {
> =A0extern void s3c_init_cpu(unsigned long idcode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct cpu_table *cpu=
s, unsigned int cputab_size);
>
> +extern unsigned long s3c_get_chip_id(void);
> +
> =A0/* core initialisation functions */
>
> =A0extern void s3c24xx_init_irq(void);
> diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/ini=
t.c
> index 79d10fc..320b88f 100644
> --- a/arch/arm/plat-samsung/init.c
> +++ b/arch/arm/plat-samsung/init.c
> @@ -30,6 +30,7 @@
> =A0#include <plat/regs-serial.h>
>
> =A0static struct cpu_table *cpu;
> +static unsigned long s3c_chip_id;
>
> =A0static struct cpu_table * __init s3c_lookup_cpu(unsigned long idco=
de,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0struct cpu_table *tab,
> @@ -60,6 +61,8 @@ void __init s3c_init_cpu(unsigned long idcode,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0panic("Unsupported Samsung CPU");
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 s3c_chip_id =3D idcode;
> +
> =A0 =A0 =A0 =A0cpu->map_io();
> =A0}
>
> @@ -140,6 +143,11 @@ void __init s3c24xx_init_uarts(struct s3c2410_ua=
rtcfg *cfg, int no)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(cpu->init_uarts)(cfg, no);
> =A0}
>
> +unsigned long s3c_get_chip_id(void)
> +{
> + =A0 =A0 =A0 return s3c_chip_id;
> +}
> +
> =A0static int __init s3c_arch_init(void)
> =A0{
> =A0 =A0 =A0 =A0int ret;
> --
> 1.7.0.4
>
>
