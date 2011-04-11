From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 1/4] i2c-s3c2410: fix I2C dedicated for hdmiphy
Date: Mon, 11 Apr 2011 14:18:52 +0200
Message-ID: <1302524335-29083-2-git-send-email-t.stanislaws@samsung.com>
References: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:49001 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754479Ab1DKMTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 08:19:13 -0400
Received: from spt2.w1.samsung.com ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LJH00LG8M7YB180@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:11 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LJH00HR3M7XCF@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 13:19:10 +0100 (BST)
In-reply-to: <1302524335-29083-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

The I2C HDMIPHY dedicated controller has different timeout
handling and reset conditions.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |   36 +++++++++++++++++++++++++++++++++++-
 1 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 6c00c10..99cfe2f 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -54,6 +54,7 @@ enum s3c24xx_i2c_state {
 enum s3c24xx_i2c_type {
 	TYPE_S3C2410,
 	TYPE_S3C2440,
+	TYPE_S3C2440_HDMIPHY,
 };
 
 struct s3c24xx_i2c {
@@ -96,7 +97,21 @@ static inline int s3c24xx_i2c_is2440(struct s3c24xx_i2c *i2c)
 	enum s3c24xx_i2c_type type;
 
 	type = platform_get_device_id(pdev)->driver_data;
-	return type == TYPE_S3C2440;
+	return type == TYPE_S3C2440 || type == TYPE_S3C2440_HDMIPHY;
+}
+
+/* s3c24xx_i2c_is2440_hdmiphy()
+ *
+ * return true is this is an s3c2440 dedicated for HDMIPHY interface
+*/
+
+static inline int s3c24xx_i2c_is2440_hdmiphy(struct s3c24xx_i2c *i2c)
+{
+	struct platform_device *pdev = to_platform_device(i2c->dev);
+	enum s3c24xx_i2c_type type;
+
+	type = platform_get_device_id(pdev)->driver_data;
+	return type == TYPE_S3C2440_HDMIPHY;
 }
 
 /* s3c24xx_i2c_master_complete
@@ -461,6 +476,13 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 	unsigned long iicstat;
 	int timeout = 400;
 
+	/* if hang-up of HDMIPHY occured reduce timeout
+	 * The controller will work after reset, so waiting
+	 * 400 ms will cause unneccessary system hangup
+	 */
+	if (s3c24xx_i2c_is2440_hdmiphy(i2c))
+		timeout = 10;
+
 	while (timeout-- > 0) {
 		iicstat = readl(i2c->regs + S3C2410_IICSTAT);
 
@@ -470,6 +492,15 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
 		msleep(1);
 	}
 
+	/* hang-up of bus dedicated for HDMIPHY occured, resetting */
+	if (s3c24xx_i2c_is2440_hdmiphy(i2c)) {
+		writel(0, i2c->regs + S3C2410_IICCON);
+		writel(0, i2c->regs + S3C2410_IICSTAT);
+		writel(0, i2c->regs + S3C2410_IICDS);
+
+		return 0;
+	}
+
 	return -ETIMEDOUT;
 }
 
@@ -1009,6 +1040,9 @@ static struct platform_device_id s3c24xx_driver_ids[] = {
 	}, {
 		.name		= "s3c2440-i2c",
 		.driver_data	= TYPE_S3C2440,
+	}, {
+		.name		= "s3c2440-hdmiphy-i2c",
+		.driver_data	= TYPE_S3C2440_HDMIPHY,
 	}, { },
 };
 MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
-- 
1.7.4.3
