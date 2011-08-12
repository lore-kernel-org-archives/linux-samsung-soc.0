From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] ARM: S3C64XX: Fix build break in PM debug
Date: Fri, 12 Aug 2011 15:55:54 +0530
Message-ID: <1313144754-30485-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17728 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041Ab1HLKY7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:24:59 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT003ON8XMG8S0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:24:58 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00ED58XH0A@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:24:58 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

When S3C_PM_DEBUG_LED_SMDK is enabled for suspend/resume debugging, the following
compilation error occurs:

arch/arm/mach-s3c64xx/pm.c: In function 's3c_pm_debug_smdkled':
arch/arm/mach-s3c64xx/pm.c:41: error: implicit declaration of function 'gpio_set_value'
arch/arm/mach-s3c64xx/pm.c:41: error: implicit declaration of function 'S3C64XX_GPN'
arch/arm/mach-s3c64xx/pm.c: In function 's3c64xx_pm_init':
arch/arm/mach-s3c64xx/pm.c:184: error: implicit declaration of function 'gpio_request'
arch/arm/mach-s3c64xx/pm.c:188: error: implicit declaration of function 'gpio_direction_output'

Fix the error by including linux/gpio.h

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-s3c64xx/pm.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index 8bad643..055e285 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -16,6 +16,7 @@
 #include <linux/suspend.h>
 #include <linux/serial_core.h>
 #include <linux/io.h>
+#include <linux/gpio.h>
 
 #include <mach/map.h>
 #include <mach/irqs.h>
-- 
1.6.6.1
