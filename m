From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 06/13] serial: samsung: add support for Exynos5420
Date: Thu,  6 Jun 2013 16:31:20 +0530
Message-ID: <1370516488-25860-6-git-send-email-chander.kashyap@linaro.org>
References: <1370516488-25860-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f49.google.com ([209.85.160.49]:61317 "EHLO
	mail-pb0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932358Ab3FFLCy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 07:02:54 -0400
Received: by mail-pb0-f49.google.com with SMTP id jt11so3077319pbb.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2013 04:02:54 -0700 (PDT)
In-Reply-To: <1370516488-25860-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, thomas.ab@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

The serial port used in Exynos5420 is similar to the serial ports used
in the other Exynos SoC. Hence, extend the serial driver support for
Exynos5420.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 drivers/tty/serial/samsung.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/samsung.c b/drivers/tty/serial/samsung.c
index 3cda4ed..841221c 100644
--- a/drivers/tty/serial/samsung.c
+++ b/drivers/tty/serial/samsung.c
@@ -1716,7 +1716,7 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
 
 #if defined(CONFIG_CPU_EXYNOS4210) || defined(CONFIG_SOC_EXYNOS4212) || \
 	defined(CONFIG_SOC_EXYNOS4412) || defined(CONFIG_SOC_EXYNOS5250) || \
-	defined(CONFIG_SOC_EXYNOS5440)
+	defined(CONFIG_SOC_EXYNOS5420) || defined(CONFIG_SOC_EXYNOS5440)
 static struct s3c24xx_serial_drv_data exynos4210_serial_drv_data = {
 	.info = &(struct s3c24xx_uart_info) {
 		.name		= "Samsung Exynos4 UART",
-- 
1.7.9.5
