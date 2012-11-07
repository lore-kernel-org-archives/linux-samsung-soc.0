From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 1/2] ARM: S3C24XX: Add clkdev entry for camif-upll clock
Date: Wed,  7 Nov 2012 23:00:56 +0100
Message-ID: <1352325657-28885-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:58543 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752793Ab2KGWBg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 17:01:36 -0500
Received: by mail-ee0-f46.google.com with SMTP id b15so1202502eek.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Nov 2012 14:01:34 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

The s3c-camif driver uses "camera" clock conn_id for the "camif-upll"
(s3c244x) and "camera" (s3c64xx) platform clock. By adding this new
clkdev entry the platform differences are isolated from the driver.

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 arch/arm/mach-s3c24xx/clock-s3c2440.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/clock-s3c2440.c b/arch/arm/mach-s3c24xx/clock-s3c2440.c
index 4407b17..04b87ec 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c2440.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c2440.c
@@ -161,6 +161,7 @@ static struct clk_lookup s3c2440_clk_lookup[] = {
 	CLKDEV_INIT(NULL, "clk_uart_baud1", &s3c24xx_uclk),
 	CLKDEV_INIT(NULL, "clk_uart_baud2", &clk_p),
 	CLKDEV_INIT(NULL, "clk_uart_baud3", &s3c2440_clk_fclk_n),
+	CLKDEV_INIT("s3c2440-camif", "camera", &s3c2440_clk_cam_upll),
 };
 
 static int __init_refok s3c2440_clk_add(struct device *dev, struct subsys_interface *sif)
-- 
1.7.4.1
