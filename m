From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESEND][PATCH] ARM: EXYNOS: Fixed undefined symbol compilation error.
Date: Tue, 15 Nov 2011 15:45:02 +0530
Message-ID: <1321352102-10021-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42675 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753959Ab1KOKNY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 05:13:24 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUP003185QA53V0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 19:13:23 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUP00H465Q5AG70@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 19:13:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Many drivers will fail to compile if compiled as module due to
undefined symbol exynos4_ioremap.
Fix has been added by exporting the same in cpu.c file.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/cpu.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 8e09f34..027f65471 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -8,6 +8,7 @@
  * published by the Free Software Foundation.
 */
 
+#include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/sysdev.h>
 #include <linux/of.h>
@@ -164,6 +165,7 @@ void __iomem *exynos4_ioremap(unsigned long phy, size_t size, unsigned int type)
 
 	return __arm_ioremap(phy, size, type);
 }
+EXPORT_SYMBOL(exynos4_ioremap);
 
 static void exynos_idle(void)
 {
-- 
1.7.4.1
