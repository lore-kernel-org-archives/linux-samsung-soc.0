From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Added SPI machine support
Date: Mon, 04 Jul 2011 13:42:24 -0400
Message-ID: <1309801344-27588-1-git-send-email-padma.v@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39399 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751340Ab1GDLyn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 07:54:43 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT00BB3526YAX0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:54:42 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT003C2531EE@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 20:54:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Added SPI machine support in SMDK6410,SMDKC100,SMDKV210

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s3c64xx/Kconfig |    1 +
 arch/arm/mach-s5pc100/Kconfig |    1 +
 arch/arm/mach-s5pv210/Kconfig |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 4e2c371..ba36abc 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -150,6 +150,7 @@ config MACH_SMDK6410
 	select S3C64XX_SETUP_IDE
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_KEYPAD
+	select S3C64XX_DEV_SPI
 	help
 	  Machine support for the Samsung SMDK6410
 
diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
index 608722f..ceca59f 100644
--- a/arch/arm/mach-s5pc100/Kconfig
+++ b/arch/arm/mach-s5pc100/Kconfig
@@ -68,6 +68,7 @@ config MACH_SMDKC100
 	select S5P_DEV_FIMC0
 	select S5P_DEV_FIMC1
 	select S5P_DEV_FIMC2
+	select S3C64XX_DEV_SPI
 	help
 	  Machine support for the Samsung SMDKC100
 
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..2871ff2 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -144,6 +144,7 @@ config MACH_SMDKV210
 	select S5PV210_SETUP_IDE
 	select S5PV210_SETUP_KEYPAD
 	select S5PV210_SETUP_SDHCI
+	select S3C64XX_DEV_SPI
 	help
 	  Machine support for Samsung SMDKV210
 
-- 
1.7.0.4
