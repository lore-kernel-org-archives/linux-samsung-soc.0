From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: updates sdhci.h for Samsung SoCs
Date: Mon,  5 Jul 2010 21:18:08 +0900
Message-ID: <1278332288-28021-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:59109 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448Ab0GEMYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jul 2010 08:24:00 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch updates sdhci.h as Maurus suggestion like following:

From:
	#ifdef ...
	function()
	{
		blahblah;
	}
	#else
	function() { }
	#endif

To:
	function()
	{
	#ifdef ...
		blahblah;
	#endif
	}

And fixes a couple of typos.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Note: depends on previous v3 patch set, Add support HSMMC on Samsung SMDKV210

 arch/arm/plat-samsung/include/plat/sdhci.h |   91 +++++++++-------------------
 1 files changed, 30 insertions(+), 61 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 1314ffa..5ad1e94 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -82,12 +82,11 @@ extern void s5pv210_setup_sdhci1_cfg_gpio(struct platform_device *, int w);
 extern void s5pv210_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
 extern void s5pv210_setup_sdhci3_cfg_gpio(struct platform_device *, int w);
 
-/* S3C6400 SDHCI setup */
+/* S3C64XX SDHCI setup */
 
 #ifdef CONFIG_S3C64XX_SETUP_SDHCI
 extern char *s3c64xx_hsmmc_clksrcs[4];
 
