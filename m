From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: s3c24xx: get rid of unneeded selects
Date: Sun, 09 Feb 2014 15:51:05 +0100
Message-ID: <1391957465.25424.14.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Commit c67d0f29262b ("ARM: s3c24xx: get rid of custom <mach/gpio.h>")
got rid of the Kconfig symbols S3C24XX_GPIO_EXTRA64 and
S3C24XX_GPIO_EXTRA128. It missed one select of both of these symbols, so
get rid of those now.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested.

 arch/arm/mach-s3c24xx/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index d876431..bb1fa603 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -521,7 +521,6 @@ config MACH_ANUBIS
 	select HAVE_PATA_PLATFORM
 	select S3C2440_XTAL_12000000
 	select S3C24XX_DCLK
-	select S3C24XX_GPIO_EXTRA64
 	select S3C24XX_SIMTEC_PM if PM
 	select S3C_DEV_USB_HOST
 	help
@@ -562,7 +561,6 @@ config MACH_OSIRIS
 	select S3C2410_IOTIMING if ARM_S3C2440_CPUFREQ
 	select S3C2440_XTAL_12000000
 	select S3C24XX_DCLK
-	select S3C24XX_GPIO_EXTRA128
 	select S3C24XX_SIMTEC_PM if PM
 	select S3C_DEV_NAND
 	select S3C_DEV_USB_HOST
-- 
1.8.5.3
