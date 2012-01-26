From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 2/2] ARM: Exynos4: fix TV support on Universal_C210 board
Date: Thu, 26 Jan 2012 18:13:31 +0100
Message-ID: <1327598012-30467-3-git-send-email-t.stanislaws@samsung.com>
References: <1327598012-30467-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:61419 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752753Ab2AZRNm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 12:13:42 -0500
Received: from euspt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LYF0066D16SIG80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2012 17:13:40 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYF00IST16S42@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2012 17:13:40 +0000 (GMT)
In-reply-to: <1327598012-30467-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

This patch adds support for HDMI platform data.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-universal_c210.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 37ac93e..bec57c0 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -45,6 +45,8 @@
 
 #include <media/v4l2-mediabus.h>
 #include <media/s5p_fimc.h>
+#include <media/s5p_hdmi.h>
+
 #include <media/m5mols.h>
 
 #include "common.h"
@@ -997,6 +999,15 @@ static void __init universal_map_io(void)
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
 }
 
+static struct i2c_board_info s5p_hdmiphy_info = {
+	I2C_BOARD_INFO("hdmiphy", 0x70 >> 1),
+};
+
+static struct s5p_hdmi_platform_data s5p_hdmi_pdata = {
+	.hdmiphy_info = &s5p_hdmiphy_info,
+	.hdmiphy_bus = 8,
+};
+
 void s5p_tv_setup(void)
 {
 	/* direct HPD to HDMI chip */
@@ -1004,6 +1015,9 @@ void s5p_tv_setup(void)
 	s3c_gpio_cfgpin(EXYNOS4_GPX3(7), S3C_GPIO_SFN(0x3));
 	s3c_gpio_setpull(EXYNOS4_GPX3(7), S3C_GPIO_PULL_NONE);
 
+	/* setting platform data */
+	s5p_device_hdmi.dev.platform_data = &s5p_hdmi_pdata;
+
 	/* setup dependencies between TV devices */
 	s5p_device_hdmi.dev.parent = &exynos4_device_pd[PD_TV].dev;
 	s5p_device_mixer.dev.parent = &exynos4_device_pd[PD_TV].dev;
-- 
1.7.5.4
