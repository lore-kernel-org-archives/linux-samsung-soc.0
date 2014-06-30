From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 06/17] video: fbdev: s3c-fb: remove s5p64x0 related fimd codes
Date: Tue, 01 Jul 2014 06:32:16 +0900
Message-ID: <1404163947-3105-7-git-send-email-kgene.kim@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:62589 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864AbaF3NTR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:17 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z00B83GZULEB0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:06 +0900 (KST)
In-reply-to: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>

This patch removes fimd codes for s5p6440 and s5p6450 SoCs.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 .../devicetree/bindings/video/samsung-fimd.txt     |    1 -
 drivers/video/fbdev/Kconfig                        |    2 +-
 drivers/video/fbdev/s3c-fb.c                       |   30 --------------------
 3 files changed, 1 insertion(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/samsung-fimd.txt b/Documentation/devicetree/bindings/video/samsung-fimd.txt
index 2dad41b..741f4a6 100644
--- a/Documentation/devicetree/bindings/video/samsung-fimd.txt
+++ b/Documentation/devicetree/bindings/video/samsung-fimd.txt
@@ -8,7 +8,6 @@ Required properties:
 - compatible: value should be one of the following
 		"samsung,s3c2443-fimd"; /* for S3C24XX SoCs */
 		"samsung,s3c6400-fimd"; /* for S3C64XX SoCs */
-		"samsung,s5p6440-fimd"; /* for S5P64X0 SoCs */
 		"samsung,s5pc100-fimd"; /* for S5PC100 SoC  */
 		"samsung,s5pv210-fimd"; /* for S5PV210 SoC */
 		"samsung,exynos4210-fimd"; /* for Exynos4 SoCs */
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 59c98bfd..11506e5 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -2018,7 +2018,7 @@ config FB_TMIO_ACCELL
 
 config FB_S3C
 	tristate "Samsung S3C framebuffer support"
-	depends on FB && (CPU_S3C2416 || ARCH_S3C64XX || ARCH_S5P64X0 || \
+	depends on FB && (CPU_S3C2416 || ARCH_S3C64XX || \
 		ARCH_S5PC100 || ARCH_S5PV210 || ARCH_EXYNOS)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
diff --git a/drivers/video/fbdev/s3c-fb.c b/drivers/video/fbdev/s3c-fb.c
index 62acae2..a0cde41 100644
--- a/drivers/video/fbdev/s3c-fb.c
+++ b/drivers/video/fbdev/s3c-fb.c
@@ -1970,33 +1970,6 @@ static struct s3c_fb_driverdata s3c_fb_data_s3c2443 = {
 	},
 };
 
-static struct s3c_fb_driverdata s3c_fb_data_s5p64x0 = {
-	.variant = {
-		.nr_windows	= 3,
-		.vidtcon	= VIDTCON0,
-		.wincon		= WINCON(0),
-		.winmap		= WINxMAP(0),
-		.keycon		= WKEYCON,
-		.osd		= VIDOSD_BASE,
-		.osd_stride	= 16,
-		.buf_start	= VIDW_BUF_START(0),
-		.buf_size	= VIDW_BUF_SIZE(0),
-		.buf_end	= VIDW_BUF_END(0),
-
-		.palette = {
-			[0] = 0x2400,
-			[1] = 0x2800,
-			[2] = 0x2c00,
-		},
-
-		.has_blendcon	= 1,
-		.has_fixvclk	= 1,
-	},
-	.win[0] = &s3c_fb_data_s5p_wins[0],
-	.win[1] = &s3c_fb_data_s5p_wins[1],
-	.win[2] = &s3c_fb_data_s5p_wins[2],
-};
-
 static struct platform_device_id s3c_fb_driver_ids[] = {
 	{
 		.name		= "s3c-fb",
@@ -2016,9 +1989,6 @@ static struct platform_device_id s3c_fb_driver_ids[] = {
 	}, {
 		.name		= "s3c2443-fb",
 		.driver_data	= (unsigned long)&s3c_fb_data_s3c2443,
-	}, {
-		.name		= "s5p64x0-fb",
-		.driver_data	= (unsigned long)&s3c_fb_data_s5p64x0,
 	},
 	{},
 };
-- 
1.7.10.4
