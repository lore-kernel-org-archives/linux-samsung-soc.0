From: Kukjin Kim <kgene.kim@samsung.com>
Subject: PATCH v2] i2c: s3c2410: Add quirk to exclude GPIO config for exynos5440
Date: Tue, 22 Jan 2013 18:47:39 -0800
Message-ID: <069301cdf914$03d16890$0b7439b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36576 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752346Ab3AWCr7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jan 2013 21:47:59 -0500
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 'Wolfram Sang' <w.sang@pengutronix.de>, 'Giridhar Maruthy' <giridhar.m@samsung.com>

From: Giridhar Maruthy <giridhar.m@samsung.com>

Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1:
- added documentation of device tree bindings for i2c-s3c2410,
  as per Tomasz's suggestion
- changed ordering for of_device_id according to binding ordering
  of the documentation

 Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt |    2 ++
 drivers/i2c/busses/i2c-s3c2410.c                      |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
b/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
index e9611ac..b92bc14 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt
@@ -8,6 +8,8 @@ Required properties:
       (b) "samsung, s3c2440-i2c", for i2c compatible with s3c2440 i2c.
       (c) "samsung, s3c2440-hdmiphy-i2c", for s3c2440-like i2c used
           inside HDMIPHY block found on several samsung SoCs
+      (d) "samsung, exynos5440-i2c", for s3c2440-like i2c used
+	   on EXYNOS5440 which does not need GPIO configuration.
   - reg: physical base address of the controller and length of memory
mapped
     region.
   - interrupts: interrupt number to the cpu.
diff --git a/drivers/i2c/busses/i2c-s3c2410.c
b/drivers/i2c/busses/i2c-s3c2410.c
index a290d08..17c5c37 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -111,6 +111,8 @@ static const struct of_device_id s3c24xx_i2c_match[] = {
 	{ .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440
},
 	{ .compatible = "samsung,s3c2440-hdmiphy-i2c",
 	  .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
+	{ .compatible = "samsung,exynos5440-i2c",
+	  .data = (void *)(QUIRK_S3C2440 | QUIRK_NO_GPIO) },
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
-- 
1.7.10.4
