From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] serial: samsung: Fix build error
Date: Thu, 28 Jul 2011 08:50:38 +0900
Message-ID: <1311810638-27986-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41376 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752353Ab1G1AEn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 20:04:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@suse.de>

drivers/tty/serial/samsung.c: In function 's3c24xx_serial_init':
drivers/tty/serial/samsung.c:1237: error: lvalue required as unary '&' operand

Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/tty/serial/samsung.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index afc6294..6edafb5 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1225,15 +1225,19 @@ static const struct dev_pm_ops s3c24xx_serial_pm_ops = {
 	.suspend = s3c24xx_serial_suspend,
 	.resume = s3c24xx_serial_resume,
 };
+#define SERIAL_SAMSUNG_PM_OPS	(&s3c24xx_serial_pm_ops)
+
 #else /* !CONFIG_PM_SLEEP */
-#define s3c24xx_serial_pm_ops	NULL
+
+#define SERIAL_SAMSUNG_PM_OPS	NULL
 #endif /* CONFIG_PM_SLEEP */
 
 int s3c24xx_serial_init(struct platform_driver *drv,
 			struct s3c24xx_uart_info *info)
 {
 	dbg("s3c24xx_serial_init(%p,%p)\n", drv, info);
-	drv->driver.pm = &s3c24xx_serial_pm_ops;
+
+	drv->driver.pm = SERIAL_SAMSUNG_PM_OPS;
 
 	return platform_driver_register(drv);
 }
-- 
1.7.1
