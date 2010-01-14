From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S3C: serial: Modify console initialization.
Date: Thu, 14 Jan 2010 15:05:38 +0900
Message-ID: <1263449138-8199-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53434 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837Ab0ANGOE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2010 01:14:04 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>

This patch modifies s3c24xx_serial_initconsole function to accept multiple
platform UART information structures. This is required on platforms that have
differences among the instances of UART ports. As an example, the FIFO sizes
could be different for each UART instance and hence multiple platform UART
information structures would be needed.

This patch also modifies the s3c24xx_console_init macro since it wraps the
call to the s3c24xx_serial_initconsole function.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/serial/samsung.c |    6 +++---
 drivers/serial/samsung.h |   19 ++++++++++++-------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
index 52e3df1..6982243 100644
--- a/drivers/serial/samsung.c
+++ b/drivers/serial/samsung.c
@@ -1374,7 +1374,7 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
  * data.
 */

-static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info *info)
+static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info **info)
 {
 	struct s3c24xx_uart_port *ptr = s3c24xx_serial_ports;
 	struct platform_device **platdev_ptr;
@@ -1385,7 +1385,7 @@ static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info *info)
 	platdev_ptr = s3c24xx_uart_devs;

 	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++, ptr++, platdev_ptr++) {
-		s3c24xx_serial_init_port(ptr, info, *platdev_ptr);
+		s3c24xx_serial_init_port(ptr, info[i], *platdev_ptr);
 	}

 	return 0;
@@ -1451,7 +1451,7 @@ static struct console s3c24xx_serial_console = {
 };

 int s3c24xx_serial_initconsole(struct platform_driver *drv,
-			       struct s3c24xx_uart_info *info)
+			       struct s3c24xx_uart_info **info)

 {
 	struct platform_device *dev = s3c24xx_uart_devs[0];
diff --git a/drivers/serial/samsung.h b/drivers/serial/samsung.h
index 1fb2234..0ac06a0 100644
--- a/drivers/serial/samsung.h
+++ b/drivers/serial/samsung.h
@@ -75,19 +75,24 @@ extern int s3c24xx_serial_probe(struct platform_device *dev,
 extern int __devexit s3c24xx_serial_remove(struct platform_device *dev);

 extern int s3c24xx_serial_initconsole(struct platform_driver *drv,
-				      struct s3c24xx_uart_info *uart);
+				      struct s3c24xx_uart_info **uart);

 extern int s3c24xx_serial_init(struct platform_driver *drv,
 			       struct s3c24xx_uart_info *info);

 #ifdef CONFIG_SERIAL_SAMSUNG_CONSOLE

-#define s3c24xx_console_init(__drv, __inf)			\
-static int __init s3c_serial_console_init(void)			\
-{								\
-	return s3c24xx_serial_initconsole(__drv, __inf);	\
-}								\
-								\
+#define s3c24xx_console_init(__drv, __inf)				\
+static int __init s3c_serial_console_init(void)				\
+{									\
+	struct s3c24xx_uart_info *uinfo[CONFIG_SERIAL_SAMSUNG_UARTS];	\
+	int i;								\
+									\
+	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++)		\
+		uinfo[i] = __inf;					\
+	return s3c24xx_serial_initconsole(__drv, uinfo);		\
+}									\
+									\
 console_initcall(s3c_serial_console_init)

 #else
--
1.6.3.3
