From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV210: Add init code of audio to Goni and Aquila
 board
Date: Fri, 01 Oct 2010 13:23:23 +0900
Message-ID: <4CA5623B.5030405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50651 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750874Ab0JAEX0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Oct 2010 00:23:26 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9L00MICG71TZA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 13:23:25 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9L00ITNG71XX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Oct 2010 13:23:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@slimlogic.co.uk>

This patch add initializtion code of audio and I2S platform drivers
to Goni and Aquila board.

Signed-off-by : Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by : Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by : Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c |   24 ++++++++++++++++++++++++
 arch/arm/mach-s5pv210/mach-goni.c   |   11 +++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 0663ec4..92dad41 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -507,8 +507,31 @@ static struct platform_device *aquila_devices[] __initdata = {
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
+	&s5pv210_device_iis0,
 };
 
+static void __init aquila_sound_init(void)
+{
+	unsigned int gpio;
+
+	/* CODEC_XTAL_EN 
+	 *
+	 * The Aquila board have a oscillator which provide main clock
+	 * to WM8994 codec. The oscillator provide 24MHz clock to WM8994
+	 * clock. Set gpio setting of "CODEC_XTAL_EN" to enable a oscillator.
+	 * */
+	gpio = S5PV210_GPH3(2);		/* XEINT_26 */
+	gpio_request(gpio, "CODEC_XTAL_EN");
+	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
+	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
+
+	/* Ths main clock of WM8994 codec uses the output of CLKOUT pin.
+	 * The CLKOUT[9:8] set to 0x3(XUSBXTI) of 0xE010E000(OTHERS) 
+	 * because it needs 24MHz clock to operate WM8994 codec.
+	 */
+	writel(readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
+}
+
 static void __init aquila_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
@@ -530,6 +553,7 @@ static void __init aquila_machine_init(void)
 	s3c_fimc_setname(2, "s5p-fimc");
 
 	/* SOUND */
+	aquila_sound_init();
 	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
 			ARRAY_SIZE(i2c_gpio5_devs));
 
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index df5c2d1..d3bab85 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -488,8 +488,18 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
+	&s5pv210_device_iis0,
 };
 
+static void __init goni_sound_init(void)
+{
+	/* Ths main clock of WM8994 codec uses the output of CLKOUT pin.
+	 * The CLKOUT[9:8] set to 0x3(XUSBXTI) of 0xE010E000(OTHERS) 
+	 * because it needs 24MHz clock to operate WM8994 codec.
+	 */
+	writel(readl(S5P_OTHERS) | (0x3 << 8), S5P_OTHERS);
+}
+
 static void __init goni_map_io(void)
 {
 	s5p_init_io(NULL, 0, S5P_VA_CHIPID);
@@ -507,6 +517,7 @@ static void __init goni_machine_init(void)
 	goni_setup_sdhci();
 
 	/* SOUND */
+	goni_sound_init();
 	i2c_register_board_info(AP_I2C_GPIO_BUS_5, i2c_gpio5_devs,
 			ARRAY_SIZE(i2c_gpio5_devs));
 
-- 
1.7.0.4
