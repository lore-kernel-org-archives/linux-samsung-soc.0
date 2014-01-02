From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 4/5] ARM: S5PV210: Remove incorrect file references
Date: Thu,  2 Jan 2014 14:24:17 +0530
Message-ID: <1388652858-25337-4-git-send-email-sachin.kamat@linaro.org>
References: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:44642 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaABI6K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 03:58:10 -0500
Received: by mail-pd0-f180.google.com with SMTP id q10so13890820pdj.25
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2014 00:58:10 -0800 (PST)
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
 arch/arm/mach-s5pv210/setup-fb-24bpp.c   |    3 +--
 arch/arm/mach-s5pv210/setup-sdhci-gpio.c |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5pv210/setup-fb-24bpp.c b/arch/arm/mach-s5pv210/setup-fb-24bpp.c
index 55103c8220b3..45f05759cb4f 100644
--- a/arch/arm/mach-s5pv210/setup-fb-24bpp.c
+++ b/arch/arm/mach-s5pv210/setup-fb-24bpp.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5pv210/setup-fb-24bpp.c
- *
+/*
  * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
diff --git a/arch/arm/mach-s5pv210/setup-sdhci-gpio.c b/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
index 0512ada00522..cece6767eced 100644
--- a/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s5pc1xx/setup-sdhci-gpio.c
- *
+/*
  * Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com/
  *
-- 
1.7.9.5
