From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add support for rtc wakeup
Date: Thu, 27 Dec 2012 09:30:40 +0530
Message-ID: <1356580840-22960-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:47891 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751743Ab2L0EAr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 23:00:47 -0500
Received: by mail-pb0-f52.google.com with SMTP id ro2so5094749pbb.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 20:00:47 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

Set the gic arch extension callback to support rtc wakeup.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 arch/arm/mach-exynos/common.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 578a610..bf2ee1d 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -747,6 +747,8 @@ void __init exynos4_init_irq(void)
 	 * uses GIC instead of VIC.
 	 */
 	s5p_init_irq(NULL, 0);
+
+	gic_arch_extn.irq_set_wake = s3c_irq_wake;
 }
 
 void __init exynos5_init_irq(void)
-- 
1.7.9.5
