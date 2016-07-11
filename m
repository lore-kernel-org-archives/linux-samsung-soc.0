From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] ARM: s3c64xx: smartq: Avoid sparse warnings
Date: Mon, 11 Jul 2016 10:48:36 +0200
Message-ID: <20160711084836.12835-1-thierry.reding@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34435 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752838AbcGKIsj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jul 2016 04:48:39 -0400
Received: by mail-wm0-f66.google.com with SMTP id w75so14900497wmd.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Jul 2016 01:48:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The smartq_map_io() and smartq_machine_init() functions are used by both
SmartQ 5 and SmartQ 7 machines and exported via the mach-smartq.h header
file. However that header file is not included by the mach-smartq.c file
that implements them, causing sparse warnings.

Include mach-smartq.h from mach-smartq.c to fix these warnings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/mach-s3c64xx/mach-smartq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/mach-smartq.c b/arch/arm/mach-s3c64xx/mach-smartq.c
index 936a63fc68d5..e0e1a729ef98 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq.c
@@ -43,6 +43,7 @@
 #include <plat/samsung-time.h>
 
 #include "common.h"
+#include "mach-smartq.h"
 #include "regs-modem.h"
 
 #define UCON S3C2410_UCON_DEFAULT
-- 
2.8.3
