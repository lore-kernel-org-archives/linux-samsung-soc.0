From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v2] serial: samsung: Fix serial config dependencies for exynos7
Date: Wed, 19 Nov 2014 13:26:52 +0530
Message-ID: <1416383812-714-1-git-send-email-a.kesavan@samsung.com>
References: <1416199491-4841-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18755 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932146AbaKSH5j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Nov 2014 02:57:39 -0500
In-reply-to: <1416199491-4841-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, kgene@kernel.org, kgene.kim@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, jslaby@suse.cz, kesavan.abhilash@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>

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
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Changes in v2:
	- Added Greg's ack and Kukjin Kim as a recepient

 drivers/tty/serial/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index e71a28b..d0ce88c 100644
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
