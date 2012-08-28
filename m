From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: SAMSUNG: Fix HDMI related warnings
Date: Tue, 28 Aug 2012 12:11:17 +0530
Message-ID: <1346136077-1226-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:34140 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936Ab2H1Gnl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 02:43:41 -0400
Received: by pbbrr13 with SMTP id rr13so8798549pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Aug 2012 23:43:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Silences the following warnings:
arch/arm/plat-samsung/devs.c:765:31: warning:
symbol 's5p_hdmi_def_platdata' was not declared. Should it be static?
arch/arm/plat-samsung/devs.c:767:13: warning:
symbol 's5p_hdmi_set_platdata' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/devs.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 6ff45d5..565cea7 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -51,6 +51,7 @@
 #include <plat/ehci.h>
 #include <plat/fb.h>
 #include <plat/fb-s3c2410.h>
+#include <plat/hdmi.h>
 #include <plat/hwmon.h>
 #include <plat/iic.h>
 #include <plat/keypad.h>
@@ -762,7 +763,7 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
 			       &s5p_device_i2c_hdmiphy);
 }
 
-struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
+static struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
 
 void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
 				  struct i2c_board_info *mhl_info, int mhl_bus)
-- 
1.7.4.1
