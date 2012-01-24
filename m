From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Use IN4 DC measurement mode on Tobermory
Date: Tue, 24 Jan 2012 21:19:24 +0000
Message-ID: <1327439964-28533-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53181 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755844Ab2AXVT1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 16:19:27 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

The WM8962 on Tobermory has one of the IN4 inputs connected for DC
measurement. Tell the driver it can optimise for this mode.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---

This feature is going to be merged via ASoC in 3.4 - is it OK if I apply
this patch to the ASoC tree too?  It's a one liner, I'd be astonished if
it were to generate any conflicts.

 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 509307d..317f866 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -128,6 +128,7 @@ static struct wm8962_pdata wm8962_pdata __initdata = {
 		0x8000 | WM8962_GPIO_FN_DMICDAT,
 		WM8962_GPIO_FN_IRQ,    /* Open drain mode */
 	},
+	.in4_dc_measure = true,
 };
 
 static struct wm9081_pdata wm9081_pdata __initdata = {
-- 
1.7.9.rc1
