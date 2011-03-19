From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 1/6] ARM: EXYNOS4: Fix addruart macro
Date: Sat, 19 Mar 2011 13:20:14 +0530
Message-ID: <1300521019-13612-2-git-send-email-thomas.ab@samsung.com>
References: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42603 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753693Ab1CSHwB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Mar 2011 03:52:01 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIA00BPEOIN3D40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:51:59 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIA00APIOIIEL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:51:59 +0900 (KST)
In-reply-to: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

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
