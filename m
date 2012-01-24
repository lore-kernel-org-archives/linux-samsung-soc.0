From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 3/4] ARM: S3C6410: Use device names for both I2C clocks
Date: Tue, 24 Jan 2012 21:31:45 +0000
Message-ID: <1327440706-31915-3-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <20120124213127.GH1135@opensource.wolfsonmicro.com>
 <1327440706-31915-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50904 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757505Ab2AXVbv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 16:31:51 -0500
In-Reply-To: <1327440706-31915-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

When the S3C64xx CPUs were converted to clkdev mappings were added for the
I2C controllers on them. On S3C6410 a device name is specified for I2C
controller 1 but not for controller 0 which makes the code less robust as
we'll falsely return the clock for controller 0 if there's an error in the
request for controller 1.

Improve things by registering a device name for controller 0 as well. Due
to the fact that we change the numbering for controller 0 depending on if
we've registered controller 1 this requires an ifdef to choose the name.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/clock.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/clock.c b/arch/arm/mach-s3c64xx/clock.c
index 63f2c8a..52f079a 100644
--- a/arch/arm/mach-s3c64xx/clock.c
+++ b/arch/arm/mach-s3c64xx/clock.c
@@ -138,6 +138,11 @@ static struct clk init_clocks_off[] = {
 		.ctrlbit	= S3C_CLKCON_PCLK_TSADC,
 	}, {
 		.name		= "i2c",
+#ifdef CONFIG_S3C_DEV_I2C1
+		.devname        = "s3c2440-i2c.0",
+#else
+		.devname	= "s3c2440-i2c",
+#endif
 		.parent		= &clk_p,
 		.enable		= s3c64xx_pclk_ctrl,
 		.ctrlbit	= S3C_CLKCON_PCLK_IIC,
-- 
1.7.9.rc1
