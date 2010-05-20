From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 1/3] [WATCHDOG] s3c2410_wdt - Add extra option to include watchdog for Samsung SoCs
Date: Thu, 20 May 2010 19:28:29 +0900
Message-ID: <1274351311-6879-2-git-send-email-kgene.kim@samsung.com>
References: <1274351311-6879-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:36974 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754686Ab0EWWtU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 May 2010 18:49:20 -0400
In-Reply-To: <1274351311-6879-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Wim Van Sebroeck <wim@iguana.be>, Banajit Goswami <banajit.g@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Banajit Goswami <banajit.g@samsung.com>

This patch adds HAVE_S3C2410_WATCHDOG to control inclusion of watchdog driver
for Samsung SoCs. This option will help to include the driver only for the
necessary machines and not for all for any given arch.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Acked-by: Ben Dooks <ben-linux@fluff.org>
---
 drivers/watchdog/Kconfig |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0bf5020..c232146 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -145,13 +145,19 @@ config KS8695_WATCHDOG
 	  Watchdog timer embedded into KS8695 processor. This will reboot your
 	  system when the timeout is reached.
 
+config HAVE_S3C2410_WATCHDOG
+	bool
+	help
+	  This will include watchdog timer support for Samsung SoCs. If
+	  you want to include watchdog support for any machine, kindly
+	  select this in the respective mach-XXXX/Kconfig file.
+
 config S3C2410_WATCHDOG
 	tristate "S3C2410 Watchdog"
-	depends on ARCH_S3C2410
+	depends on ARCH_S3C2410 || HAVE_S3C2410_WATCHDOG
 	help
-	  Watchdog timer block in the Samsung S3C2410 chips. This will
-	  reboot the system when the timer expires with the watchdog
-	  enabled.
+	  Watchdog timer block in the Samsung SoCs. This will reboot
+	  the system when the timer expires with the watchdog enabled.
 
 	  The driver is limited by the speed of the system's PCLK
 	  signal, so with reasonably fast systems (PCLK around 50-66MHz)
-- 
1.6.5.2
