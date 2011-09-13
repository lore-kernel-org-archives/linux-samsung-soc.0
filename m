From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v3 1/2] i2c: s3c2410: Keep a copy of platform data and use it
Date: Tue, 13 Sep 2011 09:46:04 +0530
Message-ID: <1315887365-30532-2-git-send-email-thomas.abraham@linaro.org>
References: <1315887365-30532-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21892 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490Ab1IMEQo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Sep 2011 00:16:44 -0400
In-reply-to: <1315887365-30532-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-i2c@vger.kernel.org, grant.likely@secretlab.ca, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

The platform data is copied into driver's private data and the copy is
used for all access to the platform data. This simpifies the addition
of device tree support for the i2c-s3c2410 driver.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/i2c/busses/i2c-s3c2410.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f84a63c..266dd83 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -78,6 +78,7 @@ struct s3c24xx_i2c {
 	struct resource		*ioarea;
 	struct i2c_adapter	adap;
 
+	struct s3c2410_platform_i2c	*pdata;
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
@@ -625,7 +626,7 @@ static int s3c24xx_i2c_calcdivisor(unsigned long clkin, unsigned int wanted,
 
 static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 {
-	struct s3c2410_platform_i2c *pdata = i2c->dev->platform_data;
+	struct s3c2410_platform_i2c *pdata = i2c->pdata;
 	unsigned long clkin = clk_get_rate(i2c->clk);
 	unsigned int divs, div1;
 	unsigned long target_frequency;
@@ -754,7 +755,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 
 	/* get the plafrom data */
 
-	pdata = i2c->dev->platform_data;
+	pdata = i2c->pdata;
 
 	/* inititalise the gpio */
 
@@ -793,7 +794,7 @@ static int s3c24xx_i2c_init(struct s3c24xx_i2c *i2c)
 static int s3c24xx_i2c_probe(struct platform_device *pdev)
 {
 	struct s3c24xx_i2c *i2c;
-	struct s3c2410_platform_i2c *pdata;
+	struct s3c2410_platform_i2c *pdata = NULL;
 	struct resource *res;
 	int ret;
 
@@ -809,6 +810,15 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	i2c->pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!i2c->pdata) {
+		ret = -ENOMEM;
+		goto err_noclk;
+	}
+
+	if (pdata)
+		memcpy(i2c->pdata, pdata, sizeof(*pdata));
+
 	strlcpy(i2c->adap.name, "s3c2410-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner   = THIS_MODULE;
 	i2c->adap.algo    = &s3c24xx_i2c_algorithm;
@@ -903,7 +913,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	 * being bus 0.
 	 */
 
-	i2c->adap.nr = pdata->bus_num;
+	i2c->adap.nr = i2c->pdata->bus_num;
 
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0) {
-- 
1.6.6.rc2
