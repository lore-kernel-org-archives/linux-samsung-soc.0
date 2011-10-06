From: Angus Ainslie <angus.ainslie@linaro.org>
Subject: [PATCH] arm: exynos4: build is failing due to missing SZ_4K definition
Date: Thu,  6 Oct 2011 16:03:15 -0600
Message-ID: <1317938595-7007-1-git-send-email-angus.ainslie@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:62394 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758929Ab1JFWDj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Oct 2011 18:03:39 -0400
Received: by iakk32 with SMTP id k32so3428086iak.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Oct 2011 15:03:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org, Angus Ainslie <angus.ainslie@linaro.org>

linux-next build is failing using the exynos4_defconfig. <asm/sizes.h> needs to be 
for the SZ_4K definition

Signed-off-by: Angus Ainslie <angus.ainslie@linaro.org>
---
 arch/arm/mach-exynos4/include/mach/map.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 918a979..02d68f1 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -13,6 +13,7 @@
 #ifndef __ASM_ARCH_MAP_H
 #define __ASM_ARCH_MAP_H __FILE__
 
+#include <asm/sizes.h>
 #include <plat/map-base.h>
 
 /*
-- 
1.7.4.1
