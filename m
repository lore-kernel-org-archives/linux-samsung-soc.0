From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: inclusion export.h instead of module.h
Date: Tue, 15 Nov 2011 16:02:39 +0900
Message-ID: <1321340559-19827-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42828 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab1KOHWg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 02:22:36 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Only for THIS_MODULE, the <linux/export.h> file should be added
instead of <linux/module.h>.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    2 +-
 arch/arm/plat-s3c24xx/cpu-freq-debugfs.c     |    2 +-
 arch/arm/plat-samsung/pd.c                   |    2 +-
 arch/arm/plat-samsung/pwm.c                  |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 6666856..f208154 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -8,7 +8,7 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 
diff --git a/arch/arm/plat-s3c24xx/cpu-freq-debugfs.c b/arch/arm/plat-s3c24xx/cpu-freq-debugfs.c
index a927666..c7adad0 100644
--- a/arch/arm/plat-s3c24xx/cpu-freq-debugfs.c
+++ b/arch/arm/plat-s3c24xx/cpu-freq-debugfs.c
@@ -12,7 +12,7 @@
 */
 
 #include <linux/init.h>
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/cpufreq.h>
diff --git a/arch/arm/plat-samsung/pd.c b/arch/arm/plat-samsung/pd.c
index efe1d56..312b510 100644
--- a/arch/arm/plat-samsung/pd.c
+++ b/arch/arm/plat-samsung/pd.c
@@ -11,7 +11,7 @@
 */
 
 #include <linux/init.h>
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/pm_runtime.h>
diff --git a/arch/arm/plat-samsung/pwm.c b/arch/arm/plat-samsung/pwm.c
index dc1185d..c559d84 100644
--- a/arch/arm/plat-samsung/pwm.c
+++ b/arch/arm/plat-samsung/pwm.c
@@ -11,7 +11,7 @@
  * the Free Software Foundation; either version 2 of the License.
 */
 
-#include <linux/module.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-- 
1.7.1
