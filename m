From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: SAMSUNG: Set HDMI platform data for Exynos4x12 SoCs
Date: Mon,  2 Jul 2012 14:18:49 +0530
Message-ID: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:57109 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932449Ab2GBJBJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 05:01:09 -0400
Received: by dady13 with SMTP id y13so7118112dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jul 2012 02:01:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org

Adds support for setting HDMI platform data for Exynos4X12 SoCs.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/devs.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 1d214cb..07b5ac6 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -747,7 +747,8 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
 	if (!pd) {
 		pd = &default_i2c_data;
 
-		if (soc_is_exynos4210())
+		if (soc_is_exynos4210() || soc_is_exynos4212() ||
+							soc_is_exynos4412())
 			pd->bus_num = 8;
 		else if (soc_is_s5pv210())
 			pd->bus_num = 3;
-- 
1.7.4.1
