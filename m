From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/8] ARM: S3C24XX: Specify audio codec platform_data for
 mini2440 board
Date: Thu, 04 Aug 2016 15:38:42 +0200
Message-ID: <1470317928-25365-3-git-send-email-s.nawrocki@samsung.com>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43534 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933618AbcHDNkV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 09:40:21 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBE013KD0GKDQE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 22:39:23 +0900 (KST)
In-reply-to: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

The L3 bus GPIOs are specified in the board file rather than through
the sound card's device platform_data. This allows to ensure the codec
driver doesn't get probed with uninitialized platform_data field of
its corresponding platform device.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-s3c24xx/mach-mini2440.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index a852168..13999c1 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -497,9 +497,28 @@ static struct i2c_board_info mini2440_i2c_devs[] __initdata = {
 	},
 };
 
+static struct uda134x_platform_data s3c24xx_uda134x = {
+	.l3 = {
+		.gpio_clk = S3C2410_GPB(4),
+		.gpio_data = S3C2410_GPB(3),
+		.gpio_mode = S3C2410_GPB(2),
+		.use_gpios = 1,
+		.data_hold = 1,
+		.data_setup = 1,
+		.clock_high = 1,
+		.mode_hold = 1,
+		.mode = 1,
+		.mode_setup = 1,
+	},
+	.model = UDA134X_UDA1341,
+};
+
 static struct platform_device uda1340_codec = {
 		.name = "uda134x-codec",
 		.id = -1,
+		.dev = {
+			.platform_data	= &s3c24xx_uda134x,
+		},
 };
 
 static struct platform_device *mini2440_devices[] __initdata = {
-- 
1.9.1
