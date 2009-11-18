From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 02/19] ARM: S5PC1XX: create sub-platform for S5PC100 SoCs
Date: Wed, 18 Nov 2009 14:32:57 +0100
Message-ID: <1258551194-16018-3-git-send-email-m.szyprowski@samsung.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49329 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757054AbZKRNfm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2009 08:35:42 -0500
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KTB009MJ4FKGS@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Nov 2009 13:35:44 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KTB000BN4FJ66@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Nov 2009 13:35:44 +0000 (GMT)
In-reply-to: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org

From: Kyungmin Park <kyungmin.park@samsung.com>

Samsung S5PC100 and S5PC110 SoCs differs a lot in register map and other
core platform definitions, so it is not possible to have both SoCs in
the current platform framework without runtime hacks. To address this
issue a sub-platform has been introduced, so each SoC in sub-platform
can have its own set of include files (register map, irq&gpio
definitions, etc)

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

---
 arch/arm/Makefile             |    2 +-
 arch/arm/mach-s5pc100/Kconfig |    4 ++++
 arch/arm/plat-s5pc1xx/Kconfig |   10 ++++++++++
 3 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a73caaf..daea150 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -160,7 +160,7 @@ machine-$(CONFIG_ARCH_RPC)		:= rpc
 machine-$(CONFIG_ARCH_S3C2410)		:= s3c2410 s3c2400 s3c2412 s3c2440 s3c2442 s3c2443
 machine-$(CONFIG_ARCH_S3C24A0)		:= s3c24a0
 machine-$(CONFIG_ARCH_S3C64XX)		:= s3c6400 s3c6410
-machine-$(CONFIG_ARCH_S5PC1XX)		:= s5pc100
+machine-$(CONFIG_ARCH_S5PC100)		:= s5pc100
 machine-$(CONFIG_ARCH_SA1100)		:= sa1100
 machine-$(CONFIG_ARCH_SHARK)		:= shark
 machine-$(CONFIG_ARCH_STMP378X)		:= stmp378x
diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 0dd2b8c..d72f881 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -5,6 +5,8 @@
 #
 # Licensed under GPLv2
 
+if ARCH_S5PC100
+
 # Configuration options for the S5PC100 CPU
 
 config CPU_S5PC100
@@ -34,3 +36,5 @@ config MACH_SMDKC100
 	select S5PC100_SETUP_SDHCI
 	help
 	  Machine support for the Samsung SMDKC100
+
+endif
diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
index 1608e62..eee2abb 100644
--- a/arch/arm/plat-s5pc1xx/Kconfig
+++ b/arch/arm/plat-s5pc1xx/Kconfig
@@ -23,6 +23,16 @@ config PLAT_S5PC1XX
 
 if PLAT_S5PC1XX
 
+choice
+	prompt "S5PC1xx SoC Type"
+	default ARCH_S5PC100
+
+config ARCH_S5PC100
+	bool "S5PC100"
+
+endchoice
+
+
 # Configuration options shared by all S3C64XX implementations
 
 config CPU_S5PC100_INIT
-- 
1.6.4
