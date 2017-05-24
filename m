From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: s3c64xx: don't select ARM_AMBA from S3C64XX_PL080
Date: Wed, 24 May 2017 17:58:34 +0200
Message-ID: <20170524155845.1778223-1-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:61773 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758434AbdEXP73 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 May 2017 11:59:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Anholt <eric@anholt.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

While trying a fix a build warning unrelated to s3c64xx, I ran into
a circular dependency:

drivers/i2c/Kconfig:7: symbol I2C is selected by FB_DDC
drivers/video/fbdev/Kconfig:63: symbol FB_DDC is selected by FB_CYBER2000_DDC
drivers/video/fbdev/Kconfig:381: symbol FB_CYBER2000_DDC depends on FB_CYBER2000
drivers/video/fbdev/Kconfig:369: symbol FB_CYBER2000 depends on FB
drivers/video/fbdev/Kconfig:5: symbol FB is selected by DRM_KMS_FB_HELPER
drivers/gpu/drm/Kconfig:72: symbol DRM_KMS_FB_HELPER is selected by DRM_KMS_CMA_HELPER
drivers/gpu/drm/Kconfig:137: symbol DRM_KMS_CMA_HELPER is selected by DRM_PL111
drivers/gpu/drm/pl111/Kconfig:1: symbol DRM_PL111 depends on ARM_AMBA
drivers/amba/Kconfig:1: symbol ARM_AMBA is selected by S3C64XX_PL080
arch/arm/mach-s3c64xx/Kconfig:42: symbol S3C64XX_PL080 default value contains DMADEVICES
drivers/dma/Kconfig:5: symbol DMADEVICES is selected by SND_SOC_SH4_SIU
sound/soc/sh/Kconfig:29: symbol SND_SOC_SH4_SIU is selected by SND_SIU_MIGOR
sound/soc/sh/Kconfig:59: symbol SND_SIU_MIGOR depends on I2C

The I2C and FB dependencies are hard to untangle, but I notice that
S3C64XX_PL080 selecting ARM_AMBA is one piece of the puzzle that
can easily be avoided, as ARCH_S3C64XX already select ARM_AMBA.
Removing the redundant 'select' now can help us in the future if we
run into a variation of the same dependency.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Please apply this to the samsung tree
---
 arch/arm/mach-s3c64xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/Kconfig b/arch/arm/mach-s3c64xx/Kconfig
index 459214fa20b4..5ee5ad74a3d6 100644
--- a/arch/arm/mach-s3c64xx/Kconfig
+++ b/arch/arm/mach-s3c64xx/Kconfig
@@ -40,7 +40,6 @@ config CPU_S3C6410
 
 config S3C64XX_PL080
 	def_bool DMADEVICES
-	select ARM_AMBA
 	select AMBA_PL08X
 
 config S3C64XX_SETUP_SDHCI
-- 
2.9.0
