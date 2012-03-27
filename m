From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 2/4] ARM: Exynos: Remove a new bus_type instance for Exynos5
Date: Tue, 27 Mar 2012 14:56:03 +0530
Message-ID: <1332840365-24827-3-git-send-email-thomas.abraham@linaro.org>
References: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23642 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754011Ab2C0JW0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 05:22:26 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1J00CQHE18RHB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:22:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1J003DJDYYQZJ0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:22:25 +0900 (KST)
In-reply-to: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

A seperate bus_type instance is not required for Exynos5. The existing bus_type
instance used with Exynos4 is sufficient for both Exynos4 and Exynos5. This
also solves issue of uninitialized usage of exynos4_subsys in Exynos4 power
management code that is reused for Exynos5 also.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/common.c |   19 ++-----------------
 1 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index a750a5d..f265dc4 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -563,25 +563,13 @@ struct bus_type exynos4_subsys = {
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
 
@@ -667,10 +655,7 @@ static int __init exynos_init(void)
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
