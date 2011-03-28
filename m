From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 5/5] serial: samsung: Keep a copy a pdev->dev.platform_data and
 use it
Date: Mon, 28 Mar 2011 16:37:40 +0530
Message-ID: <1301310460-20974-6-git-send-email-thomas.ab@samsung.com>
References: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40227 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752112Ab1C1LHx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2011 07:07:53 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIR00BO2LKT82A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:41 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIR00B5JLKIZA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 28 Mar 2011 20:07:41 +0900 (KST)
In-reply-to: <1301310460-20974-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

The driver depends on pdev->dev.platform_data to retrive information
about the platform data even after the initialization. To add device
tree support, this has to be changed in way that the platform data
is avialable from driver's private data. This patch adds support
for keeping a copy of the plaform data in s3c24xx_uart_info and using
it when needed after the initialization.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 drivers/tty/serial/s5pv210.c |   12 ++++++++++--
 drivers/tty/serial/samsung.c |   26 ++++++++++++++++++++------
 drivers/tty/serial/samsung.h |    3 +++
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv210.c
index cdee626..5010c8e 100644
--- a/drivers/tty/serial/s5pv210.c
+++ b/drivers/tty/serial/s5pv210.c
@@ -28,9 +28,13 @@
 static int s5pv210_serial_setsource(struct uart_port *port,
 					struct s3c24xx_uart_clksrc *clk)
 {
-	struct s3c2410_uartcfg *cfg = port->dev->platform_data;
+	struct s3c24xx_uart_port *ourport;
+	struct s3c2410_uartcfg *cfg;
 	unsigned long ucon = rd_regl(port, S3C2410_UCON);
 
+	ourport = container_of(port, struct s3c24xx_uart_port, port);
+	cfg = &ourport->info->cfg;
+
 	if ((cfg->clocks_size) == 1)
 		return 0;
 
@@ -51,9 +55,13 @@ static int s5pv210_serial_setsource(struct uart_port *port,
 static int s5pv210_serial_getsource(struct uart_port *port,
 					struct s3c24xx_uart_clksrc *clk)
 {
-	struct s3c2410_uartcfg *cfg = port->dev->platform_data;
+	struct s3c24xx_uart_port *ourport;
+	struct s3c2410_uartcfg *cfg;
 	u32 ucon = rd_regl(port, S3C2410_UCON);
 
+	ourport = container_of(port, struct s3c24xx_uart_port, port);
+	cfg = &ourport->info->cfg;
+
 	clk->divisor = 1;
 
 	if ((cfg->clocks_size) == 1)
diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 9d9d97c..aee4ec9 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -43,6 +43,7 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/cpufreq.h>
+#include <linux/slab.h>
 
 #include <asm/irq.h>
 
@@ -170,10 +171,13 @@ static inline struct s3c24xx_uart_info *s3c24xx_port_to_info(struct uart_port *p
 
 static inline struct s3c2410_uartcfg *s3c24xx_port_to_cfg(struct uart_port *port)
 {
+	struct s3c24xx_uart_port *ourport;
+
 	if (port->dev == NULL)
 		return NULL;
 
-	return (struct s3c2410_uartcfg *)port->dev->platform_data;
+	ourport = container_of(port, struct s3c24xx_uart_port, port);
+	return &ourport->info->cfg;
 }
 
 static int s3c24xx_serial_rx_fifocnt(struct s3c24xx_uart_port *ourport,
@@ -1054,7 +1058,7 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 				    struct platform_device *platdev)
 {
 	struct uart_port *port = &ourport->port;
-	struct s3c2410_uartcfg *cfg;
+	struct s3c2410_uartcfg *cfg = platdev->dev.platform_data;
 	struct resource *res;
 	int ret;
 
@@ -1063,7 +1067,9 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 	if (platdev == NULL)
 		return -ENODEV;
 
-	cfg = s3c24xx_dev_to_cfg(&platdev->dev);
+	/* setup info for port */
+	port->dev	= &platdev->dev;
+	ourport->info	= info;
 
 	if (port->mapbase != 0)
 		return 0;
@@ -1074,9 +1080,17 @@ static int s3c24xx_serial_init_port(struct s3c24xx_uart_port *ourport,
 		return -ERANGE;
 	}
 
-	/* setup info for port */
-	port->dev	= &platdev->dev;
-	ourport->info	= info;
+	memcpy((void *)&info->cfg, cfg, sizeof(struct s3c2410_uartcfg));
+
+	info->cfg.clocks = kzalloc(sizeof(struct s3c24xx_uart_clksrc) *
+				info->cfg.clocks_size, GFP_KERNEL);
+	if (!info->cfg.clocks)
+		return -ENOMEM;
+
+	memcpy(info->cfg.clocks, cfg->clocks, sizeof(struct s3c24xx_uart_clksrc)
+		* ourport->info->cfg.clocks_size);
+
+	cfg = &ourport->info->cfg;
 
 	/* copy the info in from provided structure */
 	ourport->port.fifosize = info->fifosize;
diff --git a/drivers/tty/serial/samsung.h b/drivers/tty/serial/samsung.h
index 0ac06a0..48a24d1 100644
--- a/drivers/tty/serial/samsung.h
+++ b/drivers/tty/serial/samsung.h
@@ -25,6 +25,9 @@ struct s3c24xx_uart_info {
 
 	unsigned int		has_divslot:1;
 
+	/* Copy of platform data */
+	struct s3c2410_uartcfg	cfg;
+
 	/* clock source control */
 
 	int (*get_clksrc)(struct uart_port *, struct s3c24xx_uart_clksrc *clk);
-- 
1.6.6.rc2
