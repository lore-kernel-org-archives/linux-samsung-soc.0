From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Update default rate for xusbxti clock
Date: Thu, 12 Jul 2012 18:11:29 +0900
Message-ID: <0fb001cd600e$526d35f0$f747a1d0$%kim@samsung.com>
References: <1340248019-24129-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29316 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933431Ab2GLJLa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:11:30 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7100G3VITEUSW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:11:29 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71004JPIV5QM40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:11:29 +0900 (KST)
In-reply-to: <1340248019-24129-1-git-send-email-tushar.behera@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, linux-samsung-soc@vger.kernel.org

Tushar Behera wrote:
> 
> The rate of xusbxti clock is set in individual machine files. The default
> value should be defined at the clock definition and individual machine
> files
> should modify it if required.
> 
> Division by zero in kernel.
> [<c0011849>] (unwind_backtrace+0x1/0x9c) from [<c022c663>]
(Ldiv0+0x9/0x12)
> [<c022c663>] (Ldiv0+0x9/0x12) from [<c001a3c3>]
> (s3c_setrate_clksrc+0x33/0x78)
> [<c001a3c3>] (s3c_setrate_clksrc+0x33/0x78) from [<c0019e67>]
> (clk_set_rate+0x2f/0x78)
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> 
> Patch is rebased on v3.5-rc3.
> 
>  arch/arm/plat-samsung/s5p-clock.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/s5p-clock.c b/arch/arm/plat-
> samsung/s5p-clock.c
> index 031a618..48a1599 100644
> --- a/arch/arm/plat-samsung/s5p-clock.c
> +++ b/arch/arm/plat-samsung/s5p-clock.c
> @@ -37,6 +37,7 @@ struct clk clk_ext_xtal_mux = {
>  struct clk clk_xusbxti = {
>  	.name		= "xusbxti",
>  	.id		= -1,
> +	.rate		= 24000000,
>  };
> 
>  struct clk s5p_clk_27m = {
> --
> 1.7.4.1

Looks OK, applied.

And I think we can add following with this.

From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: no need to set the value for clk_xusbxti when
it is 24Mhz

Since clk_xusbxti.rate is 24Mhz as a default,
so we don't need to set that when it is 24Mhz.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---

diff --git a/arch/arm/mach-exynos/mach-nuri.c
b/arch/arm/mach-exynos/mach-nuri.c
index f3b328d..f98a83a 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1341,9 +1341,8 @@ static struct platform_device *nuri_devices[]
__initdata = {
 
 static void __init nuri_map_io(void)
 {
-	clk_xusbxti.rate = 24000000;
 	exynos_init_io(NULL, 0);
-	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(nuri_uartcfgs, ARRAY_SIZE(nuri_uartcfgs));
 }
 
diff --git a/arch/arm/mach-exynos/mach-origen.c
b/arch/arm/mach-exynos/mach-origen.c
index 580cc77..5f3daa2 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -716,7 +716,7 @@ static void s5p_tv_setup(void)
 static void __init origen_map_io(void)
 {
 	exynos_init_io(NULL, 0);
-	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(origen_uartcfgs, ARRAY_SIZE(origen_uartcfgs));
 }
 
@@ -749,7 +749,6 @@ static void __init origen_machine_init(void)
 	origen_ehci_init();
 	origen_ohci_init();
 	s3c_hsotg_set_platdata(&origen_hsotg_pdata);
-	clk_xusbxti.rate = 24000000;
 
 	s5p_tv_setup();
 	s5p_i2c_hdmiphy_set_platdata(NULL);
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c
b/arch/arm/mach-exynos/mach-smdk4x12.c
index e134c95..b3753a8 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -258,8 +258,6 @@ static struct platform_device *smdk4x12_devices[]
__initdata = {
 
 static void __init smdk4x12_map_io(void)
 {
-	clk_xusbxti.rate = 24000000;
-
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(smdk4x12_uartcfgs,
ARRAY_SIZE(smdk4x12_uartcfgs));
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c
b/arch/arm/mach-exynos/mach-smdkv310.c
index 9b7c878..4feed55 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -365,7 +365,7 @@ static void s5p_tv_setup(void)
 static void __init smdkv310_map_io(void)
 {
 	exynos_init_io(NULL, 0);
-	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(smdkv310_uartcfgs,
ARRAY_SIZE(smdkv310_uartcfgs));
 }
 
@@ -402,7 +402,6 @@ static void __init smdkv310_machine_init(void)
 	smdkv310_ehci_init();
 	smdkv310_ohci_init();
 	s3c_hsotg_set_platdata(&smdkv310_hsotg_pdata);
-	clk_xusbxti.rate = 24000000;
 
 	platform_add_devices(smdkv310_devices,
ARRAY_SIZE(smdkv310_devices));
 }
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
b/arch/arm/mach-exynos/mach-universal_c210.c
index 68719f5..4d1f40d 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -1099,9 +1099,8 @@ static struct platform_device *universal_devices[]
__initdata = {
 
 static void __init universal_map_io(void)
 {
-	clk_xusbxti.rate = 24000000;
 	exynos_init_io(NULL, 0);
-	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(universal_uartcfgs,
ARRAY_SIZE(universal_uartcfgs));
 	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-goni.c
index b2cae13..822a559 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -908,7 +908,7 @@ static void __init goni_sound_init(void)
 static void __init goni_map_io(void)
 {
 	s5pv210_init_io(NULL, 0);
-	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(goni_uartcfgs, ARRAY_SIZE(goni_uartcfgs));
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
@@ -966,8 +966,6 @@ static void __init goni_machine_init(void)
 	/* KEYPAD */
 	samsung_keypad_set_platdata(&keypad_data);
 
-	clk_xusbxti.rate = 24000000;
-
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
 }
 
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c
b/arch/arm/mach-s5pv210/mach-smdkv210.c
index c8997bc..918b23d 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -285,7 +285,7 @@ static struct platform_pwm_backlight_data
smdkv210_bl_data = {
 static void __init smdkv210_map_io(void)
 {
 	s5pv210_init_io(NULL, 0);
-	s3c24xx_init_clocks(24000000);
+	s3c24xx_init_clocks(clk_xusbxti.rate);
 	s3c24xx_init_uarts(smdkv210_uartcfgs,
ARRAY_SIZE(smdkv210_uartcfgs));
 	s5p_set_timer_source(S5P_PWM2, S5P_PWM4);
 }
@@ -321,7 +321,6 @@ static void __init smdkv210_machine_init(void)
 	samsung_bl_set(&smdkv210_bl_gpio_info, &smdkv210_bl_data);
 
 	s3c_hsotg_set_platdata(&smdkv210_hsotg_pdata);
-	clk_xusbxti.rate = 24000000;
 
 	platform_add_devices(smdkv210_devices,
ARRAY_SIZE(smdkv210_devices));
 }
--


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
