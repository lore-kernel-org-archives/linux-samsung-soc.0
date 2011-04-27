From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV210: Enable MFC on Goni & Aquila
Date: Wed, 27 Apr 2011 13:43:04 +0200
Message-ID: <1303904585-11818-3-git-send-email-k.debski@samsung.com>
References: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:65523 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753498Ab1D0Ln2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Apr 2011 07:43:28 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LKB00NOR7833H00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:15 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LKB00KV6781SJ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:43:14 +0100 (BST)
In-reply-to: <1303904585-11818-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, kgene.kim@samsung.com, jtp.park@samsung.com

Enable MFC 5.1 device on the Goni & Aquila boards using the S5PV210 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig       |    1 +
 arch/arm/mach-s5pv210/mach-aquila.c |    1 +
 arch/arm/mach-s5pv210/mach-goni.c   |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..a06acce 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -90,6 +90,7 @@ config MACH_GONI
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C2
+	select S5P_DEV_MFC
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
 	select SAMSUNG_DEV_KEYPAD
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index de3c41f..e14446c 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -616,6 +616,7 @@ static struct platform_device *aquila_devices[] __initdata = {
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
+	&s5p_device_mfc,
 	&s5pv210_device_iis0,
 	&wm8994_fixed_voltage0,
 	&wm8994_fixed_voltage1,
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 24f3f5c..6a68ddf 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -809,6 +809,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&goni_i2c_gpio5,
 	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
+	&s5p_device_mfc,
 	&s3c_device_i2c0,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
-- 
1.6.3.3
