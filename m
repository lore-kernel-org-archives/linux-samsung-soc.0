From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 3/3] serial: samsung: improve code clarity by defining a
 variable
Date: Mon, 14 Jul 2014 17:07:18 +0530
Message-ID: <1405337838-30335-4-git-send-email-ch.naveen@samsung.com>
References: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61148 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755437AbaGNLlM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 07:41:12 -0400
In-reply-to: <1405337838-30335-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, ben-linux@fluff.org, cpgs@samsung.com

The of_node is derived from pdev for every usage, define a
device_node variable instead.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: gregkh@linuxfoundation.org
---
 drivers/tty/serial/samsung.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index d98f93d..4aff02d 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1269,12 +1269,13 @@ static inline struct s3c24xx_serial_drv_data *s3c24xx_get_driver_data(
 
 static int s3c24xx_serial_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct s3c24xx_uart_port *ourport;
 	int index = probe_index;
 	int ret;
 
-	if (pdev->dev.of_node) {
-		ret = of_alias_get_id(pdev->dev.of_node, "serial");
+	if (np) {
+		ret = of_alias_get_id(np, "serial");
 		if (ret >= 0)
 			index = ret;
 	}
@@ -1295,8 +1296,8 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
 			dev_get_platdata(&pdev->dev) :
 			ourport->drv_data->def_cfg;
 
-	if (pdev->dev.of_node)
-		of_property_read_u32(pdev->dev.of_node,
+	if (np)
+		of_property_read_u32(np,
 			"samsung,uart-fifosize", &ourport->port.fifosize);
 
 	if (!ourport->port.fifosize) {
-- 
1.7.9.5
