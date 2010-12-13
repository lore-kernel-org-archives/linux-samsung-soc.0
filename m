From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 3/4] ARM: S5P64X0: Add SDHCI platform data for S5P6440/50
Date: Mon, 13 Dec 2010 14:46:24 +0900
Message-ID: <1292219185-3911-4-git-send-email-sbkim73@samsung.com>
References: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41972 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab0LMGFg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Dec 2010 01:05:36 -0500
In-Reply-To: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Adds initialization of the default sdhci devices and platform
data.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/cpu.c                |    9 +++++
 arch/arm/plat-samsung/include/plat/sdhci.h |   52 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index b8d02eb..00e1fa3 100644
--- a/arch/arm/mach-s5p64x0/cpu.c
+++ b/arch/arm/mach-s5p64x0/cpu.c
@@ -38,6 +38,7 @@
 #include <plat/s5p6440.h>
 #include <plat/s5p6450.h>
 #include <plat/adc-core.h>
+#include <plat/sdhci.h>
 
 /* Initial IO mappings */
 
@@ -109,6 +110,10 @@ void __init s5p6440_map_io(void)
 	/* initialize any device information early */
 	s3c_adc_setname("s3c64xx-adc");
 
+	s5p64x0_default_sdhci0();
+	s5p64x0_default_sdhci1();
+	s5p6440_default_sdhci2();
+
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6440_iodesc, ARRAY_SIZE(s5p6440_iodesc));
 }
@@ -118,6 +123,10 @@ void __init s5p6450_map_io(void)
 	/* initialize any device information early */
 	s3c_adc_setname("s3c64xx-adc");
 
+	s5p64x0_default_sdhci0();
+	s5p64x0_default_sdhci1();
+	s5p6450_default_sdhci2();
+
 	iotable_init(s5p64x0_iodesc, ARRAY_SIZE(s5p64x0_iodesc));
 	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6440_iodesc));
 }
diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 85853f8..9035073 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -121,6 +121,10 @@ extern void s5pv310_setup_sdhci0_cfg_gpio(struct platform_device *, int w);
 extern void s5pv310_setup_sdhci1_cfg_gpio(struct platform_device *, int w);
 extern void s5pv310_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
 extern void s5pv310_setup_sdhci3_cfg_gpio(struct platform_device *, int w);
+extern void s5p64x0_setup_sdhci0_cfg_gpio(struct platform_device *, int w);
+extern void s5p64x0_setup_sdhci1_cfg_gpio(struct platform_device *, int w);
+extern void s5p6440_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
+extern void s5p6450_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
 
 /* S3C64XX SDHCI setup */
 
@@ -352,4 +356,52 @@ static inline void s5pv310_default_sdhci3(void) { }
 
 #endif /* CONFIG_S5PV310_SETUP_SDHCI */
 
+/* S5P64X0 SDHCI setup */
+#ifdef CONFIG_S5P64X0_SETUP_SDHCI
+extern char *s5p64x0_hsmmc_clksrcs[4];
+
+extern void s5p64x0_setup_sdhci_cfg_card(struct platform_device *dev,
+						void __iomem *r,
+						struct mmc_ios *ios,
+						struct mmc_card *card);
+
+static inline void s5p64x0_default_sdhci0(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC
+	s3c_hsmmc0_def_platdata.clocks = s5p64x0_hsmmc_clksrcs;
+	s3c_hsmmc0_def_platdata.cfg_gpio = s5p64x0_setup_sdhci0_cfg_gpio;
+	s3c_hsmmc0_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC */
+}
+static inline void s5p64x0_default_sdhci1(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC1
+	s3c_hsmmc1_def_platdata.clocks = s5p64x0_hsmmc_clksrcs;
+	s3c_hsmmc1_def_platdata.cfg_gpio = s5p64x0_setup_sdhci1_cfg_gpio;
+	s3c_hsmmc1_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC1 */
+}
+static inline void s5p6440_default_sdhci2(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC2
+	s3c_hsmmc2_def_platdata.clocks = s5p64x0_hsmmc_clksrcs;
+	s3c_hsmmc2_def_platdata.cfg_gpio = s5p6440_setup_sdhci2_cfg_gpio;
+	s3c_hsmmc2_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC2 */
+}
+static inline void s5p6450_default_sdhci2(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC2
+	s3c_hsmmc2_def_platdata.clocks = s5p64x0_hsmmc_clksrcs;
+	s3c_hsmmc2_def_platdata.cfg_gpio = s5p6450_setup_sdhci2_cfg_gpio;
+	s3c_hsmmc2_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC2 */
+}
+#else
+static inline void s5p64x0_default_sdhci0(void) { }
+static inline void s5p64x0_default_sdhci1(void) { }
+static inline void s5p6440_default_sdhci2(void) { }
+static inline void s5p6450_default_sdhci2(void) { }
+#endif /* CONFIG_S5P64X0_SETUP_SDHCI */
+
 #endif /* __PLAT_S3C_SDHCI_H */
-- 
1.6.6.1
