From: Ben Dooks <ben@simtec.co.uk>
Subject: [patch 1/3] S3C24XX: machine support for Simtec Audio
Date: Tue, 10 Nov 2009 23:07:27 +0000
Message-ID: <20091110230748.876167908@fluff.org.uk>
References: <20091110230726.129283187@fluff.org.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from aeryn.fluff.org.uk ([87.194.8.8]:39467 "EHLO
	kira.home.fluff.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758377AbZKJXHn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2009 18:07:43 -0500
Content-Disposition: inline; filename=simtec/ready/simtec-mach-audio.patch
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Simtec Linux Team <linux@simtec.co.uk>

Add the platform/machine support for the audio devices fitted to
the Simtec range of boards since the move to ASoC.

Signed-off-by: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

---
 arch/arm/mach-s3c2410/mach-bast.c             |    7 ++
 arch/arm/mach-s3c2410/mach-vr1000.c           |    2 
 arch/arm/mach-s3c2440/mach-anubis.c           |   15 ++++-
 arch/arm/plat-s3c/include/plat/audio-simtec.h |    2 
 arch/arm/plat-s3c24xx/Kconfig                 |    7 ++
 arch/arm/plat-s3c24xx/Makefile                |    1 
 arch/arm/plat-s3c24xx/audio-simtec.c          |   77 ++++++++++++++++++++++++++
 7 files changed, 109 insertions(+), 2 deletions(-)

Index: b/arch/arm/plat-s3c24xx/simtec-audio.c
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/simtec-audio.c	2009-11-09 17:00:49.000000000 +0000
@@ -0,0 +1,77 @@
+/* linux/arch/arm/plat-s3c24xx/simtec-audio.c
+ *
+ * Copyright (c) 2009 Simtec Electronics
+ *	http://armlinux.simtec.co.uk/
+ *	Ben Dooks <ben@simtec.co.uk>
+ *
+ * Audio setup for various Simtec S3C24XX implementations
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/io.h>
+
+#include <mach/bast-map.h>
+#include <mach/bast-irq.h>
+#include <mach/bast-cpld.h>
+
+#include <mach/hardware.h>
+#include <mach/regs-gpio.h>
+
+#include <plat/audio-simtec.h>
+#include <plat/devs.h>
+
+/* platform ops for audio */
+
+static void simtec_audio_startup_lrroute(void)
+{
+	unsigned int tmp;
+	unsigned long flags;
+
+	local_irq_save(flags);
+
+	tmp = __raw_readb(BAST_VA_CTRL1);
+	tmp &= ~BAST_CPLD_CTRL1_LRMASK;
+	tmp |= BAST_CPLD_CTRL1_LRCDAC;
+	__raw_writeb(tmp, BAST_VA_CTRL1);
+
+	local_irq_restore(flags);
+}
+
+static struct s3c24xx_audio_simtec_pdata simtec_audio_platdata;
+static char our_name[32];
+
+static struct platform_device simtec_audio_dev = {
+	.name	= our_name,
+	.id	= -1,
+	.dev	= {
+		.parent		= &s3c_device_iis.dev,
+		.platform_data	= &simtec_audio_platdata,
+	},
+};
+
+int __init simtec_audio_add(const char *name, bool has_lr_routing,
+			    struct s3c24xx_audio_simtec_pdata *spd)
+{
+	if (!name)
+		name = "tlv320aic23";
+
+	snprintf(our_name, sizeof(our_name)-1, "s3c24xx-simtec-%s", name);
+
+	/* copy platform data so the source can be __initdata */
+	if (spd)
+		simtec_audio_platdata = *spd;
+
+	if (has_lr_routing)
+		simtec_audio_platdata.startup = simtec_audio_startup_lrroute;
+
+	platform_device_register(&s3c_device_iis);
+	platform_device_register(&simtec_audio_dev);
+	return 0;
+}
Index: b/arch/arm/plat-s3c24xx/Kconfig
===================================================================
--- a/arch/arm/plat-s3c24xx/Kconfig	2009-11-09 15:30:39.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/Kconfig	2009-11-09 17:05:37.000000000 +0000
@@ -178,4 +178,11 @@ config MACH_SMDK
 	help
 	  Common machine code for SMDK2410 and SMDK2440
 
+config S3C24XX_SIMTEC_AUDIO
+	bool
+	depends on (ARCH_BAST || MACH_VR1000 || MACH_OSIRIS || MACH_ANUBIS)
+	default y
+	help
+	  Add audio devices for common Simtec S3C24XX boards
+
 endif
Index: b/arch/arm/plat-s3c24xx/Makefile
===================================================================
--- a/arch/arm/plat-s3c24xx/Makefile	2009-11-09 15:30:39.000000000 +0000
+++ b/arch/arm/plat-s3c24xx/Makefile	2009-11-09 17:05:16.000000000 +0000
@@ -55,3 +55,4 @@ obj-$(CONFIG_S3C24XX_SPI_BUS1_GPD8_GPD9_
 # machine common support
 
 obj-$(CONFIG_MACH_SMDK)		+= common-smdk.o
+obj-$(CONFIG_S3C24XX_SIMTEC_AUDIO)	+= simtec-audio.o
Index: b/arch/arm/plat-s3c/include/plat/audio-simtec.h
===================================================================
--- a/arch/arm/plat-s3c/include/plat/audio-simtec.h	2009-11-09 15:30:39.000000000 +0000
+++ b/arch/arm/plat-s3c/include/plat/audio-simtec.h	2009-11-09 15:43:27.000000000 +0000
@@ -33,5 +33,5 @@ struct s3c24xx_audio_simtec_pdata {
 	void	(*startup)(void);
 };
 
-extern int simtec_audio_add(const char *codec_name,
+extern int simtec_audio_add(const char *codec_name, bool has_lr_routing,
 			    struct s3c24xx_audio_simtec_pdata *pdata);
Index: b/arch/arm/mach-s3c2410/mach-bast.c
===================================================================
--- a/arch/arm/mach-s3c2410/mach-bast.c	2009-11-09 15:30:39.000000000 +0000
+++ b/arch/arm/mach-s3c2410/mach-bast.c	2009-11-09 16:59:11.000000000 +0000
@@ -61,6 +61,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/cpu-freq.h>
+#include <plat/audio-simtec.h>
 
 #include "usb-simtec.h"
 #include "nor-simtec.h"
@@ -608,6 +609,11 @@ static struct s3c_cpufreq_board __initda
 	.need_io	= 1,
 };
 
+static struct s3c24xx_audio_simtec_pdata __initdata bast_audio = {
+	.have_mic	= 1,
+	.have_lout	= 1,
+};
+
 static void __init bast_map_io(void)
 {
 	/* initialise the clocks */
@@ -647,6 +653,7 @@ static void __init bast_init(void)
 
 	usb_simtec_init();
 	nor_simtec_init();
+	simtec_audio_add(NULL, true, &bast_audio);
 
 	s3c_cpufreq_setboard(&bast_cpufreq);
 }
Index: b/arch/arm/mach-s3c2410/mach-vr1000.c
===================================================================
--- a/arch/arm/mach-s3c2410/mach-vr1000.c	2009-11-09 15:30:39.000000000 +0000
+++ b/arch/arm/mach-s3c2410/mach-vr1000.c	2009-11-09 15:43:27.000000000 +0000
@@ -49,6 +49,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/iic.h>
+#include <plat/audio-simtec.h>
 
 #include "usb-simtec.h"
 #include "nor-simtec.h"
@@ -393,6 +394,7 @@ static void __init vr1000_init(void)
 				ARRAY_SIZE(vr1000_i2c_devs));
 
 	nor_simtec_init();
+	simtec_audio_add(NULL, true, NULL);
 }
 
 MACHINE_START(VR1000, "Thorcom-VR1000")
