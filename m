From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v4 3/4] ARM: S3C24XX: move S3C24XX clock Kconfig options to
 Samsung clock Kconfig file
Date: Thu, 08 May 2014 13:07:10 +0900
Message-ID: <1399522031-3394-4-git-send-email-pankaj.dubey@samsung.com>
References: <1399522031-3394-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38103 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752794AbaEHDtE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 23:49:04 -0400
In-reply-to: <1399522031-3394-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>

This patch moves S3C24XX specific clock Kconfig options into
"clk/samsung/Kconfig" and also removes COMMON_CLK selection from
"mach-s3c24xx/Kconfig" as S3C24XX_COMMON_CLK is selecting it's dependency.

CC: Ben Dooks <ben-linux@fluff.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
CC: Russell King <linux@arm.linux.org.uk>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-s3c24xx/Kconfig |   14 --------------
 drivers/clk/samsung/Kconfig   |    9 +++++++++
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index fbafb9a..e645ece 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -39,7 +39,6 @@ config CPU_S3C2410
 
 config CPU_S3C2412
 	bool "SAMSUNG S3C2412"
-	select COMMON_CLK
 	select CPU_ARM926T
 	select CPU_LLSERIAL_S3C2440
 	select S3C2412_COMMON_CLK
@@ -50,7 +49,6 @@ config CPU_S3C2412
 
 config CPU_S3C2416
 	bool "SAMSUNG S3C2416/S3C2450"
-	select COMMON_CLK
 	select CPU_ARM926T
 	select CPU_LLSERIAL_S3C2440
 	select S3C2416_PM if PM
@@ -88,7 +86,6 @@ config CPU_S3C244X
 
 config CPU_S3C2443
 	bool "SAMSUNG S3C2443"
-	select COMMON_CLK
 	select CPU_ARM920T
 	select CPU_LLSERIAL_S3C2440
 	select S3C2443_COMMON_CLK
@@ -364,11 +361,6 @@ config S3C2412_PM_SLEEP
 
 if CPU_S3C2412
 
-config S3C2412_COMMON_CLK
-	bool
-	help
-	  Build the s3c2412 clock driver based on the common clock framework.
-
 config CPU_S3C2412_ONLY
 	bool
 	depends on !CPU_S3C2410 && !CPU_S3C2416 && !CPU_S3C2440 && \
@@ -651,12 +643,6 @@ endif	# CPU_S3C2442
 
 if CPU_S3C2443 || CPU_S3C2416
 
-config S3C2443_COMMON_CLK
-	bool
-	help
-	  Temporary symbol to build the clock driver based on the common clock
-	  framework.
-
 config S3C2443_DMA
 	bool
 	help
diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index fc8696b..baf28cb 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -1,3 +1,12 @@
 config COMMON_CLK_SAMSUNG
 	bool
 	select COMMON_CLK
+
+config S3C2412_COMMON_CLK
+	bool
+	select COMMON_CLK_SAMSUNG
+
+config S3C2443_COMMON_CLK
+	bool
+	select COMMON_CLK_SAMSUNG
+
-- 
1.7.10.4
