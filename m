From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 6/6] ARM: S3C64XX: Modified according to SPI consolidation
 work.
Date: Wed, 14 Dec 2011 10:16:03 -0500
Message-ID: <1323875763-21197-7-git-send-email-padma.v@samsung.com>
References: <1323875763-21197-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39989 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751956Ab1LNFSy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Dec 2011 00:18:54 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW600K4BHDWKTG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Dec 2011 14:18:44 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW600ED3HELIV80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 14 Dec 2011 14:18:44 +0900 (KST)
In-reply-to: <1323875763-21197-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.kvr@gmail.com, padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com

As SPI platform devices are consolidated to plat-samsung, some
corresponding changes are required in the s3c6410 varient SoCs.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-s3c64xx/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index dea62bf..e9dae91 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -281,6 +281,7 @@ config MACH_WLF_CRAGG_6410
 	select S3C64XX_SETUP_IDE
 	select S3C64XX_SETUP_FB_24BPP
 	select S3C64XX_SETUP_KEYPAD
+	select S3C64XX_SETUP_SPI
 	select SAMSUNG_DEV_ADC
 	select SAMSUNG_DEV_KEYPAD
 	select S3C_DEV_USB_HOST
@@ -291,7 +292,7 @@ config MACH_WLF_CRAGG_6410
 	select S3C_DEV_I2C1
 	select S3C_DEV_WDT
 	select S3C_DEV_RTC
-	select S3C64XX_DEV_SPI
+	select S3C64XX_DEV_SPI0
 	select SAMSUNG_GPIO_EXTRA128
 	select I2C
 	help
-- 
1.7.0.4
