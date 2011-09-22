From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH RESEND] drivers: i2c: s3c2410: add support for HDMIPHY
 dedicated controller
Date: Thu, 22 Sep 2011 12:24:56 +0200
Message-ID: <1316687096-18307-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11360 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752710Ab1IVKZF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 06:25:05 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Stanislawski <t.stanislaws@samsung.com>

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

This patch adds support for I2C HDMIPHY dedicated controller. It has
different timeout handling and reset conditions.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |   36 +++++++++++++++++++++++++++++++++++-
 1 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f84a63c..e456cf9 100644
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
@@ -460,6 +475,13 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
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
 
@@ -469,6 +491,15 @@ static int s3c24xx_i2c_set_master(struct s3c24xx_i2c *i2c)
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
 
@@ -1008,6 +1039,9 @@ static struct platform_device_id s3c24xx_driver_ids[] = {
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
1.7.1.569.g6f426
