From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: EXYNOS: Fix NULL pointer dereference bug in Origen
Date: Mon, 17 Dec 2012 16:54:19 +0530
Message-ID: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:44469 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958Ab2LQLbq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Dec 2012 06:31:46 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so3935652pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Dec 2012 03:31:46 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

When DRM support for Samsung SoC and Samsung S3C framebuffer support
are selected, the kernel crashes as it does not get the required
platform data. Change the compile macro to CONFIG_DRM_EXYNOS_FIMD
to fix this.

Without this patch the following crash occurs during bootup:

Unable to handle kernel NULL pointer dereference at virtual address 00000000
PC is at 0x0
LR is at s3c_fb_probe+0x198/0x788
[<c01520e8>] (s3c_fb_probe+0x198/0x788) from [<c01a3dd4>] (platform_drv_probe+0x18/0x1c)
[<c01a3dd4>] (platform_drv_probe+0x18/0x1c) from [<c01a2b8c>] (driver_probe_device+0x70/0x1f0)
[<c01a2b8c>] (driver_probe_device+0x70/0x1f0) from [<c01a2d98>] (__driver_attach+0x8c/0x90)
[<c01a2d98>] (__driver_attach+0x8c/0x90) from [<c01a14e4>] (bus_for_each_dev+0x50/0x7c)
[<c01a14e4>] (bus_for_each_dev+0x50/0x7c) from [<c01a23f4>] (bus_add_driver+0x170/0x23c)
[<c01a23f4>] (bus_add_driver+0x170/0x23c) from [<c01a324c>] (driver_register+0x78/0x144)
[<c01a324c>] (driver_register+0x78/0x144) from [<c000862c>] (do_one_initcall+0x34/0x174)
[<c000862c>] (do_one_initcall+0x34/0x174) from [<c01de210>] (kernel_init+0x100/0x2a0)
[<c01de210>] (kernel_init+0x100/0x2a0) from [<c000e118>] (ret_from_fork+0x14/0x3c)

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index e6f4191..5e34b9c 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -621,7 +621,7 @@ static struct pwm_lookup origen_pwm_lookup[] = {
 	PWM_LOOKUP("s3c24xx-pwm.0", 0, "pwm-backlight.0", NULL),
 };
 
-#ifdef CONFIG_DRM_EXYNOS
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
 	.panel	= {
 		.timing	= {
@@ -793,7 +793,7 @@ static void __init origen_machine_init(void)
 	s5p_i2c_hdmiphy_set_platdata(NULL);
 	s5p_hdmi_set_platdata(&hdmiphy_info, NULL, 0);
 
-#ifdef CONFIG_DRM_EXYNOS
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
 	exynos4_fimd0_gpio_setup_24bpp();
 #else
-- 
1.7.4.1
