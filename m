From: jassisinghbrar@gmail.com
Subject: [PATCHv2 08/10] ARM: SMDK2443: Enable AC97 device
Date: Wed, 27 Jan 2010 15:01:20 +0900
Message-ID: <1264572080-24754-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39456 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098Ab0A0GL4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2010 01:11:56 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, broonie@opensource.wolfsonmicro.com, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Add AC97 controller to platform devices and initialize the AC97 gpios.

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/mach-s3c2443/mach-smdk2443.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2443/mach-smdk2443.c b/arch/arm/mach-s3c2443/mach-smdk2443.c
index 039a462..5e7d4ab 100644
--- a/arch/arm/mach-s3c2443/mach-smdk2443.c
+++ b/arch/arm/mach-s3c2443/mach-smdk2443.c
@@ -106,6 +106,9 @@ static struct platform_device *smdk2443_devices[] __initdata = {
 	&s3c_device_wdt,
 	&s3c_device_i2c0,
 	&s3c_device_hsmmc0,
+#ifdef CONFIG_SND_SOC_SMDK2443_WM9710
+	&s3c_device_ac97,
+#endif
 };
 
 static void __init smdk2443_map_io(void)
@@ -118,6 +121,11 @@ static void __init smdk2443_map_io(void)
 static void __init smdk2443_machine_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
+
+#ifdef CONFIG_SND_SOC_SMDK2443_WM9710
+	s3c24xx_ac97_setup_gpio(S3C24XX_AC97_GPE0);
+#endif
+
 	platform_add_devices(smdk2443_devices, ARRAY_SIZE(smdk2443_devices));
 	smdk_machine_init();
 }
-- 
1.6.2.5
