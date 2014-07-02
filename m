From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Wed,  2 Jul 2014 11:57:21 +0200
Message-ID: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:36745 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228AbaGBJ5h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 05:57:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

ARCH_EXYNOS doesn't select NEED_MACH_MEMORY_H, so <asm/memory.h> doesn'=
t
include <mach/memory.h> and so this file is not used and can go away.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm/mach-exynos/include/mach/memory.h | 27 ----------------------=
-----
 1 file changed, 27 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/memory.h

diff --git a/arch/arm/mach-exynos/include/mach/memory.h b/arch/arm/mach=
-exynos/include/mach/memory.h
deleted file mode 100644
index 2a4cdb7cb326..000000000000
--- a/arch/arm/mach-exynos/include/mach/memory.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* linux/arch/arm/mach-exynos4/include/mach/memory.h
- *
- * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * EXYNOS4 - Memory definitions
- *
- * This program is free software; you can redistribute it and/or modif=
y
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_ARCH_MEMORY_H
-#define __ASM_ARCH_MEMORY_H __FILE__
-
-#define PLAT_PHYS_OFFSET		UL(0x40000000)
-
-#ifndef CONFIG_ARM_LPAE
-/* Maximum of 256MiB in one bank */
-#define MAX_PHYSMEM_BITS	32
-#define SECTION_SIZE_BITS	28
-#else
-#define MAX_PHYSMEM_BITS	36
-#define SECTION_SIZE_BITS	31
-#endif
-
-#endif /* __ASM_ARCH_MEMORY_H */
--=20
2.0.0
