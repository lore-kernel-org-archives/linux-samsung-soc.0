From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ARM: exynos: clarify KEYBOARD_SAMSUNG selection
Date: Thu, 11 Feb 2016 16:30:56 +0100
Message-ID: <1455204662-1017820-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:64778 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbcBKPbq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Feb 2016 10:31:46 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

The samsung-keypad driver is implicitly selected by ARCH_EXYNOS4 (why?),
but this fails if CONFIG_INPUT is a loadable module:

drivers/input/built-in.o: In function `samsung_keypad_remove':
drivers/input/keyboard/samsung-keypad.c:461: undefined reference to `input_unregister_device'
drivers/input/built-in.o: In function `samsung_keypad_irq':
drivers/input/keyboard/samsung-keypad.c:137: undefined reference to `input_event'
drivers/input/built-in.o: In function `samsung_keypad_irq':
include/linux/input.h:389: undefined reference to `input_event'
drivers/input/built-in.o: In function `samsung_keypad_probe':
drivers/input/keyboard/samsung-keypad.c:358: undefined reference to `devm_input_allocate_device'
drivers/input/built-in.o:(.debug_addr+0x34): undefined reference to `input_set_capability'

This changes the 'select' statement so we don't do it if CONFIG_INPUT=m.
The problem does not happen on mainline kernels, as we don't normally
build built-in input drivers when CONFIG_INPUT=m, but I am experimenting
with a patch to change this, and the samsung keypad driver showed up
as one example that was silently broken before.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-exynos/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 8434a0f6334c..b63e64581c24 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -59,7 +59,7 @@ config ARCH_EXYNOS4
 	select CLKSRC_SAMSUNG_PWM if CPU_EXYNOS4210
 	select CPU_EXYNOS4210
 	select GIC_NON_BANKED
-	select KEYBOARD_SAMSUNG if INPUT_KEYBOARD
+	select KEYBOARD_SAMSUNG if INPUT=y && INPUT_KEYBOARD
 	select MIGHT_HAVE_CACHE_L2X0
 	help
 	  Samsung EXYNOS4 (Cortex-A9) SoC based systems
-- 
2.7.0
