From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 05/23] tty: serial/samsung: fix modular build
Date: Tue,  5 Mar 2013 18:42:15 +0100
Message-ID: <1362505353-8873-6-git-send-email-arnd@arndb.de>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:54995 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757891Ab3CERmr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Mar 2013 12:42:47 -0500
In-Reply-To: <1362505353-8873-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>

There are a few bugs in the samsung serial driver when
built as a loadable module, which makes the console
code unavailable, as well as giving no access to
the 'printascii' early debug function. This adds
the appropriate compile time conditionals.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/tty/serial/samsung.c | 4 ++--
 drivers/tty/serial/samsung.h | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 729a60d..a3277ca 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -894,7 +894,7 @@ console_initcall(s3c24xx_serial_console_init);
 #define S3C24XX_SERIAL_CONSOLE NULL
 #endif
 
-#ifdef CONFIG_CONSOLE_POLL
+#if defined(CONFIG_SERIAL_SAMSUNG_CONSOLE) && defined(CONFIG_CONSOLE_POLL)
 static int s3c24xx_serial_get_poll_char(struct uart_port *port);
 static void s3c24xx_serial_put_poll_char(struct uart_port *port,
 			 unsigned char c);
@@ -918,7 +918,7 @@ static struct uart_ops s3c24xx_serial_ops = {
 	.request_port	= s3c24xx_serial_request_port,
 	.config_port	= s3c24xx_serial_config_port,
 	.verify_port	= s3c24xx_serial_verify_port,
-#ifdef CONFIG_CONSOLE_POLL
+#if defined(CONFIG_SERIAL_SAMSUNG_CONSOLE) && defined(CONFIG_CONSOLE_POLL)
 	.poll_get_char = s3c24xx_serial_get_poll_char,
 	.poll_put_char = s3c24xx_serial_put_poll_char,
 #endif
diff --git a/drivers/tty/serial/samsung.h b/drivers/tty/serial/samsung.h
index 1a4bca3..00a499e 100644
--- a/drivers/tty/serial/samsung.h
+++ b/drivers/tty/serial/samsung.h
@@ -76,7 +76,9 @@ struct s3c24xx_uart_port {
 #define wr_regb(port, reg, val) __raw_writeb(val, portaddr(port, reg))
 #define wr_regl(port, reg, val) __raw_writel(val, portaddr(port, reg))
 
-#ifdef CONFIG_SERIAL_SAMSUNG_DEBUG
+#if defined(CONFIG_SERIAL_SAMSUNG_DEBUG) && \
+    defined(CONFIG_DEBUG_LL) && \
+    !defined(MODULE)
 
 extern void printascii(const char *);
 
-- 
1.8.1.2
