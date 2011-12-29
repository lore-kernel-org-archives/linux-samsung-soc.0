From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: S5PV210: Add missing FIMC media device to Aquila
Date: Thu, 29 Dec 2011 11:59:34 +0530
Message-ID: <1325140176-2309-2-git-send-email-sachin.kamat@linaro.org>
References: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34272 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333Ab1L2Gd2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Dec 2011 01:33:28 -0500
Received: by mail-iy0-f174.google.com with SMTP id h11so23180375iae.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Dec 2011 22:33:27 -0800 (PST)
In-Reply-To: <1325140176-2309-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, snjw23@gmail.com

FIMC media device (md) registers all required video nodes.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/mach-aquila.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 404ac7a..ca7cfdb 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -614,6 +614,7 @@ static struct platform_device *aquila_devices[] __initdata = {
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
+	&s5p_device_fimc_md,
 	&s5pv210_device_iis0,
 	&wm8994_fixed_voltage0,
 	&wm8994_fixed_voltage1,
-- 
1.7.4.1
