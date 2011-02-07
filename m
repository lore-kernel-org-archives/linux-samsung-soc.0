From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: S5P: Fix length of memory resource definition for UART
 devices
Date: Mon, 07 Feb 2011 15:37:43 +0530
Message-ID: <1297073263-25092-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19283 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752127Ab1BGKJG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Feb 2011 05:09:06 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LG8007CKS74THE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Feb 2011 19:09:04 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LG800G8TS6Z9L@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Feb 2011 19:09:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

The length of memory resource definition for UART devices in all the
s5p platforms is one byte more than the intended value. This patch
fixes the UART memory resource definition for all s5p platforms.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s5p6442/include/mach/map.h |    2 +-
 arch/arm/mach-s5p64x0/include/mach/map.h |    2 +-
 arch/arm/mach-s5pc100/include/mach/map.h |    2 +-
 arch/arm/mach-s5pv210/include/mach/map.h |    2 +-
 arch/arm/mach-s5pv310/include/mach/map.h |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s5p6442/include/mach/map.h b/arch/arm/mach-s5p6442/include/mach/map.h
index 203dd5a..59464f9 100644
--- a/arch/arm/mach-s5p6442/include/mach/map.h
+++ b/arch/arm/mach-s5p6442/include/mach/map.h
@@ -46,7 +46,7 @@
 #define S5P_PA_UART0		(S5P6442_PA_UART + 0x0)
 #define S5P_PA_UART1		(S5P6442_PA_UART + 0x400)
 #define S5P_PA_UART2		(S5P6442_PA_UART + 0x800)
-#define S5P_SZ_UART		SZ_256
+#define S5P_SZ_UART		(SZ_256 - 1)
 
 #define S5P6442_PA_IIC0		(0xEC100000)
 
diff --git a/arch/arm/mach-s5p64x0/include/mach/map.h b/arch/arm/mach-s5p64x0/include/mach/map.h
index a9365e5..c32c117 100644
--- a/arch/arm/mach-s5p64x0/include/mach/map.h
+++ b/arch/arm/mach-s5p64x0/include/mach/map.h
@@ -51,7 +51,7 @@
 #define S5P_PA_UART4		S5P6450_PA_UART(4)
 #define S5P_PA_UART5		S5P6450_PA_UART(5)
 
-#define S5P_SZ_UART		SZ_256
+#define S5P_SZ_UART		(SZ_256 - 1)
 
 #define S5P6440_PA_IIC0		(0xEC104000)
 #define S5P6440_PA_IIC1		(0xEC20F000)
diff --git a/arch/arm/mach-s5pc100/include/mach/map.h b/arch/arm/mach-s5pc100/include/mach/map.h
index ccbe6b7..f999021 100644
--- a/arch/arm/mach-s5pc100/include/mach/map.h
+++ b/arch/arm/mach-s5pc100/include/mach/map.h
@@ -128,6 +128,6 @@
 #define S5P_PA_UART2			S5P_PA_UART(2)
 #define S5P_PA_UART3			S5P_PA_UART(3)
 
-#define S5P_SZ_UART			SZ_256
+#define S5P_SZ_UART			(SZ_256 - 1)
 
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 1dd5883..89b4f0b 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -130,6 +130,6 @@
 #define S5P_PA_UART2			S5P_PA_UART(2)
 #define S5P_PA_UART3			S5P_PA_UART(3)
 
-#define S5P_SZ_UART			SZ_256
+#define S5P_SZ_UART			(SZ_256 - 1)
 
 #endif /* __ASM_ARCH_MAP_H */
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 901657f..5235024 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -139,6 +139,6 @@
 #define S5P_PA_UART3			S5P_PA_UART(3)
 #define S5P_PA_UART4			S5P_PA_UART(4)
 
-#define S5P_SZ_UART			SZ_256
+#define S5P_SZ_UART			(SZ_256 - 1)
 
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.6.6.rc2
