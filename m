From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: Re: [PATCH 4/7] ARM: S3C64XX: Add touchscreen platform device
	definition
Date: Mon, 8 Mar 2010 21:07:46 +0100
Message-ID: <b2e8f9f71003081207v5a778290j8636f4cc5a66377b@mail.gmail.com>
References: <b2e8f9f71003081038u441531bfsba40c7a11d302ee0@mail.gmail.com>
	<20100308195911.GG24864@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f209.google.com ([209.85.218.209]:39196 "EHLO
	mail-bw0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755543Ab0CHUII convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Mar 2010 15:08:08 -0500
Received: by bwz1 with SMTP id 1so3193007bwz.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Mar 2010 12:08:07 -0800 (PST)
In-Reply-To: <20100308195911.GG24864@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This adds the touchscreen platform device definition for S3C64XX boards=
=2E

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
=C2=A0arch/arm/mach-s3c64xx/Makefile | =C2=A0 =C2=A01 +
=C2=A0arch/arm/mach-s3c64xx/dev-ts.c | =C2=A0 61 ++++++++++++++++++++++=
++++++++++++++++++
=C2=A0arch/arm/plat-samsung/Kconfig =C2=A0| =C2=A0 =C2=A06 ++++
=C2=A03 files changed, 68 insertions(+), 0 deletions(-)
=C2=A0create mode 100644 arch/arm/mach-s3c64xx/dev-ts.c

diff --git a/arch/arm/mach-s3c64xx/Makefile b/arch/arm/mach-s3c64xx/Mak=
efile
index d1d341a..02bc97f 100644
--- a/arch/arm/mach-s3c64xx/Makefile
+++ b/arch/arm/mach-s3c64xx/Makefile
@@ -60,3 +60,4 @@ obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D dev-rtc.o
=C2=A0obj-$(CONFIG_S3C_ADC) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D dev-=
adc.o
=C2=A0obj-$(CONFIG_SND_S3C24XX_SOC) =C2=A0+=3D dev-audio.o
=C2=A0obj-$(CONFIG_S3C64XX_DEV_SPI) =C2=A0+=3D dev-spi.o
+obj-$(CONFIG_S3C64XX_DEV_TS) =C2=A0+=3D dev-ts.o
diff --git a/arch/arm/mach-s3c64xx/dev-ts.c b/arch/arm/mach-s3c64xx/dev=
-ts.c
new file mode 100644
index 0000000..17cc793
--- /dev/null
+++ b/arch/arm/mach-s3c64xx/dev-ts.c
@@ -0,0 +1,61 @@
+/* linux/arch/arm/mach-s3c64xx/dev-ts.c
+ *
+ * Copyright (c) 2008 Simtec Electronics
+ * =C2=A0 =C2=A0 http://armlinux.simtec.co.uk/
+ * =C2=A0 =C2=A0 Ben Dooks <ben@simtec.co.uk>, <ben-linux@fluff.org>
+ *
+ * Adapted by Maurus Cuelenaere for s3c64xx
+ *
+ * S3C64XX series device definition for touchscreen device
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/platform_device.h>
+
+#include <mach/irqs.h>
+#include <mach/map.h>
+
+#include <plat/devs.h>
+#include <plat/ts.h>
+
+static struct resource s3c_ts_resource[] =3D {
+ =C2=A0 =C2=A0 =C2=A0 [0] =3D {
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D S3C64XX_P=
A_ADC,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D S3C6=
4XX_PA_ADC + SZ_256 - 1,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOURC=
E_MEM,
+ =C2=A0 =C2=A0 =C2=A0 },
+ =C2=A0 =C2=A0 =C2=A0 [1] =3D {
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D IRQ_TC,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D IRQ_=
TC,
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOURC=
E_IRQ,
+ =C2=A0 =C2=A0 =C2=A0 },
+};
+
+struct platform_device s3c_device_ts =3D {
+ =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "s3=
c64xx-ts",
+ =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 -1,
+ =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s3c_ts_resou=
rce),
+ =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s3c_ts_resour=
ce,
+};
+
+void __init s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *pd)
+{
+ =C2=A0 =C2=A0 =C2=A0 struct s3c2410_ts_mach_info *npd;
+
+ =C2=A0 =C2=A0 =C2=A0 if (!pd) {
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%s:=
 no platform data\n", __func__);
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
+ =C2=A0 =C2=A0 =C2=A0 }
+
+ =C2=A0 =C2=A0 =C2=A0 npd =3D kmemdup(pd, sizeof(struct s3c2410_ts_mac=
h_info), GFP_KERNEL);
+ =C2=A0 =C2=A0 =C2=A0 if (!npd)
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%s:=
 no memory for platform data\n", __func__);
+
+ =C2=A0 =C2=A0 =C2=A0 s3c_device_ts.dev.platform_data =3D npd;
+}
+EXPORT_SYMBOL(s3c24xx_ts_set_platdata);
diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kcon=
fig
index d552c65..5d3ef35 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -191,6 +191,12 @@ config S3C64XX_DEV_SPI
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Compile in platform device definition=
s for S3C64XX's type
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SPI controllers.

+config S3C64XX_DEV_TS
+ =C2=A0 =C2=A0 =C2=A0 bool
+ =C2=A0 =C2=A0 =C2=A0 help
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Common in platform device definiti=
ons for S3C64XX touchscreen
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device
+
=C2=A0# DMA

=C2=A0config S3C_DMA
--
1.7.0.1
