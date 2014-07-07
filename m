From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v6 6/6] ARM: EXYNOS: Remove "linux/bug.h" from pmu.c
Date: Mon, 07 Jul 2014 09:20:56 +0530
Message-ID: <1404705056-11965-7-git-send-email-pankaj.dubey@samsung.com>
References: <1404705056-11965-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1404705056-11965-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, chow.kim@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch removes unnecessary header file inclusion from pmu.c.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/pmu.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index fb0deda..dcfcb44 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -11,7 +11,6 @@
 
 #include <linux/io.h>
 #include <linux/kernel.h>
-#include <linux/bug.h>
 
 #include "common.h"
 #include "regs-pmu.h"
-- 
1.7.9.5
