From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/3] ARM: EXYNOS: Add missing FIMC media device to SMDKV310
Date: Thu, 29 Dec 2011 11:59:35 +0530
Message-ID: <1325140176-2309-3-git-send-email-sachin.kamat@linaro.org>
References: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34272 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1L2Gdd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 01:33:33 -0500
Received: by mail-iy0-f174.google.com with SMTP id h11so23180375iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 22:33:33 -0800 (PST)
In-Reply-To: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, snjw23@gmail.com

FIMC media device (md) registers all required video nodes.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-smdkv310.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index bf2094e..09d0525 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -268,6 +268,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_fimc_md,
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&exynos4_device_ohci,
-- 
1.7.4.1
