From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH] serial: samsung: Fix serial config dependencies for exynos7
Date: Mon, 29 Sep 2014 10:46:57 +0530
Message-ID: <1411967817-8423-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31737 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751519AbaI2FRZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Sep 2014 01:17:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, jslaby@suse.cz, Pankaj Dubey <pankaj.dubey@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

Exynos7 has a similar serial controller to that present in older Samsung
SoCs. To re-use the existing serial driver on Exynos7 we need to have
SERIAL_SAMSUNG_UARTS_4 and SERIAL_SAMSUNG_UARTS selected. This is not
possible because these symbols are dependent on PLAT_SAMSUNG which is
not present for the ARMv8 based exynos7.

Change the dependency of these symbols from PLAT_SAMSUNG to the serial
driver thus making it available on exynos7. As the existing platform
specific code making use of these symbols is related to uart driver this
change in dependency should not cause any issues.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Build tested with s3c6400_defconfig, exynos_defconfig and arm64's defconfig
with and without the serial driver enabled.

 drivers/tty/serial/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 81f6ee7..e6c0bcb 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -249,14 +249,14 @@ config SERIAL_SAMSUNG
 
 config SERIAL_SAMSUNG_UARTS_4
 	bool
-	depends on PLAT_SAMSUNG
+	depends on SERIAL_SAMSUNG
 	default y if !(CPU_S3C2410 || CPU_S3C2412 || CPU_S3C2440 || CPU_S3C2442)
 	help
 	  Internal node for the common case of 4 Samsung compatible UARTs
 
 config SERIAL_SAMSUNG_UARTS
 	int
-	depends on PLAT_SAMSUNG
+	depends on SERIAL_SAMSUNG
 	default 4 if SERIAL_SAMSUNG_UARTS_4 || CPU_S3C2416
 	default 3
 	help
-- 
1.7.9.5
