From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Fix SPI platform device name
Date: Fri, 13 May 2011 16:14:51 +0900
Message-ID: <1305270891-8199-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34948 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757086Ab1EMHR3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 May 2011 03:17:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, padmavathi venna <padma.v@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: padmavathi venna <padma.v@samsung.com>

Changed the SPI platform device name from S5P6450 to S5P64x0 as it is
defined common for both S5p6440 and S5P6450 in dev-spi.c of S5P64x0.

Signed-off-by: padmavathi venna <padma.v@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/include/plat/devs.h |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index f0da6b7..02fd22a 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -75,10 +75,8 @@ extern struct platform_device s5pc100_device_spi1;
 extern struct platform_device s5pc100_device_spi2;
 extern struct platform_device s5pv210_device_spi0;
 extern struct platform_device s5pv210_device_spi1;
-extern struct platform_device s5p6440_device_spi0;
-extern struct platform_device s5p6440_device_spi1;
-extern struct platform_device s5p6450_device_spi0;
-extern struct platform_device s5p6450_device_spi1;
+extern struct platform_device s5p64x0_device_spi0;
+extern struct platform_device s5p64x0_device_spi1;
 
 extern struct platform_device s3c_device_hwmon;
 
-- 
1.7.1
