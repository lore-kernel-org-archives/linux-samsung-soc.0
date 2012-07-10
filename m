From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Don't specify an irq_base for WM1192-EV1 board
Date: Tue, 10 Jul 2012 12:44:31 +0100
Message-ID: <1341920671-8348-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48344 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753122Ab2GJLod (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jul 2012 07:44:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

None of the GPIO IRQs are connected so there is no reason to specify a
base.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-smdk6410.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smdk6410.c b/arch/arm/mach-s3c64xx/mach-smdk6410.c
index df3103d..0fe4f15 100644
--- a/arch/arm/mach-s3c64xx/mach-smdk6410.c
+++ b/arch/arm/mach-s3c64xx/mach-smdk6410.c
@@ -566,7 +566,6 @@ static struct wm831x_status_pdata wm1192_led8_pdata = {
 
 static struct wm831x_pdata smdk6410_wm1192_pdata = {
 	.pre_init = wm1192_pre_init,
-	.irq_base = IRQ_BOARD_START,
 
 	.backlight = &wm1192_backlight_pdata,
 	.dcdc = {
-- 
1.7.10
