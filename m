From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 5/5] ARM: S5PC100: Remove incorrect file references
Date: Thu,  2 Jan 2014 14:24:18 +0530
Message-ID: <1388652858-25337-5-git-send-email-sachin.kamat@linaro.org>
References: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:62142 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432AbaABI6N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 03:58:13 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so14178444pbb.17
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2014 00:58:12 -0800 (PST)
In-Reply-To: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The incorrect references are as a result of file/folder movements/renaming.
Since the references do not convey any useful information, remove them
altogether rather than fixing to ease future maintenance.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    3 +--
 arch/arm/mach-s5pc100/setup-sdhci-gpio.c       |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
index 0bf73209ec7b..40ec82ed105d 100644
--- a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
+++ b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5pc100/include/plat/regs-gpio.h
- *
+/*
  * Copyright 2009 Samsung Electronics Co.
  *      Byungho Min <bhmin@samsung.com>
  *
diff --git a/arch/arm/mach-s5pc100/setup-sdhci-gpio.c b/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
index 6010c0310cb5..ad90c1a19d1f 100644
--- a/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5pc100/setup-sdhci-gpio.c
- *
+/*
  * Copyright 2009 Samsung Eletronics
  *
  * S5PC100 - Helper functions for setting up SDHCI device(s) GPIO (HSMMC)
-- 
1.7.9.5
