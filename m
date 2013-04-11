From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH v3 05/10] i2c: s3c2410: make header file local
Date: Thu, 11 Apr 2013 23:37:20 +0200
Message-ID: <1365716245-99231-6-git-send-email-arnd@arndb.de>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365716245-99231-1-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

No other file in the kernel besides i2c-s3c2410.c uses the current
plat/regs-iic.h, so we can simply move the header file to live in the
same directory as the driver, as a preparation to multiplatform builds.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
---
 arch/arm/mach-s3c24xx/mach-rx1950.c                                    | 1 -
 arch/arm/plat-samsung/devs.c                                           | 1 -
 drivers/i2c/busses/i2c-s3c2410.c                                       | 3 ++-
 .../include/plat/regs-iic.h => drivers/i2c/busses/i2c-s3c2410.h        | 0
 4 files changed, 2 insertions(+), 3 deletions(-)
 rename arch/arm/plat-samsung/include/plat/regs-iic.h => drivers/i2c/busses/i2c-s3c2410.h (100%)

diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index 1f9ba2a..43f3ac5 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -56,7 +56,6 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/pm.h>
-#include <plat/regs-iic.h>
 #include <plat/regs-serial.h>
 
 #include "common.h"
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index de9ad27..5e37051 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -62,7 +62,6 @@
 #include <linux/platform_data/usb-s3c2410_udc.h>
 #include <linux/platform_data/usb-ohci-s3c2410.h>
 #include <plat/usb-phy.h>
-#include <plat/regs-iic.h>
 #include <plat/regs-serial.h>
 #include <plat/regs-spi.h>
 #include <linux/platform_data/spi-s3c64xx.h>
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f6b880b..d042ad0 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -42,9 +42,10 @@
 
 #include <asm/irq.h>
 
-#include <plat/regs-iic.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 
+#include "i2c-s3c2410.h"
+
 /* Treat S3C2410 as baseline hardware, anything else is supported via quirks */
 #define QUIRK_S3C2440		(1 << 0)
 #define QUIRK_HDMIPHY		(1 << 1)
diff --git a/arch/arm/plat-samsung/include/plat/regs-iic.h b/drivers/i2c/busses/i2c-s3c2410.h
similarity index 100%
rename from arch/arm/plat-samsung/include/plat/regs-iic.h
rename to drivers/i2c/busses/i2c-s3c2410.h
-- 
1.8.1.2
