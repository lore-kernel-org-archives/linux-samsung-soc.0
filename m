From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Register power domains on Origen.
Date: Fri,  7 Oct 2011 16:57:33 +0530
Message-ID: <1317986853-21631-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:62234 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965375Ab1JGLc3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 07:32:29 -0400
Received: by pzk1 with SMTP id 1so9385121pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Oct 2011 04:32:28 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

This patch registers all the available power domains on Origen.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/mach-origen.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index 18909cf..35b12d7 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -601,6 +601,10 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_mixer,
 	&exynos4_device_pd[PD_LCD0],
 	&exynos4_device_pd[PD_TV],
+	&exynos4_device_pd[PD_G3D],
+	&exynos4_device_pd[PD_LCD1],
+	&exynos4_device_pd[PD_CAM],
+	&exynos4_device_pd[PD_GPS],
 	&origen_device_gpiokeys,
 	&origen_lcd_hv070wsa,
 };
-- 
1.7.4.1
