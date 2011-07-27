From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 1/7] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata
Date: Wed, 27 Jul 2011 13:31:12 -0400
Message-ID: <1311787878-16193-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1311787878-16193-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60527 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031Ab1G0Lj2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 07:39:28 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOZ00CLFPPPA530@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 20:39:26 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOZ0092EPPJ2V@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 20:39:27 +0900 (KST)
In-reply-to: <1311787878-16193-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

This patch:
Adds s3c_fb_driverdata for S5P64X0, which supports 3 windows.
Also, register "s5p64x0-fb" type driver_data.
Existing s3c_fb_driverdata definitions in s3c-fb.c
supports 5 or 2 windows.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
acked-by: Jingoo Han <jg1.han@samsung.com>
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
