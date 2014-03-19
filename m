From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: SAMSUNG: Introduce generic Exynos4 and 5 helpers
Date: Wed, 19 Mar 2014 17:55:54 +0530
Message-ID: <1395231957-22032-2-git-send-email-sachin.kamat@linaro.org>
References: <1395231957-22032-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:50553 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964931AbaCSMcZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 08:32:25 -0400
Received: by mail-pa0-f54.google.com with SMTP id lf10so8951455pab.27
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2014 05:32:25 -0700 (PDT)
In-Reply-To: <1395231957-22032-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, t.figa@samsung.com, arnd@arndb.de, kgene.kim@samsung.com, sachin.kamat@linaro.org

Add helpers to check for Exynos4 and 5 family of SoCs.
This will eliminate comparing long list of SoCs and make
code simpler.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/include/plat/cpu.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index d762533b856f..b9ae39ca1b7f 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -166,6 +166,10 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos5440()	0
 #endif
 
+#define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
+				soc_is_exynos4412())
+#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5420())
+
 #define IODESC_ENT(x) { (unsigned long)S3C24XX_VA_##x, __phys_to_pfn(S3C24XX_PA_##x), S3C24XX_SZ_##x, MT_DEVICE }
 
 #ifndef KHZ
-- 
1.7.9.5
