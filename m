From: Yadwinder Singh Brar <yadi.brar@samsung.com>
Subject: [PATCH 1/2] ARM: SAMSUNG: pm: Save/restore only selected uart's
 registers
Date: Sun, 14 Jul 2013 18:17:00 +0530
Message-ID: <1373806020-7336-3-git-send-email-yadi.brar@samsung.com>
References: <1373806020-7336-1-git-send-email-yadi.brar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:65322 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756699Ab3GWM6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 08:58:03 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQE00AE140PJO40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Jul 2013 21:58:01 +0900 (KST)
In-reply-to: <1373806020-7336-1-git-send-email-yadi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, olof@lixom.net, dianders@chromium.org, thomas.abraham@linaro.org, t.figa@samsung.com, yadi.brar01@gmail.com, Yadwinder Singh Brar <yadi.brar@samsung.com>

Basically this code gets executed only during debugging i.e when DEBUG_LL &
SAMSUNG_PM_DEBUG is on, so required only for UART used for debugging.
Since we are removing static iodesc entries for UARTs, so now only the selected
(CONFIG_DEBUG_S3C_UART) UART will be ioremapped by the debug_ll_io_init() for
DEBUG_LL, so save/restore uart registers only for selected uart.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 arch/arm/plat-samsung/pm.c |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index ea36136..d0c2301 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -80,7 +80,7 @@ unsigned char pm_uart_udivslot;
 
 #ifdef CONFIG_SAMSUNG_PM_DEBUG
 
-static struct pm_uart_save uart_save[CONFIG_SERIAL_SAMSUNG_UARTS];
+static struct pm_uart_save uart_save;
 
 static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
 {
@@ -101,11 +101,7 @@ static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
 
 static void s3c_pm_save_uarts(void)
 {
-	struct pm_uart_save *save = uart_save;
-	unsigned int uart;
-
-	for (uart = 0; uart < CONFIG_SERIAL_SAMSUNG_UARTS; uart++, save++)
-		s3c_pm_save_uart(uart, save);
+	s3c_pm_save_uart(CONFIG_DEBUG_S3C_UART, &uart_save);
 }
 
 static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save *save)
@@ -126,11 +122,7 @@ static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save *save)
 
 static void s3c_pm_restore_uarts(void)
 {
-	struct pm_uart_save *save = uart_save;
-	unsigned int uart;
-
-	for (uart = 0; uart < CONFIG_SERIAL_SAMSUNG_UARTS; uart++, save++)
-		s3c_pm_restore_uart(uart, save);
+	s3c_pm_restore_uart(CONFIG_DEBUG_S3C_UART, &uart_save);
 }
 #else
 static void s3c_pm_save_uarts(void) { }
-- 
1.7.0.4
