From: Kukjin Kim <kgene@kernel.org>
Subject: [PATCH 12/12] ARM: SAMSUNG: remove keypad-core header in plat-samsung
Date: Mon, 27 Jul 2015 23:59:13 +0900
Message-ID: <014501d0c87c$ccee3ed0$66cabc70$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33052 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbbG0O7O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jul 2015 10:59:14 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NS502WOXIYPHD00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Jul 2015 23:59:13 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, jy0922.shim@samsung.com


Since keypad-core header is not used, this patch removes it.

Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/plat-samsung/include/plat/keypad-core.h | 31 ------------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/keypad-core.h

diff --git a/arch/arm/plat-samsung/include/plat/keypad-core.h b/arch/arm/plat-samsung/include/plat/keypad-core.h
deleted file mode 100644
index d513e1b..0000000
--- a/arch/arm/plat-samsung/include/plat/keypad-core.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * linux/arch/arm/plat-samsung/include/plat/keypad-core.h
- *
- * Copyright (C) 2010 Samsung Electronics Co.Ltd	
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- *
- * Samsung keypad controller core function
- *
- *  This program is free software; you can redistribute  it and/or modify it
- *  under  the terms of  the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the  License, or (at your
- *  option) any later version.
- *
- */
-
-#ifndef __ASM_ARCH_KEYPAD_CORE_H
-#define __ASM_ARCH_KEYPAD_CORE_H
-
-/* These function are only for use with the core support code, such as
- * the cpu specific initialisation code
- */
-
-/* re-define device name depending on support. */
-static inline void samsung_keypad_setname(char *name)
-{
-#ifdef CONFIG_SAMSUNG_DEV_KEYPAD
-	samsung_device_keypad.name = name;
-#endif
-}
-
-#endif /* __ASM_ARCH_KEYPAD_CORE_H */
-- 
2.0.0
