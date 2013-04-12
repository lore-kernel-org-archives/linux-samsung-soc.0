From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v5 05/14] ARM: SAMSUNG: Add new PWM platform device
Date: Fri, 12 Apr 2013 21:17:21 +0200
Message-ID: <1365794250-14436-6-git-send-email-t.figa@samsung.com>
References: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54973 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754878Ab3DLTS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 15:18:29 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ML500BYKPMS9DC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Apr 2013 04:18:28 +0900 (KST)
In-reply-to: <1365794250-14436-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, sylvester.nawrocki@gmail.com, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, mark.rutland@arm.com, tomasz.figa@gmail.com, heiko@sntech.de, robherring2@gmail.com, m.szyprowski@samsung.com, arnd@arndb.de, john.stultz@linaro.org, tglx@linutronix.de, Tomasz Figa <t.figa@samsung.com>

This patch adds new samsung_device_pwm platform device that represents
the whole PWM/timer block and includes memory and IRQ resources.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/devs.c              | 16 ++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index e1124d9..bfae4dd 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1168,6 +1168,22 @@ struct platform_device s3c_device_timer[] = {
 };
 #endif /* CONFIG_SAMSUNG_DEV_PWM */
 
+static struct resource samsung_pwm_resource[] = {
+	DEFINE_RES_IRQ(IRQ_TIMER0),
+	DEFINE_RES_IRQ(IRQ_TIMER1),
+	DEFINE_RES_IRQ(IRQ_TIMER2),
+	DEFINE_RES_IRQ(IRQ_TIMER3),
+	DEFINE_RES_IRQ(IRQ_TIMER4),
+	DEFINE_RES_MEM(SAMSUNG_PA_TIMER, SZ_4K),
+};
+
+struct platform_device samsung_device_pwm = {
+	.name		= "samsung-pwm",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(samsung_pwm_resource),
+	.resource	= samsung_pwm_resource,
+};
+
 /* RTC */
 
 #ifdef CONFIG_PLAT_S3C24XX
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 87d501f..0dc4ac4 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -134,6 +134,7 @@ extern struct platform_device exynos4_device_spdif;
 
 extern struct platform_device samsung_asoc_idma;
 extern struct platform_device samsung_device_keypad;
+extern struct platform_device samsung_device_pwm;
 
 /* s3c2440 specific devices */
 
-- 
1.8.1.5
