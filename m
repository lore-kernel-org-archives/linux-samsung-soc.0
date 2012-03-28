From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Fix soft reboot hang after suspend/resume
Date: Wed, 28 Mar 2012 15:47:46 +0530
Message-ID: <1332929866-31489-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:47433 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757656Ab2C1KRz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Mar 2012 06:17:55 -0400
Received: by gghe5 with SMTP id e5so563813ggh.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Mar 2012 03:17:55 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: samsung@lists.linaro.org, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org, kgene.kim@samsung.com, Inderpal Singh <inderpal.singh@linaro.org>

Upon wake-up, clear the sleep mode set in INFORM1 register.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 arch/arm/mach-exynos/pm.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index f0bb467..16cba3f 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -381,6 +381,10 @@ static void exynos4_pm_resume(void)
 #endif
 
 early_wakeup:
+
+	/* Clear SLEEP mode set in INFORM1 */
+	__raw_writel(0x0, S5P_INFORM1);
+
 	return;
 }
 
-- 
1.7.5.4
