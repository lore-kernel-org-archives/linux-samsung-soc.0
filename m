From: Kamil Debski <k.debski@samsung.com>
Subject: [RFC/PATCH v3 4/4] s5pv210: Enable MFC on Goni
Date: Wed, 01 Dec 2010 13:54:25 +0100
Message-ID: <1291208065-15827-5-git-send-email-k.debski@samsung.com>
References: <1291208065-15827-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:22997 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755024Ab0LAMzN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Dec 2010 07:55:13 -0500
In-reply-to: <1291208065-15827-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, pawel@osciak.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com

Multi Format Codec 5.1 is a module available on S5PC110 and S5PC210
Samsung SoCs. Hardware is capable of handling a range of video codecs.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index c45a1b7..43f408d 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -85,6 +85,7 @@ config MACH_GONI
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C2
+	select S5P_DEV_MFC
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
 	select SAMSUNG_DEV_KEYPAD
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 8d19ead..50f10b9 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -810,6 +810,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&goni_i2c_gpio5,
 	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
+	&s5p_device_mfc5,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
-- 
1.6.3.3
