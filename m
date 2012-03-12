From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 3/6] ARM: S3C24XX: Add map entries needed by the s3c64xx-spi devices
Date: Mon, 12 Mar 2012 20:01:32 +0100
Message-ID: <201203122001.33226.heiko@sntech.de>
References: <201203121959.32966.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:53391 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754105Ab2CLTBk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Mar 2012 15:01:40 -0400
In-Reply-To: <201203121959.32966.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The S3C_PA_SPIx constants are only used by the s3c64xx-spi driver
and don't conflict with the older SoCs as they don't support hsspi.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/include/mach/map.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/map.h b/arch/arm/mach-s3c24xx/include/mach/map.h
index 78ae807..8ba381f 100644
--- a/arch/arm/mach-s3c24xx/include/mach/map.h
+++ b/arch/arm/mach-s3c24xx/include/mach/map.h
@@ -98,6 +98,8 @@
 
 /* SPI */
 #define S3C2410_PA_SPI	   (0x59000000)
+#define S3C2443_PA_SPI0		(0x52000000)
+#define S3C2443_PA_SPI1		S3C2410_PA_SPI
 
 /* SDI */
 #define S3C2410_PA_SDI	   (0x5A000000)
@@ -162,4 +164,7 @@
 #define S3C_PA_WDT	    S3C2410_PA_WATCHDOG
 #define S3C_PA_NAND	    S3C24XX_PA_NAND
 
+#define S3C_PA_SPI0		S3C2443_PA_SPI0
+#define S3C_PA_SPI1		S3C2443_PA_SPI1
+
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.7.2.3
