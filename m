From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Remove unused header file from pm_domains.c
Date: Mon, 30 Dec 2013 15:45:39 +0530
Message-ID: <1388398539-23121-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:48681 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755536Ab3L3KTP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:19:15 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so11212018pde.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:19:14 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

plat/devs.h is not required in this file.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---

Based on top of next-20131224.


 arch/arm/mach-exynos/pm_domains.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
index 8fd2488..fe6570e 100644
--- a/arch/arm/mach-exynos/pm_domains.c
+++ b/arch/arm/mach-exynos/pm_domains.c
@@ -22,8 +22,6 @@
 #include <linux/of_platform.h>
 #include <linux/sched.h>
 
-#include <plat/devs.h>
-
 #include "regs-pmu.h"
 
 /*
-- 
1.7.9.5
