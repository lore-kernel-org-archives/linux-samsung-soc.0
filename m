From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV310: update S5PV310 Kconfig for supporting multiple machines
Date: Fri,  6 Aug 2010 20:42:09 +0900
Message-ID: <1281094929-12721-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34180 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362Ab0HFLyo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Aug 2010 07:54:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch updates Kconfig of mach-s5pv310 for easily dividing S5PC210
and S5PV310 boards. S5PC210(MCP) machines and S5PV310 machines can be
build into one kernel, this will be provied/submitted when new defconfig
can be merged.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
NOTE: Depends on previous 'ARM: S5PV310: Add SMDKC210 board support file' patch

 arch/arm/mach-s5pv310/Kconfig |   22 +++++++++++++++-------
 1 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index ae8e554..9ac29fe 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -27,6 +27,8 @@ config S5PV310_SETUP_I2C2
 
 # machine support
 
+menu "S5PC210 Machines"
+
 config MACH_SMDKC210
 	bool "SMDKC210"
 	select CPU_S5PV310
@@ -35,13 +37,6 @@ config MACH_SMDKC210
 	  Machine support for Samsung SMDKC210
 	  S5PC210(MCP) is one of package option of S5PV310
 
-config MACH_SMDKV310
-	bool "SMDKV310"
-	select CPU_S5PV310
-	select ARCH_SPARSEMEM_ENABLE
-	help
-	  Machine support for Samsung SMDKV310
-
 config MACH_UNIVERSAL_C210
 	bool "Mobile UNIVERSAL_C210 Board"
 	select CPU_S5PV310
@@ -50,4 +45,17 @@ config MACH_UNIVERSAL_C210
 	  Machine support for Samsung Mobile Universal S5PC210 Reference
 	  Board. S5PC210(MCP) is one of package option of S5PV310
 
+endmenu
+
+menu "S5PV310 Machines"
+
+config MACH_SMDKV310
+	bool "SMDKV310"
+	select CPU_S5PV310
+	select ARCH_SPARSEMEM_ENABLE
+	help
+	  Machine support for Samsung SMDKV310
+
+endmenu
+
 endif
-- 
1.6.2.5
