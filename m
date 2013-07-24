From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Wed, 24 Jul 2013 15:23:35 +0530
Message-ID: <1374659615-29447-1-git-send-email-amit.daniel@samsung.com>
References: <0e7d01ce8840$82f79070$88e6b150$@org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:52893 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751626Ab3GXJxv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 05:53:51 -0400
Received: by mail-pd0-f173.google.com with SMTP id bv13so197108pdb.32
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2013 02:53:50 -0700 (PDT)
In-Reply-To: <0e7d01ce8840$82f79070$88e6b150$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>

This patch skips the deep C1(AFTR -Arm off top running) state for exynos5440
soc as this soc does not support this state. All the cpu's only allows the basic
C0 state.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/mach-exynos/cpuidle.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
index 17a18ff..9a776a1 100644
--- a/arch/arm/mach-exynos/cpuidle.c
+++ b/arch/arm/mach-exynos/cpuidle.c
@@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void)
 		device->cpu = cpu_id;
 
 		/* Support IDLE only */
-		if (cpu_id != 0)
+		if (soc_is_exynos5440() || cpu_id != 0)
 			device->state_count = 1;
 
 		ret = cpuidle_register_device(device);
-- 
1.7.1
