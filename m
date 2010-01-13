From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] S3C: serial: Modify UART low-level debug port initialization procedure.
Date: Wed, 13 Jan 2010 09:10:20 +0900
Message-ID: <1263341420-10771-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47365 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab0AMANv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 19:13:51 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Thomas Abraham <thomas.ab@samsung.com>

The s3c24xx_serial_init_ports function is called only during low-level
debug port initialization. This function intializes all the available
uart ports when called, but it can be reduced to initializing just the
port needed for debug message output.

This patch modifies the s3c24xx_serial_init_ports to initialize only the
uart port that will be used for low-level debug output. The UART port
that is used for low-level debug output is found from the config option
S3C_LOWLEVEL_UART_PORT.

Since the functionlity of the s3c24xx_serial_init_ports function has
changed, it has been renamed as s3c24xx_serial_init_console_port by
this patch.

This patch is required on platforms that use different platform
configuration for available instances of UART module. For instance,
FIFO sizes could be different for each instance of UART. Such platforms
pass mutiple instances of platform configuration to the serial driver
instead of just one. The serial console init can then be specified as
below in the platform specific code.

s3c24xx_console_init(&s5p_serial_drv, \
	&s5p_uart_inf[CONFIG_S3C_LOWLEVEL_UART_PORT]);

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/serial/samsung.c |   22 ++++++++++------------
 1 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/serial/samsung.c b/drivers/serial/samsung.c
index 52e3df1..dc9c51e 100644
--- a/drivers/serial/samsung.c
+++ b/drivers/serial/samsung.c
@@ -1368,26 +1368,24 @@ s3c24xx_serial_get_options(struct uart_port *port, int *baud,
 
 }
 
-/* s3c24xx_serial_init_ports
+/* s3c24xx_serial_init_console_port
  *
- * initialise the serial ports from the machine provided initialisation
- * data.
+ * initialise the serial port, which used as console, from the machine 
+ * provided initialisation data.
 */
 
-static int s3c24xx_serial_init_ports(struct s3c24xx_uart_info *info)
+static int s3c24xx_serial_init_console_port(struct s3c24xx_uart_info *info)
 {
 	struct s3c24xx_uart_port *ptr = s3c24xx_serial_ports;
 	struct platform_device **platdev_ptr;
-	int i;
 
-	dbg("s3c24xx_serial_init_ports: initialising ports...\n");
+	dbg("s3c24xx_serial_init_console_port: initialising ports...\n");
 
 	platdev_ptr = s3c24xx_uart_devs;
-
-	for (i = 0; i < CONFIG_SERIAL_SAMSUNG_UARTS; i++, ptr++, platdev_ptr++) {
-		s3c24xx_serial_init_port(ptr, info, *platdev_ptr);
-	}
-
+	ptr += CONFIG_S3C_LOWLEVEL_UART_PORT;
+	platdev_ptr += CONFIG_S3C_LOWLEVEL_UART_PORT;
+	
+	s3c24xx_serial_init_port(ptr, info, *platdev_ptr);
 	return 0;
 }
 
@@ -1469,7 +1467,7 @@ int s3c24xx_serial_initconsole(struct platform_driver *drv,
 		return 0;
 
 	s3c24xx_serial_console.data = &s3c24xx_uart_drv;
-	s3c24xx_serial_init_ports(info);
+	s3c24xx_serial_init_console_port(info);
 
 	register_console(&s3c24xx_serial_console);
 	return 0;
-- 
1.6.3.3
