From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: EXYNOS: Fix NULL pointer dereference bug in SMDK4X12
Date: Mon, 17 Dec 2012 16:54:20 +0530
Message-ID: <1355743461-21535-2-git-send-email-sachin.kamat@linaro.org>
References: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:48369 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751958Ab2LQLbu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Dec 2012 06:31:50 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so3986498pad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Dec 2012 03:31:50 -0800 (PST)
In-Reply-To: <1355743461-21535-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

When DRM support for Samsung SoC and Samsung S3C framebuffer support
are selected, the kernel crashes as it does not get the required
platform data. Change the compile macro to CONFIG_DRM_EXYNOS_FIMD
to fix this.

Fixes the following boot time crash:
Unable to handle kernel NULL pointer dereference at virtual address 00000000
PC is at 0x0
LR is at s3c_fb_probe+0x198/0x788
[<c0152270>] (s3c_fb_probe+0x198/0x788) from [<c019e52c>] (platform_drv_probe+0x18/0x1c)
[<c019e52c>] (platform_drv_probe+0x18/0x1c) from [<c019d2e4>] (driver_probe_device+0x70/0x1f0)
[<c019d2e4>] (driver_probe_device+0x70/0x1f0) from [<c019d4f0>] (__driver_attach+0x8c/0x90)
[<c019d4f0>] (__driver_attach+0x8c/0x90) from [<c019bc3c>] (bus_for_each_dev+0x50/0x7c)
[<c019bc3c>] (bus_for_each_dev+0x50/0x7c) from [<c019cb4c>] (bus_add_driver+0x170/0x23c)
[<c019cb4c>] (bus_add_driver+0x170/0x23c) from [<c019d9a4>] (driver_register+0x78/0x144)
[<c019d9a4>] (driver_register+0x78/0x144) from [<c000862c>] (do_one_initcall+0x34/0x174)
[<c000862c>] (do_one_initcall+0x34/0x174) from [<c020ed7c>] (kernel_init+0x100/0x2a0)
[<c020ed7c>] (kernel_init+0x100/0x2a0) from [<c000e118>] (ret_from_fork+0x14/0x3c)

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-smdk4x12.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index a1555a7..ae6da40 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -246,7 +246,7 @@ static struct samsung_keypad_platdata smdk4x12_keypad_data __initdata = {
 	.cols		= 8,
 };
 
-#ifdef CONFIG_DRM_EXYNOS
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 static struct exynos_drm_fimd_pdata drm_fimd_pdata = {
 	.panel	= {
 		.timing	= {
@@ -360,7 +360,7 @@ static void __init smdk4x12_machine_init(void)
 
 	s3c_hsotg_set_platdata(&smdk4x12_hsotg_pdata);
 
-#ifdef CONFIG_DRM_EXYNOS
+#ifdef CONFIG_DRM_EXYNOS_FIMD
 	s5p_device_fimd0.dev.platform_data = &drm_fimd_pdata;
 	exynos4_fimd0_gpio_setup_24bpp();
 #else
-- 
1.7.4.1
