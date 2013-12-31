From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: SAMSUNG: Remove unused HDMI code
Date: Tue, 31 Dec 2013 12:27:10 +0530
Message-ID: <1388473030-31577-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:58593 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811Ab3LaHAu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Dec 2013 02:00:50 -0500
Received: by mail-pb0-f54.google.com with SMTP id un15so12355763pbc.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 23:00:49 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

There seems to be no users of this code in the tree for now.
Hence remove it.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
S5P_DEV_I2C_HDMIPHY config entry is not selected by any machine.
Please check if this code is required for S5PV210 HDMI support.
Untested on that platform.
---

 arch/arm/plat-samsung/Kconfig             |    5 ---
 arch/arm/plat-samsung/devs.c              |   62 -----------------------------
 arch/arm/plat-samsung/include/plat/devs.h |    1 -
 arch/arm/plat-samsung/include/plat/hdmi.h |   16 --------
 include/linux/platform_data/i2c-s3c2410.h |    1 -
 5 files changed, 85 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/hdmi.h

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 58645a58d0d8..719ec1ad6652 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -354,11 +354,6 @@ config S5P_DEV_G2D
 	help
 	  Compile in platform device definitions for G2D device
 
-config S5P_DEV_I2C_HDMIPHY
-	bool
-	help
-	  Compile in platform device definitions for I2C HDMIPHY controller
-
 config S5P_DEV_JPEG
 	bool
 	help
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index ac07e871f6a7..78460f836e89 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -52,7 +52,6 @@
 #include <linux/platform_data/ata-samsung_cf.h>
 #include <plat/fb.h>
 #include <plat/fb-s3c2410.h>
-#include <plat/hdmi.h>
 #include <linux/platform_data/hwmon-s3c.h>
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <plat/keypad.h>
@@ -722,68 +721,7 @@ void __init s3c_i2c7_set_platdata(struct s3c2410_platform_i2c *pd)
 }
 #endif /* CONFIG_S3C_DEV_I2C7 */
 
-/* I2C HDMIPHY */
-
-#ifdef CONFIG_S5P_DEV_I2C_HDMIPHY
-static struct resource s5p_i2c_resource[] = {
-	[0] = DEFINE_RES_MEM(S5P_PA_IIC_HDMIPHY, SZ_4K),
-	[1] = DEFINE_RES_IRQ(IRQ_IIC_HDMIPHY),
-};
-
-struct platform_device s5p_device_i2c_hdmiphy = {
-	.name		= "s3c2440-hdmiphy-i2c",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(s5p_i2c_resource),
-	.resource	= s5p_i2c_resource,
-};
-
-void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
-{
-	struct s3c2410_platform_i2c *npd;
-
-	if (!pd) {
-		pd = &default_i2c_data;
-
-		if (soc_is_exynos4210() ||
-		    soc_is_exynos4212() || soc_is_exynos4412())
-			pd->bus_num = 8;
-		else if (soc_is_s5pv210())
-			pd->bus_num = 3;
-		else
-			pd->bus_num = 0;
-	}
-
-	npd = s3c_set_platdata(pd, sizeof(struct s3c2410_platform_i2c),
-			       &s5p_device_i2c_hdmiphy);
-}
-
-static struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
-
-void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
-				  struct i2c_board_info *mhl_info, int mhl_bus)
-{
-	struct s5p_hdmi_platform_data *pd = &s5p_hdmi_def_platdata;
-
-	if (soc_is_exynos4210() ||
-	    soc_is_exynos4212() || soc_is_exynos4412())
-		pd->hdmiphy_bus = 8;
-	else if (soc_is_s5pv210())
-		pd->hdmiphy_bus = 3;
-	else
-		pd->hdmiphy_bus = 0;
-
-	pd->hdmiphy_info = hdmiphy_info;
-	pd->mhl_info = mhl_info;
-	pd->mhl_bus = mhl_bus;
-
-	s3c_set_platdata(pd, sizeof(struct s5p_hdmi_platform_data),
-			 &s5p_device_hdmi);
-}
-
-#endif /* CONFIG_S5P_DEV_I2C_HDMIPHY */
-
 /* I2S */
-
 #ifdef CONFIG_PLAT_S3C24XX
 static struct resource s3c_iis_resource[] = {
 	[0] = DEFINE_RES_MEM(S3C24XX_PA_IIS, S3C24XX_SZ_IIS),
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index eece188ed188..d74c8ea72be5 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -84,7 +84,6 @@ extern struct platform_device s5p_device_jpeg;
 extern struct platform_device s5p_device_g2d;
 extern struct platform_device s5p_device_fimd0;
 extern struct platform_device s5p_device_hdmi;
-extern struct platform_device s5p_device_i2c_hdmiphy;
 extern struct platform_device s5p_device_mfc;
 extern struct platform_device s5p_device_mfc_l;
 extern struct platform_device s5p_device_mfc_r;
diff --git a/arch/arm/plat-samsung/include/plat/hdmi.h b/arch/arm/plat-samsung/include/plat/hdmi.h
deleted file mode 100644
index 331d046ac2c5..000000000000
--- a/arch/arm/plat-samsung/include/plat/hdmi.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/*
- * Copyright (C) 2012 Samsung Electronics Co.Ltd
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-#ifndef __PLAT_SAMSUNG_HDMI_H
-#define __PLAT_SAMSUNG_HDMI_H __FILE__
-
-extern void s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
-				  struct i2c_board_info *mhl_info, int mhl_bus);
-
-#endif /* __PLAT_SAMSUNG_HDMI_H */
diff --git a/include/linux/platform_data/i2c-s3c2410.h b/include/linux/platform_data/i2c-s3c2410.h
index bd55054c51c9..a1b99ad2629b 100644
--- a/include/linux/platform_data/i2c-s3c2410.h
+++ b/include/linux/platform_data/i2c-s3c2410.h
@@ -61,7 +61,6 @@ extern void s3c_i2c4_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c5_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c6_set_platdata(struct s3c2410_platform_i2c *i2c);
 extern void s3c_i2c7_set_platdata(struct s3c2410_platform_i2c *i2c);
-extern void s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *i2c);
 
 /* defined by architecture to configure gpio */
 extern void s3c_i2c0_cfg_gpio(struct platform_device *dev);
-- 
1.7.9.5
