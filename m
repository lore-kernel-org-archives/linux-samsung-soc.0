From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 4/6] ARM: SAMSUNG: Restore Samsung PM Debug functionality
Date: Tue, 24 Jun 2014 15:57:13 +0200
Message-ID: <1403618235-19353-5-git-send-email-t.figa@samsung.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Due to recently merged patches and previous merge conflicts, the Samsung
PM Debug functionality no longer can be enabled. This patch fixes
incorrect dependency of SAMSUNG_PM_DEBUG on an integer symbol and adds
missing header inclusion.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/plat-samsung/Kconfig    | 8 +++++++-
 arch/arm/plat-samsung/pm-debug.c | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 301b892..483c959 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -412,9 +412,14 @@ config S5P_DEV_MFC
 
 comment "Power management"
 
+config HAVE_SAMSUNG_PM_DEBUG
+	bool
+	help
+	  Allow compilation of Samsung PM debugging code.
+
 config SAMSUNG_PM_DEBUG
 	bool "S3C2410 PM Suspend debug"
-	depends on PM && DEBUG_KERNEL && DEBUG_S3C_UART
+	depends on PM && DEBUG_KERNEL && HAVE_SAMSUNG_PM_DEBUG
 	help
 	  Say Y here if you want verbose debugging from the PM Suspend and
 	  Resume code. See <file:Documentation/arm/Samsung-S3C24XX/Suspend.txt>
@@ -484,6 +489,7 @@ config S5P_SLEEP
 
 config DEBUG_S3C_UART
 	depends on PLAT_SAMSUNG
+	select HAVE_SAMSUNG_PM_DEBUG
 	int
 	default "0" if DEBUG_S3C_UART0
 	default "1" if DEBUG_S3C_UART1
diff --git a/arch/arm/plat-samsung/pm-debug.c b/arch/arm/plat-samsung/pm-debug.c
index 8f19f66..3960960 100644
--- a/arch/arm/plat-samsung/pm-debug.c
+++ b/arch/arm/plat-samsung/pm-debug.c
@@ -14,6 +14,7 @@
  */
 
 #include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
 #include <linux/io.h>
 
 #include <asm/mach/map.h>
-- 
1.9.3
