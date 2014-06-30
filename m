From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 12/17] serial: samsung: no more support for S5PC100 SoC
Date: Tue, 01 Jul 2014 06:32:22 +0900
Message-ID: <1404163947-3105-13-git-send-email-kgene.kim@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31178 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753195AbaF3NTR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:17 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z00817GZV2Z20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:07 +0900 (KST)
In-reply-to: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This patch removes s5pc100 related serial.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/samsung.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 39b1219..36c7747 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1712,8 +1712,7 @@ static struct s3c24xx_serial_drv_data s3c2440_serial_drv_data = {
 #define S3C2440_SERIAL_DRV_DATA (kernel_ulong_t)NULL
 #endif
 
-#if defined(CONFIG_CPU_S3C6400) || defined(CONFIG_CPU_S3C6410) || \
-	defined(CONFIG_CPU_S5PC100)
+#if defined(CONFIG_CPU_S3C6400) || defined(CONFIG_CPU_S3C6410)
 static struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
 	.info = &(struct s3c24xx_uart_info) {
 		.name		= "Samsung S3C6400 UART",
-- 
1.7.10.4
