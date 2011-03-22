From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Fix addruart macro
Date: Tue, 22 Mar 2011 17:29:29 +0530
Message-ID: <1300795169-7312-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22568 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753713Ab1CVMFI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Mar 2011 08:05:08 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIG00H5NK8GCH00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Mar 2011 21:05:04 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIG007IEK01JR@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Mar 2011 21:00:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: nicolas.pitre@linaro.org
Cc: linaro-dev@lists.linaro.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, patches@linaro.org

Fix incorrect conditional execution of ldr instructions in
addruart macro.

Signed-off-by: Thomas Abraham <thomas.abraham@samsung.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/debug-macro.S |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/debug-macro.S b/arch/arm/mach-exynos4/include/mach/debug-macro.S
index 58bbd04..a442ef8 100644
--- a/arch/arm/mach-exynos4/include/mach/debug-macro.S
+++ b/arch/arm/mach-exynos4/include/mach/debug-macro.S
@@ -21,8 +21,8 @@
 	 */
 
 	.macro addruart, rp, rv
-		ldreq	\rp, = S3C_PA_UART
-		ldrne	\rv, = S3C_VA_UART
+		ldr	\rp, = S3C_PA_UART
+		ldr	\rv, = S3C_VA_UART
 #if CONFIG_DEBUG_S3C_UART != 0
 		add	\rp, \rp, #(0x10000 * CONFIG_DEBUG_S3C_UART)
 		add	\rv, \rv, #(0x10000 * CONFIG_DEBUG_S3C_UART)
-- 
1.6.6.rc2
