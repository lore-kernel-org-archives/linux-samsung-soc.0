From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/3] ARM: EXYNOS: Add missing FIMC media device to Origen
Date: Thu, 29 Dec 2011 11:59:36 +0530
Message-ID: <1325140176-2309-4-git-send-email-sachin.kamat@linaro.org>
References: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34272 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1L2Gdn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 01:33:43 -0500
Received: by mail-iy0-f174.google.com with SMTP id h11so23180375iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 22:33:43 -0800 (PST)
In-Reply-To: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, snjw23@gmail.com

FIMC media device (md) registers all required video nodes.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index a0116036..d691146 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -631,6 +631,7 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
 	&s5p_device_fimc3,
+	&s5p_device_fimc_md,
 	&s5p_device_fimd0,
 	&s5p_device_hdmi,
 	&s5p_device_i2c_hdmiphy,
-- 
1.7.4.1
