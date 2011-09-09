From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V4 RESEND 1/6] video: s3c-fb: Add S5P64X0 specific
 s3c_fb_driverdata
Date: Fri, 09 Sep 2011 14:01:36 -0400
Message-ID: <1315591301-17166-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1315591301-17166-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12708 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933731Ab1IIMBv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Sep 2011 08:01:51 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LR900NCX82W4DS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Sep 2011 21:01:50 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LR900IDU82TO1@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Sep 2011 21:01:50 +0900 (KST)
In-reply-to: <1315591301-17166-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

This patch:
	-- Adds s3c_fb_driverdata for S5P64X0, which supports 3 windows.
	-- Also, register "s5p64x0-fb" type driver_data.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Acked-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/video/s3c-fb.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
index 4aecf21..0fda252 100644
--- a/drivers/video/s3c-fb.c
+++ b/drivers/video/s3c-fb.c
@@ -1859,6 +1859,30 @@ static struct s3c_fb_driverdata s3c_fb_data_s3c2443 = {
 	},
 };
 
+static struct s3c_fb_driverdata s3c_fb_data_s5p64x0 = {
+	.variant = {
+		.nr_windows	= 3,
+		.vidtcon	= VIDTCON0,
+		.wincon		= WINCON(0),
+		.winmap		= WINxMAP(0),
+		.keycon		= WKEYCON,
+		.osd		= VIDOSD_BASE,
+		.osd_stride	= 16,
+		.buf_start	= VIDW_BUF_START(0),
+		.buf_size	= VIDW_BUF_SIZE(0),
+		.buf_end	= VIDW_BUF_END(0),
+
+		.palette = {
+			[0] = 0x2400,
+			[1] = 0x2800,
+			[2] = 0x2c00,
+		},
+	},
+	.win[0] = &s3c_fb_data_s5p_wins[0],
+	.win[1] = &s3c_fb_data_s5p_wins[1],
+	.win[2] = &s3c_fb_data_s5p_wins[2],
+};
+
 static struct platform_device_id s3c_fb_driver_ids[] = {
 	{
 		.name		= "s3c-fb",
@@ -1872,6 +1896,9 @@ static struct platform_device_id s3c_fb_driver_ids[] = {
 	}, {
 		.name		= "s3c2443-fb",
 		.driver_data	= (unsigned long)&s3c_fb_data_s3c2443,
+	}, {
+		.name		= "s5p64x0-fb",
+		.driver_data	= (unsigned long)&s3c_fb_data_s5p64x0,
 	},
 	{},
 };
-- 
1.7.0.4
