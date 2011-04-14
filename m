From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 2/5] serial: s5pv210: Remove redundant console_initcall
Date: Thu, 14 Apr 2011 14:53:40 +0530
Message-ID: <1302773023-26524-3-git-send-email-thomas.ab@samsung.com>
References: <1302773023-26524-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61667 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757233Ab1DNJaU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2011 05:30:20 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJM00JHPXWOIW80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 18:19:37 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJM00GH3XWGFX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Apr 2011 18:19:36 +0900 (KST)
In-reply-to: <1302773023-26524-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

Uart port is registered as a console during the driver's probe.
So explict registration of console with console_initcall is
removed.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-of-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/tty/serial/s5pv210.c |    7 -------
 drivers/tty/serial/samsung.c |    3 ++-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv210.c
index 6ebccd7..cdee626 100644
--- a/drivers/tty/serial/s5pv210.c
+++ b/drivers/tty/serial/s5pv210.c
@@ -136,13 +136,6 @@ static struct platform_driver s5p_serial_driver = {
 	},
 };
 
-static int __init s5pv210_serial_console_init(void)
-{
-	return s3c24xx_serial_initconsole(&s5p_serial_driver, s5p_uart_inf);
-}
-
-console_initcall(s5pv210_serial_console_init);
-
 static int __init s5p_serial_init(void)
 {
 	return s3c24xx_serial_init(&s5p_serial_driver, *s5p_uart_inf);
diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 08e72a2..14a2e41 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1450,7 +1450,8 @@ static struct console s3c24xx_serial_console = {
 	.flags		= CON_PRINTBUFFER,
 	.index		= -1,
 	.write		= s3c24xx_serial_console_write,
-	.setup		= s3c24xx_serial_console_setup
+	.setup		= s3c24xx_serial_console_setup,
+	.data		= &s3c24xx_uart_drv,
 };
 
 int s3c24xx_serial_initconsole(struct platform_driver *drv,
-- 
1.6.6.rc2
