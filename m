From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Build ChromeOS EC drivers as modules
Date: Tue, 17 Nov 2015 12:58:44 -0300
Message-ID: <1447775924-2189-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:57994 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751163AbbKQP66 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2015 10:58:58 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Kukjin Kim <kgene@kernel.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>

Since the multi_v7_defconfig is used to build an image for different
platforms, the options should be enabled as module whenever possible.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
The patch was tested on an Exynos5800 Peach Pi Chromebook
and the drivers' modules were correctly autoloaded.

 arch/arm/configs/multi_v7_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 69a22fdb52a5..a38a1b0f2657 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -241,7 +241,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_TEGRA=y
 CONFIG_KEYBOARD_SPEAR=y
 CONFIG_KEYBOARD_ST_KEYSCAN=y
-CONFIG_KEYBOARD_CROS_EC=y
+CONFIG_KEYBOARD_CROS_EC=m
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_MOUSE_CYAPA=m
 CONFIG_MOUSE_ELAN_I2C=y
@@ -397,9 +397,9 @@ CONFIG_MFD_AS3722=y
 CONFIG_MFD_ATMEL_FLEXCOM=y
 CONFIG_MFD_BCM590XX=y
 CONFIG_MFD_AXP20X=y
-CONFIG_MFD_CROS_EC=y
+CONFIG_MFD_CROS_EC=m
 CONFIG_MFD_CROS_EC_I2C=m
-CONFIG_MFD_CROS_EC_SPI=y
+CONFIG_MFD_CROS_EC_SPI=m
 CONFIG_MFD_MAX14577=y
 CONFIG_MFD_MAX77686=y
 CONFIG_MFD_MAX77693=y
-- 
2.4.3
