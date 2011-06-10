From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 3/5] ARM: EXYNOS4: fix improper gpio configuration
Date: Fri, 10 Jun 2011 12:04:25 +0530
Message-ID: <1307687667-9127-4-git-send-email-ch.naveen@samsung.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16009 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752332Ab1FJGiX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2011 02:38:23 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LMK00EHSAF9XQI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 15:38:07 +0900 (KST)
Received: from Hawshines.sisodomain.com (unknown [107.108.83.161])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LMK005R8AF8Q510@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jun 2011 15:38:07 +0900 (KST)
In-reply-to: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-ar

These pins are incorrectly configured for PCM2
configure them to SPDIF(_OUT & _EXT_CLK)

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 arch/arm/mach-exynos4/dev-audio.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/dev-audio.c b/arch/arm/mach-exynos4/dev-audio.c
index 6347594..5add5fa 100644
--- a/arch/arm/mach-exynos4/dev-audio.c
+++ b/arch/arm/mach-exynos4/dev-audio.c
@@ -335,7 +335,7 @@ struct platform_device exynos4_device_ac97 = {
 
 static int exynos4_spdif_cfg_gpio(struct platform_device *pdev)
 {
-	s3c_gpio_cfgpin_range(EXYNOS4_GPC1(0), 2, S3C_GPIO_SFN(3));
+	s3c_gpio_cfgpin_range(EXYNOS4_GPC1(0), 2, S3C_GPIO_SFN(4));
 
 	return 0;
 }
-- 
1.7.2.3
