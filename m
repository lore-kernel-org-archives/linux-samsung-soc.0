From: Romain Naour <romain.naour@openwide.fr>
Subject: Re: [PATCH] S3C24XX: add clockevent/clocksource support
Date: Fri, 26 Oct 2012 12:51:01 +0200
Message-ID: <508A6B15.1040609@openwide.fr>
References: <50885608.1030503@openwide.fr> <6694372.nV9NvELlFJ@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from zimbra3.corp.accelance.fr ([213.162.49.233]:59623 "EHLO
	zimbra3.corp.accelance.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758267Ab2JZKvL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Oct 2012 06:51:11 -0400
In-Reply-To: <6694372.nV9NvELlFJ@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Hi Tomasz,

Thank you for your reply.

Le 25/10/2012 22:39, Tomasz Figa a =E9crit :
> Hi Romain,
>=20
> On Wednesday 24 of October 2012 22:56:40 Romain Naour wrote:
>> Hi,
>>
>> This patch converts the s3c24xx timer driver to the
>> clocksource/clockevent API. I made some test on a mini2440 board and=
 I
>> had to reduce timers frequency to 1MHz in order to produce a timer's
>> overflow every 64ms. Initial timer's frequency (8,45MHz) provide onl=
y
>> 7ms between each overflow. It is not enough. As timers were previous=
ly
>> used to produce an IRQ at 200Hz, some board (Osiris, Anubis board) u=
se
>> an external 12MHz signal to clock the timers (tclk1). So, I changed
>> their configuration to select internal pclk clock instead, but I can=
't
>> test it. Also, I created a new file (s3c24xx_time.c) to avoid impact=
ing
>> the s3c64xx. Kernel rev v3.7-rc1
>>
>> Do you have any comments on this patch ?
>=20
> Generally looks fine, but I have some doubts:
>=20
> - Isn't 64ms still way too little for overflow period? Someone who is=
 more=20
> into Linux time keeping should comment on this.

It seems to work correctly with 64ms.
Actually, it start to work with 15,5ms (timer's frequency =3D 4,21MHz)

>=20
> - Much of the code is duplicated from s5p-time, maybe s5p-time could =
be=20
> made a generic samsung-time instead? It could be also used for S3C64x=
x.

I'm agree, It would be great if we can use hrtimer on s3c64xx too :)
I made another patch following your advice, but I'm not sure if we real=
ly need to rename sp5-time.c and s5p_* functions.
I tested this patch with and without hrtimer enabled on my mini2440.
But, I need a confirmation for the frequency of pclk for each cpu.
Normally it is between 70MHz and 50MHz.
Also, we may need to define specific TSCALER_DIV TDIV value for s3c64xx=
=2E (samsung-time.h)

>=20
> CC'ing Heiko and Sylwester, as they might find this patch interesting=
=2E
>=20
> Best regards,
> Tomasz Figa
>=20

Regards,
Romain Naour

Here is the new patch:

---
 arch/arm/Kconfig                                  |   6 +-
 arch/arm/mach-exynos/mach-universal_c210.c        |   4 +-
 arch/arm/mach-s3c24xx/Kconfig                     |   6 +
 arch/arm/mach-s3c24xx/mach-amlm5900.c             |   3 +
 arch/arm/mach-s3c24xx/mach-anubis.c               |   2 +
 arch/arm/mach-s3c24xx/mach-at2440evb.c            |   2 +
 arch/arm/mach-s3c24xx/mach-bast.c                 |   2 +
 arch/arm/mach-s3c24xx/mach-gta02.c                |   2 +
 arch/arm/mach-s3c24xx/mach-h1940.c                |   2 +
 arch/arm/mach-s3c24xx/mach-jive.c                 |   2 +
 arch/arm/mach-s3c24xx/mach-mini2440.c             |   4 +-
 arch/arm/mach-s3c24xx/mach-n30.c                  |   2 +
 arch/arm/mach-s3c24xx/mach-nexcoder.c             |   2 +
 arch/arm/mach-s3c24xx/mach-osiris.c               |   2 +
 arch/arm/mach-s3c24xx/mach-otom.c                 |   2 +
 arch/arm/mach-s3c24xx/mach-qt2410.c               |   2 +
 arch/arm/mach-s3c24xx/mach-rx1950.c               |   2 +
 arch/arm/mach-s3c24xx/mach-rx3715.c               |   2 +
 arch/arm/mach-s3c24xx/mach-smdk2410.c             |   2 +
 arch/arm/mach-s3c24xx/mach-smdk2413.c             |   2 +
 arch/arm/mach-s3c24xx/mach-smdk2416.c             |   2 +
 arch/arm/mach-s3c24xx/mach-smdk2440.c             |   2 +
 arch/arm/mach-s3c24xx/mach-smdk2443.c             |   2 +
 arch/arm/mach-s3c24xx/mach-tct_hammer.c           |   2 +
 arch/arm/mach-s3c24xx/mach-vr1000.c               |   2 +
 arch/arm/mach-s3c24xx/mach-vstms.c                |   3 +-
 arch/arm/mach-s3c64xx/mach-anw6410.c              |   2 +
 arch/arm/mach-s3c64xx/mach-crag6410.c             |   2 +
 arch/arm/mach-s3c64xx/mach-hmt.c                  |   2 +
 arch/arm/mach-s3c64xx/mach-mini6410.c             |   2 +
 arch/arm/mach-s3c64xx/mach-ncp.c                  |   2 +
 arch/arm/mach-s3c64xx/mach-real6410.c             |   2 +
 arch/arm/mach-s3c64xx/mach-smartq.c               |   2 +
 arch/arm/mach-s3c64xx/mach-smartq5.c              |   1 +
 arch/arm/mach-s3c64xx/mach-smartq7.c              |   1 +
 arch/arm/mach-s3c64xx/mach-smdk6400.c             |   2 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c             |   2 +
 arch/arm/mach-s5p64x0/Kconfig                     |   4 +-
 arch/arm/mach-s5p64x0/mach-smdk6440.c             |   4 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c             |   4 +-
 arch/arm/mach-s5pv210/Kconfig                     |   2 +-
 arch/arm/mach-s5pv210/mach-aquila.c               |   4 +-
 arch/arm/mach-s5pv210/mach-goni.c                 |   4 +-
 arch/arm/mach-s5pv210/mach-smdkc110.c             |   4 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c             |   4 +-
 arch/arm/mach-s5pv210/mach-torbreck.c             |   4 +-
 arch/arm/plat-samsung/Kconfig                     |   2 +-
 arch/arm/plat-samsung/Makefile                    |   2 +-
 arch/arm/plat-samsung/include/plat/s5p-time.h     |  40 ---
 arch/arm/plat-samsung/include/plat/samsung-time.h |  51 +++
 arch/arm/plat-samsung/s5p-time.c                  | 405 --------------=
--------
 arch/arm/plat-samsung/samsung-time.c              | 405 ++++++++++++++=
++++++++
 52 files changed, 555 insertions(+), 470 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/s5p-time.h
 create mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
 delete mode 100644 arch/arm/plat-samsung/s5p-time.c
 create mode 100644 arch/arm/plat-samsung/samsung-time.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 73067ef..c1ac8a5 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -737,7 +737,8 @@ config ARCH_SA1100
 config ARCH_S3C24XX
 	bool "Samsung S3C24XX SoCs"
 	select ARCH_HAS_CPUFREQ
-	select ARCH_USES_GETTIMEOFFSET
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
 	select CLKDEV_LOOKUP
 	select GENERIC_GPIO
 	select HAVE_CLK
@@ -756,7 +757,8 @@ config ARCH_S3C64XX
 	bool "Samsung S3C64XX"
 	select ARCH_HAS_CPUFREQ
 	select ARCH_REQUIRE_GPIOLIB
-	select ARCH_USES_GETTIMEOFFSET
+	select GENERIC_CLOCKEVENTS
+	select CLKSRC_MMIO
 	select ARM_VIC
 	select CLKDEV_LOOKUP
 	select CPU_V6
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach=
-exynos/mach-universal_c210.c
index ebc9dd3..3b9ec1c 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -41,7 +41,7 @@
 #include <plat/mfc.h>
 #include <plat/sdhci.h>
 #include <plat/fimc-core.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/camport.h>
 #include <linux/platform_data/mipi-csis.h>
=20
@@ -1099,7 +1099,7 @@ static void __init universal_map_io(void)
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs)=
);
-	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
=20
 static void s5p_tv_setup(void)
diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kcon=
fig
index 2b6cb5f..be2c482 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -21,6 +21,7 @@ config CPU_S3C2410
 	select S3C2410_CLOCK
 	select S3C2410_CPUFREQ if CPU_FREQ_S3C24XX
 	select S3C2410_PM if PM
+	select SAMSUNG_HRT
 	help
 	  Support for S3C2410 and S3C2410A family from the S3C24XX line
 	  of Samsung Mobile CPUs.
@@ -32,6 +33,7 @@ config CPU_S3C2412
 	select CPU_LLSERIAL_S3C2440
 	select S3C2412_DMA if S3C24XX_DMA
 	select S3C2412_PM if PM
+	select SAMSUNG_HRT
 	help
 	  Support for the S3C2412 and S3C2413 SoCs from the S3C24XX line
=20
@@ -44,6 +46,7 @@ config CPU_S3C2416
 	select S3C2443_COMMON
 	select S3C2443_DMA if S3C24XX_DMA
 	select SAMSUNG_CLKSRC
+	select SAMSUNG_HRT
 	help
 	  Support for the S3C2416 SoC from the S3C24XX line
=20
@@ -54,6 +57,7 @@ config CPU_S3C2440
 	select S3C2410_CLOCK
 	select S3C2410_PM if PM
 	select S3C2440_DMA if S3C24XX_DMA
+	select SAMSUNG_HRT
 	help
 	  Support for S3C2440 Samsung Mobile CPU based systems.
=20
@@ -63,6 +67,7 @@ config CPU_S3C2442
 	select CPU_LLSERIAL_S3C2440
 	select S3C2410_CLOCK
 	select S3C2410_PM if PM
+	select SAMSUNG_HRT
 	help
 	  Support for S3C2442 Samsung Mobile CPU based systems.
=20
@@ -78,6 +83,7 @@ config CPU_S3C2443
 	select S3C2443_COMMON
 	select S3C2443_DMA if S3C24XX_DMA
 	select SAMSUNG_CLKSRC
+	select SAMSUNG_HRT
 	help
 	  Support for the S3C2443 SoC from the S3C24XX line
=20
diff --git a/arch/arm/mach-s3c24xx/mach-amlm5900.c b/arch/arm/mach-s3c2=
4xx/mach-amlm5900.c
index f4ad99c..5d5a07c 100644
--- a/arch/arm/mach-s3c24xx/mach-amlm5900.c
+++ b/arch/arm/mach-s3c24xx/mach-amlm5900.c
@@ -63,6 +63,8 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/physmap.h>
=20
+#include <plat/samsung-time.h>
+
 #include "common.h"
=20
 static struct resource amlm5900_nor_resource =3D
