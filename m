From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/4] ARM: EXYNOS: Set HDMI platform data in SMDKV310
Date: Mon,  2 Jul 2012 14:18:51 +0530
Message-ID: <1341218932-15846-3-git-send-email-sachin.kamat@linaro.org>
References: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57109 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932449Ab2GBJBR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 05:01:17 -0400
Received: by mail-pz0-f46.google.com with SMTP id y13so7118112dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jul 2012 02:01:17 -0700 (PDT)
In-Reply-To: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org

Sets HDMI platform data in SMDKV310 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-smdkv310.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 95ce9f6..1841aad 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -40,6 +40,7 @@
 #include <plat/mfc.h>
 #include <plat/ehci.h>
 #include <plat/clock.h>
+#include <plat/hdmi.h>
 
 #include <mach/map.h>
 #include <mach/ohci.h>
@@ -347,6 +348,11 @@ static struct platform_pwm_backlight_data smdkv310_bl_data = {
 	.pwm_period_ns  = 1000,
 };
 
+/* I2C module and id for HDMIPHY */
+static struct i2c_board_info hdmiphy_info = {
+	I2C_BOARD_INFO("hdmiphy-exynos4210", 0x38),
+};
+
 static void s5p_tv_setup(void)
 {
 	/* direct HPD to HDMI chip */
@@ -381,6 +387,7 @@ static void __init smdkv310_machine_init(void)
 
 	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
+	s5p_hdmi_set_platdata(&hdmiphy_info, NULL, 0);
 
 	samsung_keypad_set_platdata(&smdkv310_keypad_data);
 
-- 
1.7.4.1
