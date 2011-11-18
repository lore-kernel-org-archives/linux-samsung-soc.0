From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 6/6] ARM: S3C64XX: Modified according to SPI consolidation
 work.
Date: Fri, 18 Nov 2011 09:35:50 -0500
Message-ID: <1321626950-19859-7-git-send-email-padma.v@samsung.com>
References: <1321626950-19859-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14508 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756514Ab1KREkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Nov 2011 23:40:17 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUU00FI6AB4I8E0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2011 13:40:16 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUU00M8HAAKM1G0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2011 13:40:16 +0900 (KST)
In-reply-to: <1321626950-19859-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.kvr@gmail.com, padma.v@samsung.com
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
1.7.1
