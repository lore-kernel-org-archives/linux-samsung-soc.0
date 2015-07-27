From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 01/12] ARM: SAMSUNG: local regs-srom header in mach-exynos
Date: Mon, 27 Jul 2015 23:57:09 +0900
Message-ID: <013a01d0c87c$854d4d00$8fe7e700$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39481 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753840AbbG0O5P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:57:15 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS501567IVDXSC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:57:13 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>


This patch moves regs-srom header file into mach-exynos.

c: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/{plat-samsung/include/plat => mach-exynos}/regs-srom.h | 3 +--
 arch/arm/mach-exynos/suspend.c                                  | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename arch/arm/{plat-samsung/include/plat => mach-exynos}/regs-srom.h (96%)

diff --git a/arch/arm/plat-samsung/include/plat/regs-srom.h b/arch/arm/mach-exynos/regs-srom.h
similarity index 96%
rename from arch/arm/plat-samsung/include/plat/regs-srom.h
rename to arch/arm/mach-exynos/regs-srom.h
index 9b6729c..5c4d442 100644
--- a/arch/arm/plat-samsung/include/plat/regs-srom.h
+++ b/arch/arm/mach-exynos/regs-srom.h
@@ -1,5 +1,4 @@
-/* linux/arch/arm/plat-samsung/include/plat/regs-srom.h
- *
+/*
  * Copyright (c) 2010 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index c506f8e..e00eb39 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -32,11 +32,11 @@
 #include <asm/suspend.h>
 
 #include <plat/pm-common.h>
-#include <plat/regs-srom.h>
 
 #include "common.h"
-#include "regs-pmu.h"
 #include "exynos-pmu.h"
+#include "regs-pmu.h"
+#include "regs-srom.h"
 
 #define REG_TABLE_END (-1U)
 
-- 
2.0.0
