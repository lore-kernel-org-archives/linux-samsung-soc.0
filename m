From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/3] ARM: SAMSUNG: Remove Exynos specific code from devs.c
Date: Fri, 27 Dec 2013 11:59:53 +0530
Message-ID: <1388125795-30418-2-git-send-email-tushar.behera@linaro.org>
References: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:37327 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662Ab3L0Gd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 01:33:28 -0500
Received: by mail-pa0-f41.google.com with SMTP id lf10so9041331pab.28
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2013 22:33:28 -0800 (PST)
In-Reply-To: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

This file is only compiled when SAMSUNG_ATAGS is enabled, hence not
for Exynos platform.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/devs.c |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index ac07e87..ea41444 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -744,10 +744,7 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
 	if (!pd) {
 		pd = &default_i2c_data;
 
-		if (soc_is_exynos4210() ||
-		    soc_is_exynos4212() || soc_is_exynos4412())
-			pd->bus_num = 8;
-		else if (soc_is_s5pv210())
+		if (soc_is_s5pv210())
 			pd->bus_num = 3;
 		else
 			pd->bus_num = 0;
@@ -764,10 +761,7 @@ void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
 {
 	struct s5p_hdmi_platform_data *pd = &s5p_hdmi_def_platdata;
 
-	if (soc_is_exynos4210() ||
-	    soc_is_exynos4212() || soc_is_exynos4412())
-		pd->hdmiphy_bus = 8;
-	else if (soc_is_s5pv210())
+	if (soc_is_s5pv210())
 		pd->hdmiphy_bus = 3;
 	else
 		pd->hdmiphy_bus = 0;
-- 
1.7.9.5
