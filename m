From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV210: Remove unnecessary symbol for PM
Date: Fri, 12 Aug 2011 15:56:14 +0530
Message-ID: <1313144774-30607-3-git-send-email-a.kesavan@samsung.com>
References: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:8377 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273Ab1HLKZU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:25:20 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT006GI8X1PMR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:18 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00BTU8Y1SP@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:19 +0900 (KST)
In-reply-to: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Make the S5PV210 power management code depend directly on PM rather
than another S5PV210 specific symbol.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig  |    6 ------
 arch/arm/mach-s5pv210/Makefile |    2 +-
 2 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 69dd87c..aaeb44a 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -14,7 +14,6 @@ config CPU_S5PV210
 	select S3C_PL330_DMA
 	select S5P_EXT_INT
 	select S5P_HRT
-	select S5PV210_PM if PM
 	help
 	  Enable S5PV210 CPU support
 
@@ -169,9 +168,4 @@ config MACH_TORBRECK
 
 endmenu
 
-config S5PV210_PM
-	bool
-	help
-	  Power Management code common to S5PV210
-
 endif
diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
index 599a3c0..ef7e466 100644
--- a/arch/arm/mach-s5pv210/Makefile
+++ b/arch/arm/mach-s5pv210/Makefile
@@ -14,7 +14,7 @@ obj-				:=
 
 obj-$(CONFIG_CPU_S5PV210)	+= cpu.o init.o clock.o dma.o
 obj-$(CONFIG_CPU_S5PV210)	+= setup-i2c0.o
-obj-$(CONFIG_S5PV210_PM)	+= pm.o sleep.o
+obj-$(CONFIG_PM)		+= pm.o sleep.o
 
 # machine support
 
-- 
1.7.4.1
