From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/4] ARM: EXYNOS: Set HDMI platform data in Origen board
Date: Mon,  2 Jul 2012 14:18:52 +0530
Message-ID: <1341218932-15846-4-git-send-email-sachin.kamat@linaro.org>
References: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57109 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932449Ab2GBJBU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 05:01:20 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so7118112dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jul 2012 02:01:20 -0700 (PDT)
In-Reply-To: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org

From: Tushar Behera <tushar.behera@linaro.org>

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 580cc77..83d4e96 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -41,6 +41,7 @@
 #include <plat/backlight.h>
 #include <plat/fb.h>
 #include <plat/mfc.h>
+#include <plat/hdmi.h>
 
 #include <mach/ohci.h>
 #include <mach/map.h>
@@ -705,6 +706,11 @@ static void __init origen_bt_setup(void)
 	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
 }
 
+/* I2C module and id for HDMIPHY */
+static struct i2c_board_info hdmiphy_info = {
+	I2C_BOARD_INFO("hdmiphy-exynos4210", 0x38),
+};
+
 static void s5p_tv_setup(void)
 {
 	/* Direct HPD to HDMI chip */
@@ -753,6 +759,7 @@ static void __init origen_machine_init(void)
 
 	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
+	s5p_hdmi_set_platdata(&hdmiphy_info, NULL, 0);
 
 #ifdef CONFIG_DRM_EXYNOS
 	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
-- 
1.7.4.1
