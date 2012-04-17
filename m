From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 01/12] ARM: Exynos: Remove a new bus_type instance for Exynos5
Date: Tue, 17 Apr 2012 11:16:24 +0530
Message-ID: <1334641595-25301-2-git-send-email-thomas.abraham@linaro.org>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:24943 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab2DQFiP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 01:38:15 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2L00M32ZM06YN0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:14 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M2L00E01ZNEZ8D2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Apr 2012 14:38:14 +0900 (KST)
In-reply-to: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

A seperate bus_type instance is not required for Exynos5. The existing bus_type
instance used with Exynos4 is sufficient for both Exynos4 and Exynos5. This
also solves issue of uninitialized usage of exynos4_subsys in Exynos4 power
management code that is reused for Exynos5 also.

Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
---
 arch/arm/mach-exynos/common.c |   19 ++-----------------
 1 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index e9e353b..636d5f8 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -557,25 +557,13 @@ struct bus_type exynos4_subsys = {
 	.dev_name	= "exynos4-core",
 };
 
-struct bus_type exynos5_subsys = {
-	.name		= "exynos5-core",
-	.dev_name	= "exynos5-core",
-};
-
 static struct device exynos4_dev = {
 	.bus	= &exynos4_subsys,
 };
 
-static struct device exynos5_dev = {
-	.bus	= &exynos5_subsys,
-};
-
 static int __init exynos_core_init(void)
 {
-	if (soc_is_exynos5250())
-		return subsys_system_register(&exynos5_subsys, NULL);
-	else
-		return subsys_system_register(&exynos4_subsys, NULL);
+	return subsys_system_register(&exynos4_subsys, NULL);
 }
 core_initcall(exynos_core_init);
 
@@ -662,10 +650,7 @@ static int __init exynos_init(void)
 {
 	printk(KERN_INFO "EXYNOS: Initializing architecture\n");
 
-	if (soc_is_exynos5250())
-		return device_register(&exynos5_dev);
-	else
-		return device_register(&exynos4_dev);
+	return device_register(&exynos4_dev);
 }
 
 /* uart registration process */
-- 
1.6.6.rc2