Index: b/arch/arm/mach-s3c2440/mach-anubis.c
===================================================================
--- a/arch/arm/mach-s3c2440/mach-anubis.c	2009-11-09 15:30:39.000000000 +0000
+++ b/arch/arm/mach-s3c2440/mach-anubis.c	2009-11-09 17:01:12.000000000 +0000
@@ -53,8 +53,9 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/audio-simtec.h>
 
-#define COPYRIGHT ", (c) 2005 Simtec Electronics"
+#define COPYRIGHT ", (c) 2005-2009 Simtec Electronics"
 
 static struct map_desc anubis_iodesc[] __initdata = {
   /* ISA IO areas */
@@ -437,6 +438,17 @@ static struct i2c_board_info anubis_i2c_
 	}
 };
 
+/* Audio setup */
+static struct s3c24xx_audio_simtec_pdata __initdata anubis_audio = {
+	.have_mic	= 1,
+	.have_lout	= 1,
+	.output_cdclk	= 1,
+	.use_mpllin	= 1,
+	.amp_gpio	= S3C2410_GPB(2),
+	.amp_gain[0]	= S3C2410_GPD(10),
+	.amp_gain[1]	= S3C2410_GPD(11),
+};
+
 static void __init anubis_map_io(void)
 {
 	/* initialise the clocks */
@@ -476,6 +488,7 @@ static void __init anubis_map_io(void)
 static void __init anubis_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
+	simtec_audio_add(NULL, false, &anubis_audio);
 	platform_add_devices(anubis_devices, ARRAY_SIZE(anubis_devices));
 
 	i2c_register_board_info(0, anubis_i2c_devs,
