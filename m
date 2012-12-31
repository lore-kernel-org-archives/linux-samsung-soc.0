From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH] serial: samsung: remove redundant setting of line config during port reset
Date: Mon, 31 Dec 2012 13:42:45 -0800
Message-ID: <1356990165-3905-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gg0-f172.google.com ([209.85.161.172]:50154 "EHLO
	mail-gg0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859Ab2LaV6N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Dec 2012 16:58:13 -0500
Received: by mail-gg0-f172.google.com with SMTP id r1so2004681ggn.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Dec 2012 13:58:12 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org, alan@linux.intel.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

The setting of uart line control configuration in s3c24xx_serial_resetport
is can be removed since the 'set_termios' call will overwrite any ULCON
register setting which s3c24xx_serial_resetport does.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/tty/serial/samsung.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 12e5249..e514b3a 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1006,7 +1006,6 @@ static void s3c24xx_serial_resetport(struct uart_port *port,
 
 	ucon &= ucon_mask;
 	wr_regl(port, S3C2410_UCON,  ucon | cfg->ucon);
-	wr_regl(port, S3C2410_ULCON, cfg->ulcon);
 
 	/* reset both fifos */
 	wr_regl(port, S3C2410_UFCON, cfg->ufcon | S3C2410_UFCON_RESETBOTH);
-- 
1.7.5.4
