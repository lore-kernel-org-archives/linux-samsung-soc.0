From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] ARM: S3C64XX: Slow down mic detection rate for wm5102
Date: Thu, 28 Mar 2013 11:22:26 +0000
Message-ID: <1364469746-5026-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1364469746-5026-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50317 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752711Ab3C1LWc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Mar 2013 07:22:32 -0400
In-Reply-To: <1364469746-5026-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

A slightly slower rate provides more reliable jack detection during
slower insertions.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index bf3d1c0..a946b75 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -210,6 +210,7 @@ static struct arizona_pdata wm5102_reva_pdata = {
 	.gpio_base = CODEC_GPIO_BASE,
 	.irq_active_high = true,
 	.micd_pol_gpio = CODEC_GPIO_BASE + 4,
+	.micd_rate = 6,
 	.gpio_defaults = {
 		[2] = 0x10000, /* AIF3TXLRCLK */
 		[3] = 0x4,     /* OPCLK */
-- 
1.7.10.4
