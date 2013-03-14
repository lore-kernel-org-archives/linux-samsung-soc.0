From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 3/3] ARM: EXYNOS: cpuidle: Allow C1 state only in supported SOC's.
Date: Thu, 14 Mar 2013 11:32:59 +0530
Message-ID: <1363240979-1939-4-git-send-email-amit.daniel@samsung.com>
References: <1363240979-1939-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f180.google.com ([209.85.223.180]:61823 "EHLO
	mail-ie0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753837Ab3CNGD1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Mar 2013 02:03:27 -0400
Received: by mail-ie0-f180.google.com with SMTP id bn7so2521095ieb.25
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 23:03:27 -0700 (PDT)
In-Reply-To: <1363240979-1939-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

This patch registers the basic C0 state for all exynos SOC's but
limits the C1(AFTR -Arm off top running) state in only the supported
SOC's(ie. EXYNOS 4210, 4212, 4412 and 5250).

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 4fc1f4f..459979a 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -177,7 +177,9 @@ static int __init exynos4_init_cpuidle(void)
 		device->cpu = cpu_id;
 
 		/* Support IDLE only */
-		if (cpu_id != 0)
+		if (!(soc_is_exynos4210() || soc_is_exynos4212() ||
+			soc_is_exynos4412() || soc_is_exynos5250()) ||
+			cpu_id != 0)
 			device->state_count = 1;
 
 		ret = cpuidle_register_device(device);
-- 
1.7.1
