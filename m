From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: Removed code for setting clock rate of xusbxti
Date: Fri,  2 Dec 2011 12:08:17 +0530
Message-ID: <1322807898-14825-3-git-send-email-pankaj.dubey@samsung.com>
References: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53148 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728Ab1LBGkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Dec 2011 01:40:36 -0500
Received: by mail-iy0-f174.google.com with SMTP id e36so3699997iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2011 22:40:36 -0800 (PST)
In-Reply-To: <1322807898-14825-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org
Cc: kgene.kim@samsung.com, pankaj.dubey@samsung.com

Since now xusbxti clock's default rate is set in clock.c file,
there is no need to set it again in the machine file.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c     |    1 -
 arch/arm/mach-exynos/mach-origen.c   |    1 -
 arch/arm/mach-exynos/mach-smdk4x12.c |    2 --
 arch/arm/mach-exynos/mach-smdkv310.c |    1 -
 4 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 236bbe1..d9196b8 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1314,7 +1314,6 @@ static void __init nuri_machine_init(void)
 	nuri_camera_init();
 
 	nuri_ehci_init();
-	clk_xusbxti.rate = 24000000;
 
 	/* Last */
 	platform_add_devices(nuri_devices, ARRAY_SIZE(nuri_devices));
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index f56d027..4700456 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -702,7 +702,6 @@ static void __init origen_machine_init(void)
 	s3c_sdhci0_set_platdata(&origen_hsmmc0_pdata);
 
 	origen_ehci_init();
-	clk_xusbxti.rate = 24000000;
 
 	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index fcf2e0e..35b86ea 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -247,8 +247,6 @@ static struct platform_device *smdk4x12_devices[] __initdata = {
 
 static void __init smdk4x12_map_io(void)
 {
-	clk_xusbxti.rate = 24000000;
-
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(smdk4x12_uartcfgs, ARRAY_SIZE(smdk4x12_uartcfgs));
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index cec2afa..c7fb82f 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -363,7 +363,6 @@ static void __init smdkv310_machine_init(void)
 	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
 
 	smdkv310_ehci_init();
-	clk_xusbxti.rate = 24000000;
 
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
 	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
-- 
1.7.4.1
