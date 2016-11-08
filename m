From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESPIN-PATCH v2 2/2] ARM: EXYNOS: Remove unused soc_is_exynos{4,5}
Date: Tue, 08 Nov 2016 16:49:44 +0530
Message-ID: <1478603984-504-3-git-send-email-pankaj.dubey@samsung.com>
References: <1478603984-504-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41081 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932607AbcKHLQt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Nov 2016 06:16:49 -0500
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OGB0263ZLZVLP40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Nov 2016 20:16:46 +0900 (KST)
In-reply-to: <1478603984-504-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As no more user of soc_is_exynos{4,5} we can safely remove them.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/mach-exynos/common.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index dd5d8e8..fb12d11 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -105,11 +105,6 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EXYNOS5_SOC_MASK)
 # define soc_is_exynos5800()	0
 #endif
 
-#define soc_is_exynos4() (soc_is_exynos4210() || soc_is_exynos4212() || \
-			  soc_is_exynos4412())
-#define soc_is_exynos5() (soc_is_exynos5250() || soc_is_exynos5410() || \
-			  soc_is_exynos5420() || soc_is_exynos5800())
-
 extern u32 cp15_save_diag;
 extern u32 cp15_save_power;
 
-- 
2.7.4
