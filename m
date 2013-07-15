From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Remove unnecessary exynos4_default_sdhci*()
Date: Mon, 15 Jul 2013 09:21:07 +0900
Message-ID: <004d01ce80f1$33533d90$99f9b8b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61182 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753565Ab3GOAVJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Jul 2013 20:21:09 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MPY00CPHBMTT150@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Jul 2013 09:21:07 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Jingoo Han <jg1.han@samsung.com>

Commit 17397a2("ARM: EXYNOS: Remove platform device initialization")
removes calling exynos4_default_sdhci*() functions; thus, these are
not necessary any more.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/plat-samsung/include/plat/sdhci.h |   38 ----------------------------
 1 file changed, 38 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
index ce1d0f7..bf65021 100644
--- a/arch/arm/plat-samsung/include/plat/sdhci.h
+++ b/arch/arm/plat-samsung/include/plat/sdhci.h
@@ -260,44 +260,6 @@ static inline void s5pv210_default_sdhci3(void) { }
 
 #endif /* CONFIG_S5PV210_SETUP_SDHCI */
 
-/* EXYNOS4 SDHCI setup */
-#ifdef CONFIG_EXYNOS4_SETUP_SDHCI
-static inline void exynos4_default_sdhci0(void)
-{
-#ifdef CONFIG_S3C_DEV_HSMMC
-	s3c_hsmmc0_def_platdata.cfg_gpio = exynos4_setup_sdhci0_cfg_gpio;
-#endif
-}
-
-static inline void exynos4_default_sdhci1(void)
-{
-#ifdef CONFIG_S3C_DEV_HSMMC1
-	s3c_hsmmc1_def_platdata.cfg_gpio = exynos4_setup_sdhci1_cfg_gpio;
-#endif
-}
-
-static inline void exynos4_default_sdhci2(void)
-{
-#ifdef CONFIG_S3C_DEV_HSMMC2
-	s3c_hsmmc2_def_platdata.cfg_gpio = exynos4_setup_sdhci2_cfg_gpio;
-#endif
-}
-
-static inline void exynos4_default_sdhci3(void)
-{
-#ifdef CONFIG_S3C_DEV_HSMMC3
-	s3c_hsmmc3_def_platdata.cfg_gpio = exynos4_setup_sdhci3_cfg_gpio;
-#endif
-}
-
-#else
-static inline void exynos4_default_sdhci0(void) { }
-static inline void exynos4_default_sdhci1(void) { }
-static inline void exynos4_default_sdhci2(void) { }
-static inline void exynos4_default_sdhci3(void) { }
-
-#endif /* CONFIG_EXYNOS4_SETUP_SDHCI */
-
 static inline void s3c_sdhci_setname(int id, char *name)
 {
 	switch (id) {
-- 
1.7.10.4
