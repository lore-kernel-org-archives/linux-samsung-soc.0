From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS: Remove unused soc_is_exynos{4,5}
Date: Fri, 04 Nov 2016 09:09:24 +0530
Message-ID: <1478230764-13748-5-git-send-email-pankaj.dubey@samsung.com>
References: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35778 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932909AbcKDDg5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 23:36:57 -0400
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OG300EYQM0UQP90@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2016 12:36:39 +0900 (KST)
In-reply-to: <1478230764-13748-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: krzk@kernel.org, kgene@kernel.org, thomas.ab@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As no more user of soc_is_exynos{4,5} we can safely remove them.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/common.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 9424a8a..d19064b 100644
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
