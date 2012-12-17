From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS: Fix NULL pointer dereference bug in SMDKV310
Date: Mon, 17 Dec 2012 16:54:21 +0530
Message-ID: <1355743461-21535-3-git-send-email-sachin.kamat@linaro.org>
References: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41184 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958Ab2LQLby (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Dec 2012 06:31:54 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so3935735pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Dec 2012 03:31:54 -0800 (PST)
In-Reply-To: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

When DRM support for Samsung SoC and Samsung S3C framebuffer support
are selected, the kernel crashes as it does not get the required
platform data. Change the compile macro to CONFIG_DRM_EXYNOS_FIMD
to fix this.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-smdkv310.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index b738424..35548e3 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -159,7 +159,7 @@ static struct platform_device smdkv310_lcd_lte480wv = {
 	.dev.platform_data	= &smdkv310_lcd_lte480wv_data,
 };
 
-#ifdef CONFIG_DRM_EXYNOS
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
 	.panel	= {
 		.timing	= {
@@ -402,7 +402,7 @@ static void __init smdkv310_machine_init(void)
 	samsung_bl_set(&smdkv310_bl_gpio_info, &smdkv310_bl_data);
 	pwm_add_table(smdkv310_pwm_lookup, ARRAY_SIZE(smdkv310_pwm_lookup));
 
-#ifdef CONFIG_DRM_EXYNOS
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
 	exynos4_fimd0_gpio_setup_24bpp();
 #else
-- 
1.7.4.1
