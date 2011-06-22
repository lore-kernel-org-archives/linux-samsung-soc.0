From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] tty: s5pv210: Add delay loop on fifo reset function for UART
Date: Wed, 22 Jun 2011 17:50:25 +0900
Message-ID: <1308732625-19847-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53916 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963Ab1FVJBr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2011 05:01:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Jongpill Lee <boyko.lee@samsung.com>, Jaecheol Lee <jc.lee@samsung.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kukjin Kim <kgene.kim@samsung.com>

From: Jongpill Lee <boyko.lee@samsung.com>

This patch addes delay loop on fifo reset function for UART.
On high speed freq, it needs delay function when fifo reset.
If not, system will hang by this uart reset problem when resuming
from suspend mode.

Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/tty/serial/s5pv210.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/tty/serial/s5pv210.c b/drivers/tty/serial/s5pv210.c
index fb2619f..dce6cb3 100644
--- a/drivers/tty/serial/s5pv210.c
+++ b/drivers/tty/serial/s5pv210.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <linux/serial.h>
+#include <linux/delay.h>
 
 #include <asm/irq.h>
 #include <mach/hardware.h>
@@ -83,6 +84,9 @@ static int s5pv210_serial_resetport(struct uart_port *port,
 	wr_regl(port, S3C2410_UFCON, cfg->ufcon | S3C2410_UFCON_RESETBOTH);
 	wr_regl(port, S3C2410_UFCON, cfg->ufcon);
 
+	/* It is need to delay When reset FIFO register */
+	udelay(1);
+
 	return 0;
 }
 
-- 
1.7.1
