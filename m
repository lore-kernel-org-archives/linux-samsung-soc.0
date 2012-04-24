From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix compilation error when CONFIG_OF is not defined
Date: Tue, 24 Apr 2012 11:36:48 +0530
Message-ID: <1335247608-28518-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:38371 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751876Ab2DXGPv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 02:15:51 -0400
Received: by dadz8 with SMTP id z8so452268dad.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Apr 2012 23:15:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Thomas Abraham <thomas.abraham@linaro.org>

Fixed following compile time error.
arch/arm/mach-exynos/common.c: In function 'exynos5_init_irq':
arch/arm/mach-exynos/common.c:539:2: error: implicit declaration of function 'of_irq_init'
arch/arm/mach-exynos/common.c:539:14: error: 'exynos4_dt_irq_match' undeclared (first use in this function)
arch/arm/mach-exynos/common.c:539:14: note: each undeclared identifier is reported only once for each function it appears in

CC: Thomas Abraham <thomas.abraham@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/common.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 1396c06..42de625 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -536,7 +536,9 @@ void __init exynos5_init_irq(void)
 {
 	int irq;
 
+#ifdef CONFIG_OF
 	of_irq_init(exynos4_dt_irq_match);
+#endif
 
 	for (irq = 0; irq < EXYNOS5_MAX_COMBINER_NR; irq++) {
 		combiner_init(irq, (void __iomem *)S5P_VA_COMBINER(irq),
-- 
1.7.4.1
