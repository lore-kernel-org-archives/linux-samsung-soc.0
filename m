From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
Subject: RFC[PATCH 4/6] ARM: S5P64X0: Populate default platform data for SDHCI
 devices
Date: Mon, 08 Aug 2011 14:17:54 +0530
Message-ID: <1312793277-18689-5-git-send-email-rajeshwari.s@samsung.com>
References: <1312793277-18689-1-git-send-email-rajeshwari.s@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11962 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab1HHItx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Aug 2011 04:49:53 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPL00AWCPUNLPT0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 17:49:53 +0900 (KST)
Received: from rajeshwari-linux.sisodomain.com ([107.108.215.115])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPL00BGTPUTHJ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Aug 2011 17:49:53 +0900 (KST)
In-reply-to: <1312793277-18689-1-git-send-email-rajeshwari.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, cjb@laptop.org, ben-linux@fluff.org

This patch populates the default platform data required by
SDHCI devices for S5P6440 and S5P6450.

Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
---
 arch/arm/mach-s5p64x0/cpu.c                |    9 +++++
 arch/arm/plat-samsung/include/plat/sdhci.h |   50 ++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/cpu.c b/arch/arm/mach-s5p64x0/cpu.c
index a5c0095..1b2063c 100644
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
 	iotable_init(s5p6450_iodesc, ARRAY_SIZE(s5p6450_iodesc));
 }
diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index 058e096..dde13aa 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -126,6 +126,10 @@ extern void exynos4_setup_sdhci0_cfg_gpio(struct platform_device *, int w);
 extern void exynos4_setup_sdhci1_cfg_gpio(struct platform_device *, int w);
 extern void exynos4_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
 extern void exynos4_setup_sdhci3_cfg_gpio(struct platform_device *, int w);
+extern void s5p64x0_setup_sdhci0_cfg_gpio(struct platform_device *, int w);
+extern void s5p64x0_setup_sdhci1_cfg_gpio(struct platform_device *, int w);
+extern void s5p6440_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
+extern void s5p6450_setup_sdhci2_cfg_gpio(struct platform_device *, int w);
 
 /* S3C2416 SDHCI setup */
 
@@ -390,4 +394,50 @@ static inline void exynos4_default_sdhci3(void) { }
 
 #endif /* CONFIG_EXYNOS4_SETUP_SDHCI */
 
+/* S5P64X0 SDHCI setup */
+#ifdef CONFIG_S5P64X0_SETUP_SDHCI
+extern void s5p64x0_setup_sdhci_cfg_card(struct platform_device *dev,
+						void __iomem *r,
+						struct mmc_ios *ios,
+						struct mmc_card *card);
+
+static inline void s5p64x0_default_sdhci0(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC
+	s3c_hsmmc0_def_platdata.cfg_gpio = s5p64x0_setup_sdhci0_cfg_gpio;
+	s3c_hsmmc0_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC */
+}
+
+static inline void s5p64x0_default_sdhci1(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC1
+	s3c_hsmmc1_def_platdata.cfg_gpio = s5p64x0_setup_sdhci1_cfg_gpio;
+	s3c_hsmmc1_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC1 */
+}
+
+static inline void s5p6440_default_sdhci2(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC2
+	s3c_hsmmc2_def_platdata.cfg_gpio = s5p6440_setup_sdhci2_cfg_gpio;
+	s3c_hsmmc2_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC2 */
+}
+
+static inline void s5p6450_default_sdhci2(void)
+{
+#ifdef CONFIG_S3C_DEV_HSMMC2
+	s3c_hsmmc2_def_platdata.cfg_gpio = s5p6450_setup_sdhci2_cfg_gpio;
+	s3c_hsmmc2_def_platdata.cfg_card = s5p64x0_setup_sdhci_cfg_card;
+#endif /* CONFIG_S3C_DEV_HSMMC2 */
+}
+
+#else
+static inline void s5p64x0_default_sdhci0(void) { }
+static inline void s5p64x0_default_sdhci1(void) { }
+static inline void s5p6440_default_sdhci2(void) { }
+static inline void s5p6450_default_sdhci2(void) { }
+#endif /* CONFIG_S5P64X0_SETUP_SDHCI */
+
 #endif /* __PLAT_S3C_SDHCI_H */
-- 
1.7.4.4