-#ifdef CONFIG_S3C_DEV_HSMMC
 extern void s3c6400_setup_sdhci_cfg_card(struct platform_device *dev,
 					 void __iomem *r,
 					 struct mmc_ios *ios,
@@ -95,76 +94,62 @@ extern void s3c6400_setup_sdhci_cfg_card(struct platform_device *dev,
 
 static inline void s3c6400_default_sdhci0(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC
 	s3c_hsmmc0_def_platdata.clocks = s3c64xx_hsmmc_clksrcs;
 	s3c_hsmmc0_def_platdata.cfg_gpio = s3c64xx_setup_sdhci0_cfg_gpio;
 	s3c_hsmmc0_def_platdata.cfg_card = s3c6400_setup_sdhci_cfg_card;
+#endif
 }
 
-#else
-static inline void s3c6400_default_sdhci0(void) { }
-#endif  /* CONFIG_S3C_DEV_HSMMC */
-
-#ifdef CONFIG_S3C_DEV_HSMMC1
 static inline void s3c6400_default_sdhci1(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC1
 	s3c_hsmmc1_def_platdata.clocks = s3c64xx_hsmmc_clksrcs;
 	s3c_hsmmc1_def_platdata.cfg_gpio = s3c64xx_setup_sdhci1_cfg_gpio;
 	s3c_hsmmc1_def_platdata.cfg_card = s3c6400_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s3c6400_default_sdhci1(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC1 */
 
-#ifdef CONFIG_S3C_DEV_HSMMC2
 static inline void s3c6400_default_sdhci2(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC2
 	s3c_hsmmc2_def_platdata.clocks = s3c64xx_hsmmc_clksrcs;
 	s3c_hsmmc2_def_platdata.cfg_gpio = s3c64xx_setup_sdhci2_cfg_gpio;
 	s3c_hsmmc2_def_platdata.cfg_card = s3c6400_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s3c6400_default_sdhci2(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC2 */
-
-/* S3C6410 SDHCI setup */
 
 extern void s3c6410_setup_sdhci_cfg_card(struct platform_device *dev,
 					 void __iomem *r,
 					 struct mmc_ios *ios,
 					 struct mmc_card *card);
 
-#ifdef CONFIG_S3C_DEV_HSMMC
 static inline void s3c6410_default_sdhci0(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC
 	s3c_hsmmc0_def_platdata.clocks = s3c64xx_hsmmc_clksrcs;
 	s3c_hsmmc0_def_platdata.cfg_gpio = s3c64xx_setup_sdhci0_cfg_gpio;
 	s3c_hsmmc0_def_platdata.cfg_card = s3c6410_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s3c6410_default_sdhci0(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC */
 
-#ifdef CONFIG_S3C_DEV_HSMMC1
 static inline void s3c6410_default_sdhci1(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC1
 	s3c_hsmmc1_def_platdata.clocks = s3c64xx_hsmmc_clksrcs;
 	s3c_hsmmc1_def_platdata.cfg_gpio = s3c64xx_setup_sdhci1_cfg_gpio;
 	s3c_hsmmc1_def_platdata.cfg_card = s3c6410_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s3c6410_default_sdhci1(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC1 */
 
-#ifdef CONFIG_S3C_DEV_HSMMC2
 static inline void s3c6410_default_sdhci2(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC2
 	s3c_hsmmc2_def_platdata.clocks = s3c64xx_hsmmc_clksrcs;
 	s3c_hsmmc2_def_platdata.cfg_gpio = s3c64xx_setup_sdhci2_cfg_gpio;
 	s3c_hsmmc2_def_platdata.cfg_card = s3c6410_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s3c6410_default_sdhci2(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC2 */
 
 #else
 static inline void s3c6410_default_sdhci0(void) { }
@@ -184,48 +169,42 @@ extern void s5pc100_setup_sdhci0_cfg_card(struct platform_device *dev,
 					   struct mmc_ios *ios,
 					   struct mmc_card *card);
 
-#ifdef CONFIG_S3C_DEV_HSMMC
 static inline void s5pc100_default_sdhci0(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC
 	s3c_hsmmc0_def_platdata.clocks = s5pc100_hsmmc_clksrcs;
 	s3c_hsmmc0_def_platdata.cfg_gpio = s5pc100_setup_sdhci0_cfg_gpio;
 	s3c_hsmmc0_def_platdata.cfg_card = s5pc100_setup_sdhci0_cfg_card;
+#endif
 }
-#else
-static inline void s5pc100_default_sdhci0(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC */
 
-#ifdef CONFIG_S3C_DEV_HSMMC1
 static inline void s5pc100_default_sdhci1(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC1
 	s3c_hsmmc1_def_platdata.clocks = s5pc100_hsmmc_clksrcs;
 	s3c_hsmmc1_def_platdata.cfg_gpio = s5pc100_setup_sdhci1_cfg_gpio;
 	s3c_hsmmc1_def_platdata.cfg_card = s5pc100_setup_sdhci0_cfg_card;
+#endif
 }
-#else
-static inline void s5pc100_default_sdhci1(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC1 */
 
-#ifdef CONFIG_S3C_DEV_HSMMC2
 static inline void s5pc100_default_sdhci2(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC2
 	s3c_hsmmc2_def_platdata.clocks = s5pc100_hsmmc_clksrcs;
 	s3c_hsmmc2_def_platdata.cfg_gpio = s5pc100_setup_sdhci2_cfg_gpio;
 	s3c_hsmmc2_def_platdata.cfg_card = s5pc100_setup_sdhci0_cfg_card;
+#endif
 }
-#else
-static inline void s5pc100_default_sdhci2(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC1 */
-
 
 #else
 static inline void s5pc100_default_sdhci0(void) { }
 static inline void s5pc100_default_sdhci1(void) { }
 static inline void s5pc100_default_sdhci2(void) { }
+
 #endif /* CONFIG_S5PC100_SETUP_SDHCI */
 
+/* S5PV210 SDHCI setup */
 
-/* S5PC110 SDHCI setup */
 #ifdef CONFIG_S5PV210_SETUP_SDHCI
 extern char *s5pv210_hsmmc_clksrcs[4];
 
@@ -234,58 +213,48 @@ extern void s5pv210_setup_sdhci_cfg_card(struct platform_device *dev,
 					   struct mmc_ios *ios,
 					   struct mmc_card *card);
 
-#ifdef CONFIG_S3C_DEV_HSMMC
 static inline void s5pv210_default_sdhci0(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC
 	s3c_hsmmc0_def_platdata.clocks = s5pv210_hsmmc_clksrcs;
 	s3c_hsmmc0_def_platdata.cfg_gpio = s5pv210_setup_sdhci0_cfg_gpio;
 	s3c_hsmmc0_def_platdata.cfg_card = s5pv210_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s5pv210_default_sdhci0(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC */
 
-#ifdef CONFIG_S3C_DEV_HSMMC1
 static inline void s5pv210_default_sdhci1(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC1
 	s3c_hsmmc1_def_platdata.clocks = s5pv210_hsmmc_clksrcs;
 	s3c_hsmmc1_def_platdata.cfg_gpio = s5pv210_setup_sdhci1_cfg_gpio;
 	s3c_hsmmc1_def_platdata.cfg_card = s5pv210_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s5pv210_default_sdhci1(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC1 */
 
-#ifdef CONFIG_S3C_DEV_HSMMC2
 static inline void s5pv210_default_sdhci2(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC2
 	s3c_hsmmc2_def_platdata.clocks = s5pv210_hsmmc_clksrcs;
 	s3c_hsmmc2_def_platdata.cfg_gpio = s5pv210_setup_sdhci2_cfg_gpio;
 	s3c_hsmmc2_def_platdata.cfg_card = s5pv210_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s5pv210_default_sdhci2(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC2 */
 
-#ifdef CONFIG_S3C_DEV_HSMMC3
 static inline void s5pv210_default_sdhci3(void)
 {
+#ifdef CONFIG_S3C_DEV_HSMMC3
 	s3c_hsmmc3_def_platdata.clocks = s5pv210_hsmmc_clksrcs;
 	s3c_hsmmc3_def_platdata.cfg_gpio = s5pv210_setup_sdhci3_cfg_gpio;
 	s3c_hsmmc3_def_platdata.cfg_card = s5pv210_setup_sdhci_cfg_card;
+#endif
 }
-#else
-static inline void s5pv210_default_sdhci3(void) { }
-#endif /* CONFIG_S3C_DEV_HSMMC3 */
 
 #else
 static inline void s5pv210_default_sdhci0(void) { }
 static inline void s5pv210_default_sdhci1(void) { }
 static inline void s5pv210_default_sdhci2(void) { }
 static inline void s5pv210_default_sdhci3(void) { }
-#endif /* CONFIG_S5PC100_SETUP_SDHCI */
-
-
 
+#endif /* CONFIG_S5PV210_SETUP_SDHCI */
 
 #endif /* __PLAT_S3C_SDHCI_H */
-- 
1.6.2.5
