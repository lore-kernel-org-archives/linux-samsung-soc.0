From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/2] ARM: EXYNOS: Set HDMI platform data in Origen board
Date: Thu,  5 Apr 2012 13:54:56 +0530
Message-ID: <1333614296-13256-3-git-send-email-tushar.behera@linaro.org>
References: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47027 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751703Ab2DEIdL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 04:33:11 -0400
Received: by mail-pb0-f46.google.com with SMTP id un15so1286145pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 01:33:11 -0700 (PDT)
In-Reply-To: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, patches@linaro.org

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 878d4c9..ac6f78f 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -41,6 +41,7 @@
 #include <plat/pd.h>
 #include <plat/fb.h>
 #include <plat/mfc.h>
+#include <plat/hdmi.h>
 
 #include <mach/ohci.h>
 #include <mach/map.h>
@@ -671,6 +672,11 @@ static void __init origen_bt_setup(void)
 	s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE);
 }
 
+/* I2C module and id for HDMIPHY */
+static struct i2c_board_info hdmiphy_info = {
+	I2C_BOARD_INFO("hdmiphy", 0x38),
+};
+
 static void s5p_tv_setup(void)
 {
 	/* Direct HPD to HDMI chip */
@@ -718,6 +724,7 @@ static void __init origen_machine_init(void)
 
 	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
+	s5p_hdmi_set_platdata(&hdmiphy_info, NULL, 0);
 
 	s5p_fimd0_set_platdata(&origen_lcd_pdata);
 
-- 
1.7.4.1
