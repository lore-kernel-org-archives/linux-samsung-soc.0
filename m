From: Jassi Brar <jassi.brar@samsung.com>
Subject: [PATCH 1/6] S3C64XX SPI: Add SPI controller register base
Date: Sat, 21 Nov 2009 11:51:58 +0900
Message-ID: <1258771918-14121-1-git-send-email-jassi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38604 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754127AbZKUC5E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2009 21:57:04 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

Added SPI controller register base.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/mach-s3c6400/include/mach/map.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h b/arch/arm/mach-s3c6400/include/mach/map.h
index fc8b223..25f5593 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -48,6 +48,8 @@
 #define S3C64XX_PA_IIS1		(0x7F003000)
 #define S3C64XX_PA_TIMER	(0x7F006000)
 #define S3C64XX_PA_IIC0		(0x7F004000)
+#define S3C64XX_PA_SPI0		(0x7F00B000)
+#define S3C64XX_PA_SPI1		(0x7F00C000)
 #define S3C64XX_PA_IISV4	(0x7F00D000)
 #define S3C64XX_PA_IIC1		(0x7F00F000)
 
-- 
1.6.2.5
