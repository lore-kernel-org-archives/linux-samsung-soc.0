From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 5/5] ARM: s3c64xx: Kill CONFIG_PLAT_S3C64XX
Date: Sat, 28 Sep 2013 20:21:37 +0200
Message-ID: <1380392497-27406-5-git-send-email-tomasz.figa@gmail.com>
References: <1380392497-27406-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1380392497-27406-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

CONFIG_PLAT_S3C64XX has been kept in place way too long since it was
marked as temporary in commit

110d85a ARM: S3C64XX: Eliminate plat-s3c64xx

After fixing all users of it in previous patches, this patch finally
kills this temporary Kconfig entry.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/Kconfig              |  2 ++
 arch/arm/mach-s3c64xx/Kconfig | 11 -----------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index dc51f8a..40d5178 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -738,10 +738,12 @@ config ARCH_S3C64XX
 	select NEED_MACH_GPIO_H
 	select NO_IOPORT
 	select PLAT_SAMSUNG
+	select PM_GENERIC_DOMAINS
 	select S3C_DEV_NAND
 	select S3C_GPIO_TRACK
 	select SAMSUNG_ATAGS
 	select SAMSUNG_GPIOLIB_4BIT
+	select SAMSUNG_WAKEMASK
 	select SAMSUNG_WDT_RESET
 	select USB_ARCH_HAS_OHCI
 	help
diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 0e23910..2cb8dc5 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -5,17 +5,6 @@
 
 if ARCH_S3C64XX
 
-# temporary until we can eliminate all drivers using it.
-config PLAT_S3C64XX
-	bool
-	depends on ARCH_S3C64XX
-	default y
-	select PM_GENERIC_DOMAINS
-	select SAMSUNG_WAKEMASK
-	help
-	  Base platform code for any Samsung S3C64XX device
-
-
 # Configuration options for the S3C6410 CPU
 
 config CPU_S3C6400
-- 
1.8.3.2

