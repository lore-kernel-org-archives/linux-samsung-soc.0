From: Denis Kuzmenko <linux@solonet.org.ua>
Subject: [PATCH resend2] arm: s3c24xx: Add new LCD (W35i) support for Mini2440
 board
Date: Wed, 30 Nov 2011 10:21:15 +0200
Message-ID: <4ED5E77B.4090000@solonet.org.ua>
References: <4EC588A8.3030907@solonet.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:38455 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751522Ab1K3IWV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Nov 2011 03:22:21 -0500
In-Reply-To: <4EC588A8.3030907@solonet.org.ua>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Add new LCD (W35i) support for Mini2440 board

Signed-off-by: Denis Kuzmenko <linux@solonet.org.ua>
---

I need to refer this patch but can't find it on lkml.org
Maybe I haven't send it...
Sorry for bothering if I did so.

diff --git a/arch/arm/mach-s3c2440/mach-mini2440.c
b/arch/arm/mach-s3c2440/mach-mini2440.c
index fc2dc0b..951eadd 100644
--- a/arch/arm/mach-s3c2440/mach-mini2440.c
+++ b/arch/arm/mach-s3c2440/mach-mini2440.c
@@ -167,6 +167,24 @@ static struct s3c2410fb_display mini2440_lcd_cfg[]
__initdata = {
 		.lcdcon5	= (S3C2410_LCDCON5_FRM565 |
 				   S3C2410_LCDCON5_HWSWP),
 	},
+	/* mini2440 + 3.5" TFT (LCD-W35i, LQ035Q1DG06 type) + touchscreen*/
+	[3] = {
+		_LCD_DECLARE(
+			/* clock */
+			7,
+			/* xres, margin_right, margin_left, hsync */
+			320, 68, 66, 4,
+			/* yres, margin_top, margin_bottom, vsync */
+			240, 4, 4, 9,
+			/* refresh rate */
+			60),
+		.lcdcon5	= (S3C2410_LCDCON5_FRM565 |
+				   S3C2410_LCDCON5_INVVDEN |
+				   S3C2410_LCDCON5_INVVFRAME |
+				   S3C2410_LCDCON5_INVVLINE |
+				   S3C2410_LCDCON5_INVVCLK |
+				   S3C2410_LCDCON5_HWSWP),
+	},
 };
  /* todo - put into gpio header */