@@ -160,6 +162,7 @@ static void __init amlm5900_map_io(void)
 	s3c24xx_init_io(amlm5900_iodesc, ARRAY_SIZE(amlm5900_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(amlm5900_uartcfgs, ARRAY_SIZE(amlm5900_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 #ifdef CONFIG_FB_S3C2410
diff --git a/arch/arm/mach-s3c24xx/mach-anubis.c b/arch/arm/mach-s3c24x=
x/mach-anubis.c
index 1ee8c46..7d323ed 100644
--- a/arch/arm/mach-s3c24xx/mach-anubis.c
+++ b/arch/arm/mach-s3c24xx/mach-anubis.c
@@ -54,6 +54,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
=20
 #include "simtec.h"
 #include "common.h"
@@ -414,6 +415,7 @@ static void __init anubis_map_io(void)
 	s3c24xx_init_io(anubis_iodesc, ARRAY_SIZE(anubis_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(anubis_uartcfgs, ARRAY_SIZE(anubis_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* check for the newer revision boards with large page nand */
=20
diff --git a/arch/arm/mach-s3c24xx/mach-at2440evb.c b/arch/arm/mach-s3c=
24xx/mach-at2440evb.c
index 00381fe..1e93cb3 100644
--- a/arch/arm/mach-s3c24xx/mach-at2440evb.c
+++ b/arch/arm/mach-s3c24xx/mach-at2440evb.c
@@ -48,6 +48,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/mmc-s3cmci.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -192,6 +193,7 @@ static void __init at2440evb_map_io(void)
 	s3c24xx_init_io(at2440evb_iodesc, ARRAY_SIZE(at2440evb_iodesc));
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(at2440evb_uartcfgs, ARRAY_SIZE(at2440evb_uartcfgs)=
);
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init at2440evb_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-bast.c b/arch/arm/mach-s3c24xx/=
mach-bast.c
index 6a30ce7..be3cc7a 100644
--- a/arch/arm/mach-s3c24xx/mach-bast.c
+++ b/arch/arm/mach-s3c24xx/mach-bast.c
@@ -63,6 +63,7 @@
 #include <plat/cpu-freq.h>
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
=20
 #include "simtec.h"
 #include "common.h"
@@ -583,6 +584,7 @@ static void __init bast_map_io(void)
 	s3c24xx_init_io(bast_iodesc, ARRAY_SIZE(bast_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(bast_uartcfgs, ARRAY_SIZE(bast_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init bast_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx=
/mach-gta02.c
index 4a96346..3f83412 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -88,6 +88,7 @@
 #include <plat/gpio-cfg.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -507,6 +508,7 @@ static void __init gta02_map_io(void)
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(gta02_uartcfgs, ARRAY_SIZE(gta02_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
=20
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx=
/mach-h1940.c
index 63aaf07..1455779 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -67,6 +67,7 @@
 #include <plat/pm.h>
 #include <linux/platform_data/mmc-s3cmci.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
+#include <plat/samsung-time.h>
=20
 #include <sound/uda1380.h>
=20
@@ -652,6 +653,7 @@ static void __init h1940_map_io(void)
 	s3c24xx_init_io(h1940_iodesc, ARRAY_SIZE(h1940_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(h1940_uartcfgs, ARRAY_SIZE(h1940_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* setup PM */
=20
diff --git a/arch/arm/mach-s3c24xx/mach-jive.c b/arch/arm/mach-s3c24xx/=
mach-jive.c
index c9954e2..9671c42 100644
--- a/arch/arm/mach-s3c24xx/mach-jive.c
+++ b/arch/arm/mach-s3c24xx/mach-jive.c
@@ -55,6 +55,7 @@
 #include <plat/cpu.h>
 #include <plat/pm.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <plat/samsung-time.h>
=20
 static struct map_desc jive_iodesc[] __initdata =3D {
 };
@@ -506,6 +507,7 @@ static void __init jive_map_io(void)
 	s3c24xx_init_io(jive_iodesc, ARRAY_SIZE(jive_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(jive_uartcfgs, ARRAY_SIZE(jive_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void jive_power_off(void)
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c2=
4xx/mach-mini2440.c
index 393c0f1..a96efcd 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -57,6 +57,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include <sound/s3c24xx_uda134x.h>
=20
@@ -527,6 +528,7 @@ static void __init mini2440_map_io(void)
 	s3c24xx_init_io(mini2440_iodesc, ARRAY_SIZE(mini2440_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini2440_uartcfgs, ARRAY_SIZE(mini2440_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 /*
@@ -689,6 +691,6 @@ MACHINE_START(MINI2440, "MINI2440")
 	.map_io		=3D mini2440_map_io,
 	.init_machine	=3D mini2440_init,
 	.init_irq	=3D s3c24xx_init_irq,
-	.timer		=3D &s3c24xx_timer,
+	.timer		=3D &samsung_timer,
 	.restart	=3D s3c244x_restart,
 MACHINE_END
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/m=
ach-n30.c
index c53a9bf..ea80658 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -50,6 +50,7 @@
 #include <linux/platform_data/mmc-s3cmci.h>
 #include <plat/s3c2410.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -536,6 +537,7 @@ static void __init n30_map_io(void)
 	n30_hwinit();
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(n30_uartcfgs, ARRAY_SIZE(n30_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 /* GPB3 is the line that controls the pull-up for the USB D+ line */
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c2=
4xx/mach-nexcoder.c
index a2b92b0..76acb5a 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -46,6 +46,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -137,6 +138,7 @@ static void __init nexcoder_map_io(void)
 	s3c24xx_init_io(nexcoder_iodesc, ARRAY_SIZE(nexcoder_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(nexcoder_uartcfgs, ARRAY_SIZE(nexcoder_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	nexcoder_sensorboard_init();
 }
diff --git a/arch/arm/mach-s3c24xx/mach-osiris.c b/arch/arm/mach-s3c24x=
x/mach-osiris.c
index bb36d83..60a5f92 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris.c
@@ -53,6 +53,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -386,6 +387,7 @@ static void __init osiris_map_io(void)
 	s3c24xx_init_io(osiris_iodesc, ARRAY_SIZE(osiris_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(osiris_uartcfgs, ARRAY_SIZE(osiris_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* check for the newer revision boards with large page nand */
=20
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/=
mach-otom.c
index bca39f0..24e7d70 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -37,6 +37,7 @@
 #include <plat/devs.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -104,6 +105,7 @@ static void __init otom11_map_io(void)
 	s3c24xx_init_io(otom11_iodesc, ARRAY_SIZE(otom11_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(otom11_uartcfgs, ARRAY_SIZE(otom11_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init otom11_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24x=
x/mach-qt2410.c
index 7b6ba13..b68ff2a 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -60,6 +60,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -304,6 +305,7 @@ static void __init qt2410_map_io(void)
 	s3c24xx_init_io(qt2410_iodesc, ARRAY_SIZE(qt2410_iodesc));
 	s3c24xx_init_clocks(12*1000*1000);
 	s3c24xx_init_uarts(smdk2410_uartcfgs, ARRAY_SIZE(smdk2410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init qt2410_machine_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24x=
x/mach-rx1950.c
index 379fde5..fc03bb80 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -58,6 +58,7 @@
 #include <plat/pm.h>
 #include <plat/irq.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
+#include <plat/samsung-time.h>
=20
 #include <sound/uda1380.h>
=20
@@ -743,6 +744,7 @@ static void __init rx1950_map_io(void)
 	s3c24xx_init_io(rx1950_iodesc, ARRAY_SIZE(rx1950_iodesc));
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx1950_uartcfgs, ARRAY_SIZE(rx1950_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* setup PM */
=20
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24x=
x/mach-rx3715.c
index dacbb9a..772e275 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -50,6 +50,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/pm.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -179,6 +180,7 @@ static void __init rx3715_map_io(void)
 	s3c24xx_init_io(rx3715_iodesc, ARRAY_SIZE(rx3715_iodesc));
 	s3c24xx_init_clocks(16934000);
 	s3c24xx_init_uarts(rx3715_uartcfgs, ARRAY_SIZE(rx3715_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 /* H1940 and RX3715 need to reserve this for suspend */
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c2=
4xx/mach-smdk2410.c
index 82796b9..76aa704 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -53,6 +53,7 @@
 #include <plat/cpu.h>
=20
 #include <plat/common-smdk.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -101,6 +102,7 @@ static void __init smdk2410_map_io(void)
 	s3c24xx_init_io(smdk2410_iodesc, ARRAY_SIZE(smdk2410_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(smdk2410_uartcfgs, ARRAY_SIZE(smdk2410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init smdk2410_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c2=
4xx/mach-smdk2413.c
index ce99fd8..128dc88 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -47,6 +47,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include <plat/common-smdk.h>
=20
@@ -107,6 +108,7 @@ static void __init smdk2413_map_io(void)
 	s3c24xx_init_io(smdk2413_iodesc, ARRAY_SIZE(smdk2413_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2413_uartcfgs, ARRAY_SIZE(smdk2413_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init smdk2413_machine_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2416.c b/arch/arm/mach-s3c2=
4xx/mach-smdk2416.c
index f30d7fc..ee5fcaf 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2416.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2416.c
@@ -52,6 +52,7 @@
 #include <plat/sdhci.h>
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/s3c-hsudc.h>
+#include <plat/samsung-time.h>
=20
 #include <plat/fb.h>
=20
@@ -222,6 +223,7 @@ static void __init smdk2416_map_io(void)
 	s3c24xx_init_io(smdk2416_iodesc, ARRAY_SIZE(smdk2416_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2416_uartcfgs, ARRAY_SIZE(smdk2416_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init smdk2416_machine_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c2=
4xx/mach-smdk2440.c
index b7ff882..bc443da 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include <plat/common-smdk.h>
=20
@@ -164,6 +165,7 @@ static void __init smdk2440_map_io(void)
 	s3c24xx_init_io(smdk2440_iodesc, ARRAY_SIZE(smdk2440_iodesc));
 	s3c24xx_init_clocks(16934400);
 	s3c24xx_init_uarts(smdk2440_uartcfgs, ARRAY_SIZE(smdk2440_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init smdk2440_machine_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2443.c b/arch/arm/mach-s3c2=
4xx/mach-smdk2443.c
index 2568656..b5b128f 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2443.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2443.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include <plat/common-smdk.h>
=20
@@ -123,6 +124,7 @@ static void __init smdk2443_map_io(void)
 	s3c24xx_init_io(smdk2443_iodesc, ARRAY_SIZE(smdk2443_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk2443_uartcfgs, ARRAY_SIZE(smdk2443_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init smdk2443_machine_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-tct_hammer.c b/arch/arm/mach-s3=
c24xx/mach-tct_hammer.c
index 495bf5c..c6351a8 100644
--- a/arch/arm/mach-s3c24xx/mach-tct_hammer.c
+++ b/arch/arm/mach-s3c24xx/mach-tct_hammer.c
@@ -53,6 +53,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/physmap.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -136,6 +137,7 @@ static void __init tct_hammer_map_io(void)
 	s3c24xx_init_io(tct_hammer_iodesc, ARRAY_SIZE(tct_hammer_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(tct_hammer_uartcfgs, ARRAY_SIZE(tct_hammer_uartcfg=
s));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init tct_hammer_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-vr1000.c b/arch/arm/mach-s3c24x=
x/mach-vr1000.c
index 14d5b12..0c3d863 100644
--- a/arch/arm/mach-s3c24xx/mach-vr1000.c
+++ b/arch/arm/mach-s3c24xx/mach-vr1000.c
@@ -50,6 +50,7 @@
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
+#include <plat/samsung-time.h>
=20
 #include "simtec.h"
 #include "common.h"
@@ -335,6 +336,7 @@ static void __init vr1000_map_io(void)
 	s3c24xx_init_io(vr1000_iodesc, ARRAY_SIZE(vr1000_iodesc));
 	s3c24xx_init_clocks(0);
 	s3c24xx_init_uarts(vr1000_uartcfgs, ARRAY_SIZE(vr1000_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init vr1000_init(void)
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx=
/mach-vstms.c
index f1d44ae..1741d00 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -47,7 +47,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
-
+#include <plat/samsung-time.h>
=20
 static struct map_desc vstms_iodesc[] __initdata =3D {
 };
@@ -144,6 +144,7 @@ static void __init vstms_map_io(void)
 	s3c24xx_init_io(vstms_iodesc, ARRAY_SIZE(vstms_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(vstms_uartcfgs, ARRAY_SIZE(vstms_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init vstms_init(void)
diff --git a/arch/arm/mach-s3c64xx/mach-anw6410.c b/arch/arm/mach-s3c64=
xx/mach-anw6410.c
index 99e82ac..717daaa 100644
--- a/arch/arm/mach-s3c64xx/mach-anw6410.c
+++ b/arch/arm/mach-s3c64xx/mach-anw6410.c
@@ -51,6 +51,7 @@
 #include <plat/cpu.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-modem.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -209,6 +210,7 @@ static void __init anw6410_map_io(void)
 	s3c64xx_init_io(anw6410_iodesc, ARRAY_SIZE(anw6410_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(anw6410_uartcfgs, ARRAY_SIZE(anw6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	anw6410_lcd_mode_set();
 }
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c6=
4xx/mach-crag6410.c
index 13b7eaa..0d41166 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -70,6 +70,7 @@
 #include <plat/adc.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/pm.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -704,6 +705,7 @@ static void __init crag6410_map_io(void)
 	s3c64xx_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(crag6410_uartcfgs, ARRAY_SIZE(crag6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* LCD type and Bypass set by bootloader */
 }
diff --git a/arch/arm/mach-s3c64xx/mach-hmt.c b/arch/arm/mach-s3c64xx/m=
ach-hmt.c
index 2b14489..30c0424 100644
--- a/arch/arm/mach-s3c64xx/mach-hmt.c
+++ b/arch/arm/mach-s3c64xx/mach-hmt.c
@@ -42,6 +42,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -249,6 +250,7 @@ static void __init hmt_map_io(void)
 	s3c64xx_init_io(hmt_iodesc, ARRAY_SIZE(hmt_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(hmt_uartcfgs, ARRAY_SIZE(hmt_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init hmt_machine_init(void)
diff --git a/arch/arm/mach-s3c64xx/mach-mini6410.c b/arch/arm/mach-s3c6=
4xx/mach-mini6410.c
index 07c349c..758f5708 100644
--- a/arch/arm/mach-s3c64xx/mach-mini6410.c
+++ b/arch/arm/mach-s3c64xx/mach-mini6410.c
@@ -44,6 +44,7 @@
=20
 #include <video/platform_lcd.h>
 #include <video/samsung_fimd.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -233,6 +234,7 @@ static void __init mini6410_map_io(void)
 	s3c64xx_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(mini6410_uartcfgs, ARRAY_SIZE(mini6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* set the LCD type */
 	tmp =3D __raw_readl(S3C64XX_SPCON);
diff --git a/arch/arm/mach-s3c64xx/mach-ncp.c b/arch/arm/mach-s3c64xx/m=
ach-ncp.c
index e5f9a79..edfdd9f 100644
--- a/arch/arm/mach-s3c64xx/mach-ncp.c
+++ b/arch/arm/mach-s3c64xx/mach-ncp.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -88,6 +89,7 @@ static void __init ncp_map_io(void)
 	s3c64xx_init_io(ncp_iodesc, ARRAY_SIZE(ncp_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(ncp_uartcfgs, ARRAY_SIZE(ncp_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static void __init ncp_machine_init(void)
diff --git a/arch/arm/mach-s3c64xx/mach-real6410.c b/arch/arm/mach-s3c6=
4xx/mach-real6410.c
index 7476f7c..dd9980d 100644
--- a/arch/arm/mach-s3c64xx/mach-real6410.c
+++ b/arch/arm/mach-s3c64xx/mach-real6410.c
@@ -45,6 +45,7 @@
=20
 #include <video/platform_lcd.h>
 #include <video/samsung_fimd.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -212,6 +213,7 @@ static void __init real6410_map_io(void)
 	s3c64xx_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(real6410_uartcfgs, ARRAY_SIZE(real6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* set the LCD type */
 	tmp =3D __raw_readl(S3C64XX_SPCON);
diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64x=
x/mach-smartq.c
index c6d7390..df314f1 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -39,6 +39,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
=20
 #include <video/platform_lcd.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -378,6 +379,7 @@ void __init smartq_map_io(void)
 	s3c64xx_init_io(smartq_iodesc, ARRAY_SIZE(smartq_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smartq_uartcfgs, ARRAY_SIZE(smartq_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	smartq_lcd_mode_set();
 }
diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64=
xx/mach-smartq5.c
index 96d6da2..1a6baf2 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -29,6 +29,7 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
 #include "mach-smartq.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64=
xx/mach-smartq7.c
index 7d1167b..e193866 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -29,6 +29,7 @@
 #include <plat/devs.h>
 #include <plat/fb.h>
 #include <plat/gpio-cfg.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
 #include "mach-smartq.h"
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6400.c b/arch/arm/mach-s3c6=
4xx/mach-smdk6400.c
index a928fae..b2bac82 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6400.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6400.c
@@ -36,6 +36,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -67,6 +68,7 @@ static void __init smdk6400_map_io(void)
 	s3c64xx_init_io(smdk6400_iodesc, ARRAY_SIZE(smdk6400_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6400_uartcfgs, ARRAY_SIZE(smdk6400_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
 }
=20
 static struct platform_device *smdk6400_devices[] __initdata =3D {
diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c6=
4xx/mach-smdk6410.c
index da1a771..d8fe796 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -73,6 +73,7 @@
 #include <linux/platform_data/touchscreen-s3c2410.h>
 #include <plat/keypad.h>
 #include <plat/backlight.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -636,6 +637,7 @@ static void __init smdk6410_map_io(void)
 	s3c64xx_init_io(smdk6410_iodesc, ARRAY_SIZE(smdk6410_iodesc));
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6410_uartcfgs, ARRAY_SIZE(smdk6410_uartcfgs));
+	samsung_set_timer_source(SAMSUNG_PWM3, SAMSUNG_PWM4);
=20
 	/* set the LCD type */
=20
diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kcon=
fig
index e8742cb..f0ec535 100644
--- a/arch/arm/mach-s5p64x0/Kconfig
+++ b/arch/arm/mach-s5p64x0/Kconfig
@@ -9,7 +9,7 @@ if ARCH_S5P64X0
=20
 config CPU_S5P6440
 	bool
-	select S5P_HRT
+	select SAMSUNG_HRT
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
 	select SAMSUNG_WAKEMASK if PM
@@ -18,7 +18,7 @@ config CPU_S5P6440
=20
 config CPU_S5P6450
 	bool
-	select S5P_HRT
+	select SAMSUNG_HRT
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
 	select SAMSUNG_WAKEMASK if PM
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p6=
4x0/mach-smdk6440.c
index 96ea1fe..35c3fd3 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -50,7 +50,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/backlight.h>
 #include <plat/fb.h>
 #include <plat/sdhci.h>
@@ -231,7 +231,7 @@ static void __init smdk6440_map_io(void)
 	s5p64x0_init_io(NULL, 0);
 	s3c24xx_init_clocks(12000000);
 	s3c24xx_init_uarts(smdk6440_uartcfgs, ARRAY_SIZE(smdk6440_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
=20
 static void s5p6440_set_lcd_interface(void)
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p6=
4x0/mach-smdk6450.c
index 12748b6..b06fa83 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -50,7 +50,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <linux/platform_data/touchscreen-s3c2410.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/backlight.h>
 #include <plat/fb.h>
 #include <plat/sdhci.h>
@@ -250,7 +250,7 @@ static void __init smdk6450_map_io(void)
 	s5p64x0_init_io(NULL, 0);
 	s3c24xx_init_clocks(19200000);
 	s3c24xx_init_uarts(smdk6450_uartcfgs, ARRAY_SIZE(smdk6450_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
=20
 static void s5p6450_set_lcd_interface(void)
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kcon=
fig
index 92ad72f..01018ef 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -12,7 +12,7 @@ if ARCH_S5PV210
 config CPU_S5PV210
 	bool
 	select S5P_EXT_INT
-	select S5P_HRT
+	select SAMSUNG_HRT
 	select S5P_PM if PM
 	select S5P_SLEEP if PM
 	select SAMSUNG_DMADEV
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv21=
0/mach-aquila.c
index ee9fa5c..46b2842 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -39,7 +39,7 @@
 #include <plat/fb.h>
 #include <plat/fimc-core.h>
 #include <plat/sdhci.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -652,7 +652,7 @@ static void __init aquila_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(aquila_uartcfgs, ARRAY_SIZE(aquila_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
=20
 static void __init aquila_machine_init(void)
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/=
mach-goni.c
index 55e1dba..6efcc19 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -48,7 +48,7 @@
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
 #include <plat/clock.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/mfc.h>
 #include <plat/camport.h>
=20
@@ -910,7 +910,7 @@ static void __init goni_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(goni_uartcfgs, ARRAY_SIZE(goni_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
=20
 static void __init goni_reserve(void)
diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv=
210/mach-smdkc110.c
index d9c99fc..213b3a3 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -30,7 +30,7 @@
 #include <linux/platform_data/ata-samsung_cf.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/pm.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/mfc.h>
=20
 #include "common.h"
@@ -122,7 +122,7 @@ static void __init smdkc110_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
=20
 static void __init smdkc110_reserve(void)
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv=
210/mach-smdkv210.c
index 4cdb5bb..00806de 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -45,7 +45,7 @@
 #include <plat/keypad.h>
 #include <plat/pm.h>
 #include <plat/fb.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
 #include <plat/backlight.h>
 #include <plat/mfc.h>
 #include <plat/clock.h>
@@ -287,7 +287,7 @@ static void __init smdkv210_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(smdkv210_uartcfgs, ARRAY_SIZE(smdkv210_uartcfgs));
-	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
=20
 static void __init smdkv210_reserve(void)
diff --git a/arch/arm/mach-s5pv210/mach-torbreck.c b/arch/arm/mach-s5pv=
210/mach-torbreck.c
index 18785cb..1b01f05 100644
--- a/arch/arm/mach-s5pv210/mach-torbreck.c
+++ b/arch/arm/mach-s5pv210/mach-torbreck.c
@@ -27,7 +27,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <linux/platform_data/i2c-s3c2410.h>
-#include <plat/s5p-time.h>
+#include <plat/samsung-time.h>
=20
 #include "common.h"
=20
@@ -107,7 +107,7 @@ static void __init torbreck_map_io(void)
 	s5pv210_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(torbreck_uartcfgs, ARRAY_SIZE(torbreck_uartcfgs));
-	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
+	samsung_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
=20
 static void __init torbreck_machine_init(void)
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kcon=
fig
index 59401e1..5278795 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -70,7 +70,7 @@ config S3C_LOWLEVEL_UART_PORT
=20
 # timer options
=20
-config S5P_HRT
+config SAMSUNG_HRT
 	bool
 	select SAMSUNG_DEV_PWM
 	help
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Mak=
efile
index 9e40e8d..06f2312 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -13,7 +13,7 @@ obj-				:=3D
=20
 obj-y				+=3D init.o cpu.o
 obj-$(CONFIG_ARCH_USES_GETTIMEOFFSET)   +=3D time.o
-obj-$(CONFIG_S5P_HRT) 		+=3D s5p-time.o
+obj-$(CONFIG_SAMSUNG_HRT) 		+=3D samsung-time.o
=20
 obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D clock.o
 obj-$(CONFIG_SAMSUNG_CLOCK)	+=3D pwm-clock.o
diff --git a/arch/arm/plat-samsung/include/plat/s5p-time.h b/arch/arm/p=
lat-samsung/include/plat/s5p-time.h
deleted file mode 100644
index 3a70aeb..0000000
--- a/arch/arm/plat-samsung/include/plat/s5p-time.h
+++ /dev/null
@@ -1,40 +0,0 @@
-/* linux/arch/arm/plat-samsung/include/plat/s5p-time.h
- *
- * Copyright 2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * Header file for s5p time support
- *
- * This program is free software; you can redistribute it and/or modif=
y
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_PLAT_S5P_TIME_H
-#define __ASM_PLAT_S5P_TIME_H __FILE__
-
-/* S5P HR-Timer Clock mode */
-enum s5p_timer_mode {
-	S5P_PWM0,
-	S5P_PWM1,
-	S5P_PWM2,
-	S5P_PWM3,
-	S5P_PWM4,
-};
-
-struct s5p_timer_source {
-	unsigned int event_id;
-	unsigned int source_id;
-};
-
-/* Be able to sleep for atleast 4 seconds (usually more) */
-#define S5PTIMER_MIN_RANGE	4
-
-#define TCNT_MAX		0xffffffff
-#define NON_PERIODIC		0
-#define PERIODIC		1
-
-extern void __init s5p_set_timer_source(enum s5p_timer_mode event,
-					enum s5p_timer_mode source);
-extern	struct sys_timer s5p_timer;
-#endif /* __ASM_PLAT_S5P_TIME_H */
diff --git a/arch/arm/plat-samsung/include/plat/samsung-time.h b/arch/a=
rm/plat-samsung/include/plat/samsung-time.h
new file mode 100644
index 0000000..d3d1c81
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/samsung-time.h
@@ -0,0 +1,51 @@
+/* linux/arch/arm/plat-samsung/include/plat/samsung-time.h
+ *
+ * Copyright 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * Header file for samsung time support
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __ASM_PLAT_SAMSUNG_TIME_H
+#define __ASM_PLAT_SAMSUNG_TIME_H __FILE__
+
+/* SAMSUNG HR-Timer Clock mode */
+enum samsung_timer_mode {
+	SAMSUNG_PWM0,
+	SAMSUNG_PWM1,
+	SAMSUNG_PWM2,
+	SAMSUNG_PWM3,
+	SAMSUNG_PWM4,
+};
+
+struct samsung_timer_source {
+	unsigned int event_id;
+	unsigned int source_id;
+};
+
+/* Be able to sleep for atleast 4 seconds (usually more) */
+#define SAMSUNG_TIMER_MIN_RANGE	4
+
+#ifdef CONFIG_ARCH_S3C24XX
+#define TCNT_MAX		0xffff
+#define TSCALER_DIV		25
+#define TDIV			50
+#define TSIZE			16
+#else
+#define TCNT_MAX		0xffffffff
+#define TSCALER_DIV		2
+#define TDIV			2
+#define TSIZE			32
+#endif
+
+#define NON_PERIODIC		0
+#define PERIODIC		1
+
+extern void __init samsung_set_timer_source(enum samsung_timer_mode ev=
ent,
+					enum samsung_timer_mode source);
+extern	struct sys_timer samsung_timer;
+#endif /* __ASM_PLAT_SAMSUNG_TIME_H */
diff --git a/arch/arm/plat-samsung/s5p-time.c b/arch/arm/plat-samsung/s=
5p-time.c
deleted file mode 100644
index 028b6e8..0000000
--- a/arch/arm/plat-samsung/s5p-time.c
+++ /dev/null
@@ -1,405 +0,0 @@
-/*
- * Copyright (c) 2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com/
- *
- * S5P - Common hr-timer support
- *
- * This program is free software; you can redistribute it and/or modif=
y
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/err.h>
-#include <linux/clk.h>
-#include <linux/clockchips.h>
-#include <linux/platform_device.h>
-
-#include <asm/smp_twd.h>
-#include <asm/mach/time.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/sched_clock.h>
-
-#include <mach/map.h>
-#include <plat/devs.h>
-#include <plat/regs-timer.h>
-#include <plat/s5p-time.h>
-
-static struct clk *tin_event;
-static struct clk *tin_source;
-static struct clk *tdiv_event;
-static struct clk *tdiv_source;
-static struct clk *timerclk;
-static struct s5p_timer_source timer_source;
-static unsigned long clock_count_per_tick;
-static void s5p_timer_resume(void);
-
-static void s5p_time_stop(enum s5p_timer_mode mode)
-{
-	unsigned long tcon;
-
-	tcon =3D __raw_readl(S3C2410_TCON);
-
-	switch (mode) {
-	case S5P_PWM0:
-		tcon &=3D ~S3C2410_TCON_T0START;
-		break;
-
-	case S5P_PWM1:
-		tcon &=3D ~S3C2410_TCON_T1START;
-		break;
-
-	case S5P_PWM2:
-		tcon &=3D ~S3C2410_TCON_T2START;
-		break;
-
-	case S5P_PWM3:
-		tcon &=3D ~S3C2410_TCON_T3START;
-		break;
-
-	case S5P_PWM4:
-		tcon &=3D ~S3C2410_TCON_T4START;
-		break;
-
-	default:
-		printk(KERN_ERR "Invalid Timer %d\n", mode);
-		break;
-	}
-	__raw_writel(tcon, S3C2410_TCON);
-}
-
-static void s5p_time_setup(enum s5p_timer_mode mode, unsigned long tcn=
t)
-{
-	unsigned long tcon;
-
-	tcon =3D __raw_readl(S3C2410_TCON);
-
-	tcnt--;
-
-	switch (mode) {
-	case S5P_PWM0:
-		tcon &=3D ~(0x0f << 0);
-		tcon |=3D S3C2410_TCON_T0MANUALUPD;
-		break;
-
-	case S5P_PWM1:
-		tcon &=3D ~(0x0f << 8);
-		tcon |=3D S3C2410_TCON_T1MANUALUPD;
-		break;
-
-	case S5P_PWM2:
-		tcon &=3D ~(0x0f << 12);
-		tcon |=3D S3C2410_TCON_T2MANUALUPD;
-		break;
-
-	case S5P_PWM3:
-		tcon &=3D ~(0x0f << 16);
-		tcon |=3D S3C2410_TCON_T3MANUALUPD;
-		break;
-
-	case S5P_PWM4:
-		tcon &=3D ~(0x07 << 20);
-		tcon |=3D S3C2410_TCON_T4MANUALUPD;
-		break;
-
-	default:
-		printk(KERN_ERR "Invalid Timer %d\n", mode);
-		break;
-	}
-
-	__raw_writel(tcnt, S3C2410_TCNTB(mode));
-	__raw_writel(tcnt, S3C2410_TCMPB(mode));
-	__raw_writel(tcon, S3C2410_TCON);
-}
-
-static void s5p_time_start(enum s5p_timer_mode mode, bool periodic)
-{
-	unsigned long tcon;
-
-	tcon  =3D __raw_readl(S3C2410_TCON);
-
-	switch (mode) {
-	case S5P_PWM0:
-		tcon |=3D S3C2410_TCON_T0START;
-		tcon &=3D ~S3C2410_TCON_T0MANUALUPD;
-
-		if (periodic)
-			tcon |=3D S3C2410_TCON_T0RELOAD;
-		else
-			tcon &=3D ~S3C2410_TCON_T0RELOAD;
-		break;
-
-	case S5P_PWM1:
-		tcon |=3D S3C2410_TCON_T1START;
-		tcon &=3D ~S3C2410_TCON_T1MANUALUPD;
-
-		if (periodic)
-			tcon |=3D S3C2410_TCON_T1RELOAD;
-		else
-			tcon &=3D ~S3C2410_TCON_T1RELOAD;
-		break;
-
-	case S5P_PWM2:
-		tcon |=3D S3C2410_TCON_T2START;
-		tcon &=3D ~S3C2410_TCON_T2MANUALUPD;
-
-		if (periodic)
-			tcon |=3D S3C2410_TCON_T2RELOAD;
-		else
-			tcon &=3D ~S3C2410_TCON_T2RELOAD;
-		break;
-
-	case S5P_PWM3:
-		tcon |=3D S3C2410_TCON_T3START;
-		tcon &=3D ~S3C2410_TCON_T3MANUALUPD;
-
-		if (periodic)
-			tcon |=3D S3C2410_TCON_T3RELOAD;
-		else
-			tcon &=3D ~S3C2410_TCON_T3RELOAD;
-		break;
-
-	case S5P_PWM4:
-		tcon |=3D S3C2410_TCON_T4START;
-		tcon &=3D ~S3C2410_TCON_T4MANUALUPD;
-
-		if (periodic)
-			tcon |=3D S3C2410_TCON_T4RELOAD;
-		else
-			tcon &=3D ~S3C2410_TCON_T4RELOAD;
-		break;
-
-	default:
-		printk(KERN_ERR "Invalid Timer %d\n", mode);
-		break;
-	}
-	__raw_writel(tcon, S3C2410_TCON);
-}
-
-static int s5p_set_next_event(unsigned long cycles,
-				struct clock_event_device *evt)
-{
-	s5p_time_setup(timer_source.event_id, cycles);
-	s5p_time_start(timer_source.event_id, NON_PERIODIC);
-
-	return 0;
-}
-
-static void s5p_set_mode(enum clock_event_mode mode,
-				struct clock_event_device *evt)
-{
-	s5p_time_stop(timer_source.event_id);
-
-	switch (mode) {
-	case CLOCK_EVT_MODE_PERIODIC:
-		s5p_time_setup(timer_source.event_id, clock_count_per_tick);
-		s5p_time_start(timer_source.event_id, PERIODIC);
-		break;
-
-	case CLOCK_EVT_MODE_ONESHOT:
-		break;
-
-	case CLOCK_EVT_MODE_UNUSED:
-	case CLOCK_EVT_MODE_SHUTDOWN:
-		break;
-
-	case CLOCK_EVT_MODE_RESUME:
-		s5p_timer_resume();
-		break;
-	}
-}
-
-static void s5p_timer_resume(void)
-{
-	/* event timer restart */
-	s5p_time_setup(timer_source.event_id, clock_count_per_tick);
-	s5p_time_start(timer_source.event_id, PERIODIC);
-
-	/* source timer restart */
-	s5p_time_setup(timer_source.source_id, TCNT_MAX);
-	s5p_time_start(timer_source.source_id, PERIODIC);
-}
-
-void __init s5p_set_timer_source(enum s5p_timer_mode event,
-				 enum s5p_timer_mode source)
-{
-	s3c_device_timer[event].dev.bus =3D &platform_bus_type;
-	s3c_device_timer[source].dev.bus =3D &platform_bus_type;
-
-	timer_source.event_id =3D event;
-	timer_source.source_id =3D source;
-}
-
-static struct clock_event_device time_event_device =3D {
-	.name		=3D "s5p_event_timer",
-	.features	=3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
-	.rating		=3D 200,
-	.set_next_event	=3D s5p_set_next_event,
-	.set_mode	=3D s5p_set_mode,
-};
-
-static irqreturn_t s5p_clock_event_isr(int irq, void *dev_id)
-{
-	struct clock_event_device *evt =3D dev_id;
-
-	evt->event_handler(evt);
-
-	return IRQ_HANDLED;
-}
-
-static struct irqaction s5p_clock_event_irq =3D {
-	.name		=3D "s5p_time_irq",
-	.flags		=3D IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
-	.handler	=3D s5p_clock_event_isr,
-	.dev_id		=3D &time_event_device,
-};
-
-static void __init s5p_clockevent_init(void)
-{
-	unsigned long pclk;
-	unsigned long clock_rate;
-	unsigned int irq_number;
-	struct clk *tscaler;
-
-	pclk =3D clk_get_rate(timerclk);
-
-	tscaler =3D clk_get_parent(tdiv_event);
-
-	clk_set_rate(tscaler, pclk / 2);
-	clk_set_rate(tdiv_event, pclk / 2);
-	clk_set_parent(tin_event, tdiv_event);
-
-	clock_rate =3D clk_get_rate(tin_event);
-	clock_count_per_tick =3D clock_rate / HZ;
-
-	clockevents_calc_mult_shift(&time_event_device,
-				    clock_rate, S5PTIMER_MIN_RANGE);
-	time_event_device.max_delta_ns =3D
-		clockevent_delta2ns(-1, &time_event_device);
-	time_event_device.min_delta_ns =3D
-		clockevent_delta2ns(1, &time_event_device);
-
-	time_event_device.cpumask =3D cpumask_of(0);
-	clockevents_register_device(&time_event_device);
-
-	irq_number =3D timer_source.event_id + IRQ_TIMER0;
-	setup_irq(irq_number, &s5p_clock_event_irq);
-}
-
-static void __iomem *s5p_timer_reg(void)
-{
-	unsigned long offset =3D 0;
-
-	switch (timer_source.source_id) {
-	case S5P_PWM0:
-	case S5P_PWM1:
-	case S5P_PWM2:
-	case S5P_PWM3:
-		offset =3D (timer_source.source_id * 0x0c) + 0x14;
-		break;
-
-	case S5P_PWM4:
-		offset =3D 0x40;
-		break;
-
-	default:
-		printk(KERN_ERR "Invalid Timer %d\n", timer_source.source_id);
-		return NULL;
-	}
-
-	return S3C_TIMERREG(offset);
-}
-
-/*
- * Override the global weak sched_clock symbol with this
- * local implementation which uses the clocksource to get some
- * better resolution when scheduling the kernel. We accept that
- * this wraps around for now, since it is just a relative time
- * stamp. (Inspired by U300 implementation.)
- */
-static u32 notrace s5p_read_sched_clock(void)
-{
-	void __iomem *reg =3D s5p_timer_reg();
-
-	if (!reg)
-		return 0;
-
-	return ~__raw_readl(reg);
-}
-
-static void __init s5p_clocksource_init(void)
-{
-	unsigned long pclk;
-	unsigned long clock_rate;
-
-	pclk =3D clk_get_rate(timerclk);
-
-	clk_set_rate(tdiv_source, pclk / 2);
-	clk_set_parent(tin_source, tdiv_source);
-
-	clock_rate =3D clk_get_rate(tin_source);
-
-	s5p_time_setup(timer_source.source_id, TCNT_MAX);
-	s5p_time_start(timer_source.source_id, PERIODIC);
-
-	setup_sched_clock(s5p_read_sched_clock, 32, clock_rate);
-
-	if (clocksource_mmio_init(s5p_timer_reg(), "s5p_clocksource_timer",
-			clock_rate, 250, 32, clocksource_mmio_readl_down))
-		panic("s5p_clocksource_timer: can't register clocksource\n");
-}
-
-static void __init s5p_timer_resources(void)
-{
-
-	unsigned long event_id =3D timer_source.event_id;
-	unsigned long source_id =3D timer_source.source_id;
-	char devname[15];
-
-	timerclk =3D clk_get(NULL, "timers");
-	if (IS_ERR(timerclk))
-		panic("failed to get timers clock for timer");
-
-	clk_enable(timerclk);
-
-	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
-	s3c_device_timer[event_id].id =3D event_id;
-	s3c_device_timer[event_id].dev.init_name =3D devname;
-
-	tin_event =3D clk_get(&s3c_device_timer[event_id].dev, "pwm-tin");
-	if (IS_ERR(tin_event))
-		panic("failed to get pwm-tin clock for event timer");
-
-	tdiv_event =3D clk_get(&s3c_device_timer[event_id].dev, "pwm-tdiv");
-	if (IS_ERR(tdiv_event))
-		panic("failed to get pwm-tdiv clock for event timer");
-
-	clk_enable(tin_event);
-
-	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
-	s3c_device_timer[source_id].id =3D source_id;
-	s3c_device_timer[source_id].dev.init_name =3D devname;
-
-	tin_source =3D clk_get(&s3c_device_timer[source_id].dev, "pwm-tin");
-	if (IS_ERR(tin_source))
-		panic("failed to get pwm-tin clock for source timer");
-
-	tdiv_source =3D clk_get(&s3c_device_timer[source_id].dev, "pwm-tdiv")=
;
-	if (IS_ERR(tdiv_source))
-		panic("failed to get pwm-tdiv clock for source timer");
-
-	clk_enable(tin_source);
-}
-
-static void __init s5p_timer_init(void)
-{
-	s5p_timer_resources();
-	s5p_clockevent_init();
-	s5p_clocksource_init();
-}
-
-struct sys_timer s5p_timer =3D {
-	.init		=3D s5p_timer_init,
-};
diff --git a/arch/arm/plat-samsung/samsung-time.c b/arch/arm/plat-samsu=
ng/samsung-time.c
new file mode 100644
index 0000000..6d63fca
--- /dev/null
+++ b/arch/arm/plat-samsung/samsung-time.c
@@ -0,0 +1,405 @@
+/*
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * samsung - Common hr-timer support (s3c and s5p)
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/clockchips.h>
+#include <linux/platform_device.h>
+
+#include <asm/smp_twd.h>
+#include <asm/mach/time.h>
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+#include <asm/sched_clock.h>
+
+#include <mach/map.h>
+#include <plat/devs.h>
+#include <plat/regs-timer.h>
+#include <plat/samsung-time.h>
+
+static struct clk *tin_event;
+static struct clk *tin_source;
+static struct clk *tdiv_event;
+static struct clk *tdiv_source;
+static struct clk *timerclk;
+static struct samsung_timer_source timer_source;
+static unsigned long clock_count_per_tick;
+static void samsung_timer_resume(void);
+
+static void samsung_time_stop(enum samsung_timer_mode mode)
+{
+	unsigned long tcon;
+
+	tcon =3D __raw_readl(S3C2410_TCON);
+
+	switch (mode) {
+	case SAMSUNG_PWM0:
+		tcon &=3D ~S3C2410_TCON_T0START;
+		break;
+
+	case SAMSUNG_PWM1:
+		tcon &=3D ~S3C2410_TCON_T1START;
+		break;
+
+	case SAMSUNG_PWM2:
+		tcon &=3D ~S3C2410_TCON_T2START;
+		break;
+
+	case SAMSUNG_PWM3:
+		tcon &=3D ~S3C2410_TCON_T3START;
+		break;
+
+	case SAMSUNG_PWM4:
+		tcon &=3D ~S3C2410_TCON_T4START;
+		break;
+
+	default:
+		printk(KERN_ERR "Invalid Timer %d\n", mode);
+		break;
+	}
+	__raw_writel(tcon, S3C2410_TCON);
+}
+
+static void samsung_time_setup(enum samsung_timer_mode mode, unsigned =
long tcnt)
+{
+	unsigned long tcon;
+
+	tcon =3D __raw_readl(S3C2410_TCON);
+
+	tcnt--;
+
+	switch (mode) {
+	case SAMSUNG_PWM0:
+		tcon &=3D ~(0x0f << 0);
+		tcon |=3D S3C2410_TCON_T0MANUALUPD;
+		break;
+
+	case SAMSUNG_PWM1:
+		tcon &=3D ~(0x0f << 8);
+		tcon |=3D S3C2410_TCON_T1MANUALUPD;
+		break;
+
+	case SAMSUNG_PWM2:
+		tcon &=3D ~(0x0f << 12);
+		tcon |=3D S3C2410_TCON_T2MANUALUPD;
+		break;
+
+	case SAMSUNG_PWM3:
+		tcon &=3D ~(0x0f << 16);
+		tcon |=3D S3C2410_TCON_T3MANUALUPD;
+		break;
+
+	case SAMSUNG_PWM4:
+		tcon &=3D ~(0x07 << 20);
+		tcon |=3D S3C2410_TCON_T4MANUALUPD;
+		break;
+
+	default:
+		printk(KERN_ERR "Invalid Timer %d\n", mode);
+		break;
+	}
+
+	__raw_writel(tcnt, S3C2410_TCNTB(mode));
+	__raw_writel(tcnt, S3C2410_TCMPB(mode));
+	__raw_writel(tcon, S3C2410_TCON);
+}
+
+static void samsung_time_start(enum samsung_timer_mode mode, bool peri=
odic)
+{
+	unsigned long tcon;
+
+	tcon  =3D __raw_readl(S3C2410_TCON);
+
+	switch (mode) {
+	case SAMSUNG_PWM0:
+		tcon |=3D S3C2410_TCON_T0START;
+		tcon &=3D ~S3C2410_TCON_T0MANUALUPD;
+
+		if (periodic)
+			tcon |=3D S3C2410_TCON_T0RELOAD;
+		else
+			tcon &=3D ~S3C2410_TCON_T0RELOAD;
+		break;
+
+	case SAMSUNG_PWM1:
+		tcon |=3D S3C2410_TCON_T1START;
+		tcon &=3D ~S3C2410_TCON_T1MANUALUPD;
+
+		if (periodic)
+			tcon |=3D S3C2410_TCON_T1RELOAD;
+		else
+			tcon &=3D ~S3C2410_TCON_T1RELOAD;
+		break;
+
+	case SAMSUNG_PWM2:
+		tcon |=3D S3C2410_TCON_T2START;
+		tcon &=3D ~S3C2410_TCON_T2MANUALUPD;
+
+		if (periodic)
+			tcon |=3D S3C2410_TCON_T2RELOAD;
+		else
+			tcon &=3D ~S3C2410_TCON_T2RELOAD;
+		break;
+
+	case SAMSUNG_PWM3:
+		tcon |=3D S3C2410_TCON_T3START;
+		tcon &=3D ~S3C2410_TCON_T3MANUALUPD;
+
+		if (periodic)
+			tcon |=3D S3C2410_TCON_T3RELOAD;
+		else
+			tcon &=3D ~S3C2410_TCON_T3RELOAD;
+		break;
+
+	case SAMSUNG_PWM4:
+		tcon |=3D S3C2410_TCON_T4START;
+		tcon &=3D ~S3C2410_TCON_T4MANUALUPD;
+
+		if (periodic)
+			tcon |=3D S3C2410_TCON_T4RELOAD;
+		else
+			tcon &=3D ~S3C2410_TCON_T4RELOAD;
+		break;
+
+	default:
+		printk(KERN_ERR "Invalid Timer %d\n", mode);
+		break;
+	}
+	__raw_writel(tcon, S3C2410_TCON);
+}
+
+static int samsung_set_next_event(unsigned long cycles,
+				struct clock_event_device *evt)
+{
+	samsung_time_setup(timer_source.event_id, cycles);
+	samsung_time_start(timer_source.event_id, NON_PERIODIC);
+
+	return 0;
+}
+
+static void samsung_set_mode(enum clock_event_mode mode,
+				struct clock_event_device *evt)
+{
+	samsung_time_stop(timer_source.event_id);
+
+	switch (mode) {
+	case CLOCK_EVT_MODE_PERIODIC:
+		samsung_time_setup(timer_source.event_id, clock_count_per_tick);
+		samsung_time_start(timer_source.event_id, PERIODIC);
+		break;
+
+	case CLOCK_EVT_MODE_ONESHOT:
+		break;
+
+	case CLOCK_EVT_MODE_UNUSED:
+	case CLOCK_EVT_MODE_SHUTDOWN:
+		break;
+
+	case CLOCK_EVT_MODE_RESUME:
+		samsung_timer_resume();
+		break;
+	}
+}
+
+static void samsung_timer_resume(void)
+{
+	/* event timer restart */
+	samsung_time_setup(timer_source.event_id, clock_count_per_tick);
+	samsung_time_start(timer_source.event_id, PERIODIC);
+
+	/* source timer restart */
+	samsung_time_setup(timer_source.source_id, TCNT_MAX);
+	samsung_time_start(timer_source.source_id, PERIODIC);
+}
+
+void __init samsung_set_timer_source(enum samsung_timer_mode event,
+				 enum samsung_timer_mode source)
+{
+	s3c_device_timer[event].dev.bus =3D &platform_bus_type;
+	s3c_device_timer[source].dev.bus =3D &platform_bus_type;
+
+	timer_source.event_id =3D event;
+	timer_source.source_id =3D source;
+}
+
+static struct clock_event_device time_event_device =3D {
+	.name		=3D "samsung_event_timer",
+	.features	=3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT,
+	.rating		=3D 200,
+	.set_next_event	=3D samsung_set_next_event,
+	.set_mode	=3D samsung_set_mode,
+};
+
+static irqreturn_t samsung_clock_event_isr(int irq, void *dev_id)
+{
+	struct clock_event_device *evt =3D dev_id;
+
+	evt->event_handler(evt);
+
+	return IRQ_HANDLED;
+}
+
+static struct irqaction samsung_clock_event_irq =3D {
+	.name		=3D "samsung_time_irq",
+	.flags		=3D IRQF_DISABLED | IRQF_TIMER | IRQF_IRQPOLL,
+	.handler	=3D samsung_clock_event_isr,
+	.dev_id		=3D &time_event_device,
+};
+
+static void __init samsung_clockevent_init(void)
+{
+	unsigned long pclk;
+	unsigned long clock_rate;
+	unsigned int irq_number;
+	struct clk *tscaler;
+
+	pclk =3D clk_get_rate(timerclk);
+
+	tscaler =3D clk_get_parent(tdiv_event);
+
+	clk_set_rate(tscaler, pclk / TSCALER_DIV);
+	clk_set_rate(tdiv_event, pclk / TDIV);
+	clk_set_parent(tin_event, tdiv_event);
+
+	clock_rate =3D clk_get_rate(tin_event);
+	clock_count_per_tick =3D clock_rate / HZ;
+
+	clockevents_calc_mult_shift(&time_event_device,
+				    clock_rate, SAMSUNG_TIMER_MIN_RANGE);
+	time_event_device.max_delta_ns =3D
+		clockevent_delta2ns(-1, &time_event_device);
+	time_event_device.min_delta_ns =3D
+		clockevent_delta2ns(1, &time_event_device);
+
+	time_event_device.cpumask =3D cpumask_of(0);
+	clockevents_register_device(&time_event_device);
+
+	irq_number =3D timer_source.event_id + IRQ_TIMER0;
+	setup_irq(irq_number, &samsung_clock_event_irq);
+}
+
+static void __iomem *samsung_timer_reg(void)
+{
+	unsigned long offset =3D 0;
+
+	switch (timer_source.source_id) {
+	case SAMSUNG_PWM0:
+	case SAMSUNG_PWM1:
+	case SAMSUNG_PWM2:
+	case SAMSUNG_PWM3:
+		offset =3D (timer_source.source_id * 0x0c) + 0x14;
+		break;
+
+	case SAMSUNG_PWM4:
+		offset =3D 0x40;
+		break;
+
+	default:
+		printk(KERN_ERR "Invalid Timer %d\n", timer_source.source_id);
+		return NULL;
+	}
+
+	return S3C_TIMERREG(offset);
+}
+
+/*
+ * Override the global weak sched_clock symbol with this
+ * local implementation which uses the clocksource to get some
+ * better resolution when scheduling the kernel. We accept that
+ * this wraps around for now, since it is just a relative time
+ * stamp. (Inspired by U300 implementation.)
+ */
+static u32 notrace samsung_read_sched_clock(void)
+{
+	void __iomem *reg =3D samsung_timer_reg();
+
+	if (!reg)
+		return 0;
+
+	return ~__raw_readl(reg);
+}
+
+static void __init samsung_clocksource_init(void)
+{
+	unsigned long pclk;
+	unsigned long clock_rate;
+
+	pclk =3D clk_get_rate(timerclk);
+
+	clk_set_rate(tdiv_source, pclk / TDIV);
+	clk_set_parent(tin_source, tdiv_source);
+
+	clock_rate =3D clk_get_rate(tin_source);
+
+	samsung_time_setup(timer_source.source_id, TCNT_MAX);
+	samsung_time_start(timer_source.source_id, PERIODIC);
+
+	setup_sched_clock(samsung_read_sched_clock, TSIZE, clock_rate);
+
+	if (clocksource_mmio_init(samsung_timer_reg(), "samsung_clocksource_t=
imer",
+			clock_rate, 250, TSIZE, clocksource_mmio_readl_down))
+		panic("samsung_clocksource_timer: can't register clocksource\n");
+}
+
+static void __init samsung_timer_resources(void)
+{
+
+	unsigned long event_id =3D timer_source.event_id;
+	unsigned long source_id =3D timer_source.source_id;
+	char devname[15];
+
+	timerclk =3D clk_get(NULL, "timers");
+	if (IS_ERR(timerclk))
+		panic("failed to get timers clock for timer");
+
+	clk_enable(timerclk);
+
+	sprintf(devname, "s3c24xx-pwm.%lu", event_id);
+	s3c_device_timer[event_id].id =3D event_id;
+	s3c_device_timer[event_id].dev.init_name =3D devname;
+
+	tin_event =3D clk_get(&s3c_device_timer[event_id].dev, "pwm-tin");
+	if (IS_ERR(tin_event))
+		panic("failed to get pwm-tin clock for event timer");
+
+	tdiv_event =3D clk_get(&s3c_device_timer[event_id].dev, "pwm-tdiv");
+	if (IS_ERR(tdiv_event))
+		panic("failed to get pwm-tdiv clock for event timer");
+
+	clk_enable(tin_event);
+
+	sprintf(devname, "s3c24xx-pwm.%lu", source_id);
+	s3c_device_timer[source_id].id =3D source_id;
+	s3c_device_timer[source_id].dev.init_name =3D devname;
+
+	tin_source =3D clk_get(&s3c_device_timer[source_id].dev, "pwm-tin");
+	if (IS_ERR(tin_source))
+		panic("failed to get pwm-tin clock for source timer");
+
+	tdiv_source =3D clk_get(&s3c_device_timer[source_id].dev, "pwm-tdiv")=
;
+	if (IS_ERR(tdiv_source))
+		panic("failed to get pwm-tdiv clock for source timer");
+
+	clk_enable(tin_source);
+}
+
+static void __init samsung_timer_init(void)
+{
+	samsung_timer_resources();
+	samsung_clockevent_init();
+	samsung_clocksource_init();
+}
+
+struct sys_timer samsung_timer =3D {
+	.init		=3D samsung_timer_init,
+};
--=20
1.8.0
