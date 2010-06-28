From: Pawel Osciak <p.osciak@samsung.com>
Subject: [PATCH v3 11/12] s3c-fb: fix section mismatch
Date: Mon, 28 Jun 2010 10:08:57 +0200
Message-ID: <1277712538-23188-12-git-send-email-p.osciak@samsung.com>
References: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:55858 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755348Ab0F1IJM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jun 2010 04:09:12 -0400
In-reply-to: <1277712538-23188-1-git-send-email-p.osciak@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

From: Marek Szyprowski <m.szyprowski@samsung.com>

This patch fixes the following section mismatch errors:

WARNING: vmlinux.o(.data+0x20b40): Section mismatch in reference from the variable s3c_fb_driver_ids to the (unknown reference) .devinit.data:(unknown)
The variable s3c_fb_driver_ids references
the (unknown reference) __devinitdata (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

WARNING: vmlinux.o(.data+0x20b58): Section mismatch in reference from the variable s3c_fb_driver_ids to the (unknown reference) .devinit.data:(unknown)
The variable s3c_fb_driver_ids references
the (unknown reference) __devinitdata (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

WARNING: vmlinux.o(.data+0x20b70): Section mismatch in reference from the variable s3c_fb_driver_ids to the (unknown reference) .devinit.data:(unknown)
The variable s3c_fb_driver_ids references
the (unknown reference) __devinitdata (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/video/s3c-fb.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index d461f1d..de7334c 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -1482,7 +1482,7 @@ static int s3c_fb_resume(struct platform_device *pdev)
 #define VALID_BPP124 (VALID_BPP(1) | VALID_BPP(2) | VALID_BPP(4))
 #define VALID_BPP1248 (VALID_BPP124 | VALID_BPP(8))
 
-static struct s3c_fb_win_variant s3c_fb_data_64xx_wins[] __devinitdata = {
+static struct s3c_fb_win_variant s3c_fb_data_64xx_wins[] = {
 	[0] = {
 		.has_osd_c	= 1,
 		.has_osd_size	= 1,
@@ -1533,7 +1533,7 @@ static struct s3c_fb_win_variant s3c_fb_data_64xx_wins[] __devinitdata = {
 	},
 };
 
-static struct s3c_fb_driverdata s3c_fb_data_64xx __devinitdata = {
+static struct s3c_fb_driverdata s3c_fb_data_64xx = {
 	.variant = {
 		.nr_windows	= 5,
 		.vidtcon	= VIDTCON0,
@@ -1563,7 +1563,7 @@ static struct s3c_fb_driverdata s3c_fb_data_64xx __devinitdata = {
 	.win[4]	= &s3c_fb_data_64xx_wins[4],
 };
 
-static struct s3c_fb_driverdata s3c_fb_data_s5pc100 __devinitdata = {
+static struct s3c_fb_driverdata s3c_fb_data_s5pc100 = {
 	.variant = {
 		.nr_windows	= 5,
 		.vidtcon	= VIDTCON0,
@@ -1593,7 +1593,7 @@ static struct s3c_fb_driverdata s3c_fb_data_s5pc100 __devinitdata = {
 	.win[4]	= &s3c_fb_data_64xx_wins[4],
 };
 
-static struct s3c_fb_driverdata s3c_fb_data_s5pv210 __devinitdata = {
+static struct s3c_fb_driverdata s3c_fb_data_s5pv210 = {
 	.variant = {
 		.nr_windows	= 5,
 		.vidtcon	= VIDTCON0,
@@ -1624,7 +1624,7 @@ static struct s3c_fb_driverdata s3c_fb_data_s5pv210 __devinitdata = {
 };
 
 /* S3C2443/S3C2416 style hardware */
-static struct s3c_fb_driverdata s3c_fb_data_s3c2443 __devinitdata = {
+static struct s3c_fb_driverdata s3c_fb_data_s3c2443 = {
 	.variant = {
 		.nr_windows	= 2,
 		.is_2443	= 1,
-- 
1.7.1.569.g6f426
