From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/5] ARM: S3C24XX: Remove incorrect file references
Date: Thu,  2 Jan 2014 14:24:15 +0530
Message-ID: <1388652858-25337-2-git-send-email-sachin.kamat@linaro.org>
References: <1388652858-25337-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:60236 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaABI6F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jan 2014 03:58:05 -0500
Received: by mail-pb0-f41.google.com with SMTP id jt11so14291627pbb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jan 2014 00:58:04 -0800 (PST)
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
 arch/arm/mach-s3c24xx/clock-s3c244x.c        |    3 +--
 arch/arm/mach-s3c24xx/common-smdk.c          |    3 +--
 arch/arm/mach-s3c24xx/common.c               |    3 +--
 arch/arm/mach-s3c24xx/include/mach/pm-core.h |    5 ++---
 arch/arm/mach-s3c24xx/irq-pm.c               |    3 +--
 arch/arm/mach-s3c24xx/pm.c                   |    3 +--
 arch/arm/mach-s3c24xx/s3c244x.c              |    3 +--
 arch/arm/mach-s3c24xx/setup-i2c.c            |    3 +--
 arch/arm/mach-s3c24xx/setup-sdhci-gpio.c     |    3 +--
 arch/arm/mach-s3c24xx/setup-ts.c             |    3 +--
 arch/arm/mach-s3c24xx/simtec-audio.c         |    3 +--
 arch/arm/mach-s3c24xx/simtec-pm.c            |    3 +--
 arch/arm/mach-s3c24xx/sleep.S                |    3 +--
 13 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/clock-s3c244x.c b/arch/arm/mach-s3c24xx/clock-s3c244x.c
index 6d9b688c442b..b7da7454f135 100644
--- a/arch/arm/mach-s3c24xx/clock-s3c244x.c
+++ b/arch/arm/mach-s3c24xx/clock-s3c244x.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/s3c24xx-clock.c
- *
+/*
  * Copyright (c) 2004-2008 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c24xx/common-smdk.c b/arch/arm/mach-s3c24xx/common-smdk.c
index 0a84a9c9f429..b31d70cada72 100644
--- a/arch/arm/mach-s3c24xx/common-smdk.c
+++ b/arch/arm/mach-s3c24xx/common-smdk.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/common-smdk.c
- *
+/*
  * Copyright (c) 2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index 4adaa4b43ffe..967cb8661206 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/cpu.c
- *
+/*
  * Copyright (c) 2004-2005 Simtec Electronics
  *	http://www.simtec.co.uk/products/SWLINUX/
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c24xx/include/mach/pm-core.h b/arch/arm/mach-s3c24xx/include/mach/pm-core.h
index 2eef7e6f7675..e5a23cc5029a 100644
--- a/arch/arm/mach-s3c24xx/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c24xx/include/mach/pm-core.h
@@ -1,10 +1,9 @@
-/* linux/arch/arm/mach-s3c2410/include/pm-core.h
- *
+/*
  * Copyright 2008 Simtec Electronics
  *      Ben Dooks <ben@simtec.co.uk>
  *      http://armlinux.simtec.co.uk/
  *
- * S3C24xx - PM core support for arch/arm/plat-s3c/pm.c
+ * S3C24xx - PM core support for arch/arm/plat-samsung/pm.c
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/arch/arm/mach-s3c24xx/irq-pm.c b/arch/arm/mach-s3c24xx/irq-pm.c
index b91341ef2b2e..1cd4129cc48a 100644
--- a/arch/arm/mach-s3c24xx/irq-pm.c
+++ b/arch/arm/mach-s3c24xx/irq-pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/irq-om.c
- *
+/*
  * Copyright (c) 2003-2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *	http://armlinux.simtec.co.uk/
diff --git a/arch/arm/mach-s3c24xx/pm.c b/arch/arm/mach-s3c24xx/pm.c
index 2baa887b28d2..c88875a5eb87 100644
--- a/arch/arm/mach-s3c24xx/pm.c
+++ b/arch/arm/mach-s3c24xx/pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/pm.c
- *
+/*
  * Copyright (c) 2004-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/mach-s3c24xx/s3c244x.c b/arch/arm/mach-s3c24xx/s3c244x.c
index 911b555029fc..719f51d8e630 100644
--- a/arch/arm/mach-s3c24xx/s3c244x.c
+++ b/arch/arm/mach-s3c24xx/s3c244x.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/s3c244x.c
- *
+/*
  * Copyright (c) 2004-2006 Simtec Electronics
  *   Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/mach-s3c24xx/setup-i2c.c b/arch/arm/mach-s3c24xx/setup-i2c.c
index 3d1fd5ce24e5..d66335144b1f 100644
--- a/arch/arm/mach-s3c24xx/setup-i2c.c
+++ b/arch/arm/mach-s3c24xx/setup-i2c.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/setup-i2c.c
- *
+/*
  * Copyright 2008 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c b/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
index 2835241f732a..2c876edf27f0 100644
--- a/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s3c24xx/setup-sdhci-gpio.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c2416/setup-sdhci-gpio.c
- *
+/*
  * Copyright 2010 Promwad Innovation Company
  *	Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
  *
diff --git a/arch/arm/mach-s3c24xx/setup-ts.c b/arch/arm/mach-s3c24xx/setup-ts.c
index 1ea4056f6fdc..85858c769450 100644
--- a/arch/arm/mach-s3c24xx/setup-ts.c
+++ b/arch/arm/mach-s3c24xx/setup-ts.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/setup-ts.c
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *                     http://www.samsung.com/
  *
diff --git a/arch/arm/mach-s3c24xx/simtec-audio.c b/arch/arm/mach-s3c24xx/simtec-audio.c
index 67cb5120dfeb..538d51637538 100644
--- a/arch/arm/mach-s3c24xx/simtec-audio.c
+++ b/arch/arm/mach-s3c24xx/simtec-audio.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/simtec-audio.c
- *
+/*
  * Copyright (c) 2009 Simtec Electronics
  *	http://armlinux.simtec.co.uk/
  *	Ben Dooks <ben@simtec.co.uk>
diff --git a/arch/arm/mach-s3c24xx/simtec-pm.c b/arch/arm/mach-s3c24xx/simtec-pm.c
index 38a2f1fdebab..fc9cddbd699f 100644
--- a/arch/arm/mach-s3c24xx/simtec-pm.c
+++ b/arch/arm/mach-s3c24xx/simtec-pm.c
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/pm-simtec.c
- *
+/*
  * Copyright 2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
diff --git a/arch/arm/mach-s3c24xx/sleep.S b/arch/arm/mach-s3c24xx/sleep.S
index 7f378b662da6..e8f45672141a 100644
--- a/arch/arm/mach-s3c24xx/sleep.S
+++ b/arch/arm/mach-s3c24xx/sleep.S
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-s3c24xx/sleep.S
- *
+/*
  * Copyright (c) 2004 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
-- 
1.7.9.5
