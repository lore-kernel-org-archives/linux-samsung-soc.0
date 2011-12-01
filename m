From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS: Invert VCLK polarity for framebuffer on Origen board
Date: Thu,  1 Dec 2011 11:20:11 +0530
Message-ID: <1322718611-20934-4-git-send-email-tushar.behera@linaro.org>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:44545 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab1LAFwZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 00:52:25 -0500
Received: by ghrr1 with SMTP id r1so1472203ghr.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Nov 2011 21:52:25 -0800 (PST)
In-Reply-To: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Framebuffer driver needs to fetch the video data during the rising
edge of the VCLK. Otherwise, there are some glitches in the LCD
display.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index f56d027..38f0556 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -588,7 +588,8 @@ static struct s3c_fb_pd_win origen_fb_win0 = {
 static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
 	.win[0]		= &origen_fb_win0,
 	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB,
-	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.vidcon1	= VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC |
+				VIDCON1_INV_VCLK,
 	.setup_gpio	= exynos4_fimd0_gpio_setup_24bpp,
 };
 
-- 
1.7.4.1
