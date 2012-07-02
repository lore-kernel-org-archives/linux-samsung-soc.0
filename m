From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Add missing .reserve field to SMDKC210
Date: Mon,  2 Jul 2012 14:33:11 +0530
Message-ID: <1341219791-17202-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:34388 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932310Ab2GBJPc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 05:15:32 -0400
Received: by dady13 with SMTP id y13so7133218dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jul 2012 02:15:32 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds missing .reserve field to SMDKC210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/mach-smdkv310.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 95ce9f6..2d34ec7 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -422,5 +422,6 @@ MACHINE_START(SMDKC210, "SMDKC210")
 	.init_machine	= smdkv310_machine_init,
 	.init_late	= exynos_init_late,
 	.timer		= &exynos4_timer,
+	.reserve	= &smdkv310_reserve,
 	.restart	= exynos4_restart,
 MACHINE_END
-- 
1.7.4.1
