From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 10/23] [media] exynos: remove unnecessary header inclusions
Date: Tue,  5 Mar 2013 18:42:20 +0100
Message-ID: <1362505353-8873-11-git-send-email-arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:58436 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753992Ab3CERm5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 12:42:57 -0500
In-Reply-To: <1362505353-8873-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

In multiplatform configurations, we cannot include headers
provided by only the exynos platform. Fortunately a number
of drivers that include those headers do not actually need
them, so we can just remove the inclusions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/exynos-gsc/gsc-regs.c | 1 -
 drivers/media/platform/s5p-tv/sii9234_drv.c  | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-regs.c b/drivers/media/platform/exynos-gsc/gsc-regs.c
index 6f5b5a4..e22d147 100644
--- a/drivers/media/platform/exynos-gsc/gsc-regs.c
+++ b/drivers/media/platform/exynos-gsc/gsc-regs.c
@@ -12,7 +12,6 @@
 
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <mach/map.h>
 
 #include "gsc-core.h"
 
diff --git a/drivers/media/platform/s5p-tv/sii9234_drv.c b/drivers/media/platform/s5p-tv/sii9234_drv.c
index d90d228..39b77d2 100644
--- a/drivers/media/platform/s5p-tv/sii9234_drv.c
+++ b/drivers/media/platform/s5p-tv/sii9234_drv.c
@@ -23,9 +23,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 
-#include <mach/gpio.h>
-#include <plat/gpio-cfg.h>
-
 #include <media/sii9234.h>
 #include <media/v4l2-subdev.h>
 
-- 
1.8.1.2
