From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 21/26] ARM: S3C64XX: make crag6410.h local
Date: Wed, 02 Jan 2013 14:23:58 -0800
Message-ID: <1357165443-3716-22-git-send-email-kgene.kim@samsung.com>
References: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27556 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752206Ab3ABWZB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:25:01 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG000LLVRKZPW30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:25:00 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG00028PRKVD920@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:25:00 +0900 (KST)
In-reply-to: <1357165443-3716-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

The header can be local in mach-s3c64xx/.

Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c64xx/{include/mach => }/crag6410.h |    0
 arch/arm/mach-s3c64xx/mach-crag6410-module.c        |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c               |    2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/mach-s3c64xx/{include/mach => }/crag6410.h (100%)

diff --git a/arch/arm/mach-s3c64xx/include/mach/crag6410.h b/arch/arm/mach-s3c64xx/crag6410.h
similarity index 100%
rename from arch/arm/mach-s3c64xx/include/mach/crag6410.h
rename to arch/arm/mach-s3c64xx/crag6410.h
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index c6d8dba..6e3d717 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -29,7 +29,7 @@
 
 #include <linux/platform_data/spi-s3c64xx.h>
 
-#include <mach/crag6410.h>
+#include "crag6410.h"
 
 static struct s3c64xx_spi_csinfo wm0010_spi_csinfo = {
 	.line = S3C64XX_GPC(3),
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index cdde249..d559969 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -53,7 +53,6 @@
 #include <mach/regs-sys.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-modem.h>
-#include <mach/crag6410.h>
 
 #include <mach/regs-gpio-memport.h>
 
@@ -72,6 +71,7 @@
 #include <plat/pm.h>
 
 #include "common.h"
+#include "crag6410.h"
 
 /* serial port setup */
 
-- 
1.7.10.4
