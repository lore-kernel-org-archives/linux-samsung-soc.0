From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S5PV210: Re-organize s5p_hdmi_setname
Date: Mon, 30 Dec 2013 15:35:52 +0530
Message-ID: <1388397952-31925-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:54221 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051Ab3L3KJc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:09:32 -0500
Received: by mail-pa0-f47.google.com with SMTP id kq14so11387412pab.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:09:31 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The only user of s5p_hdmi_setname is s5pv210. Inline this function
in the caller file and delete the header file (as other functions
defined in this header are not called anywhere).

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/common.c               |    8 ++++-
 arch/arm/plat-samsung/include/plat/tv-core.h |   44 --------------------------
 2 files changed, 7 insertions(+), 45 deletions(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/tv-core.h

diff --git a/arch/arm/mach-s5pv210/common.c b/arch/arm/mach-s5pv210/common.c
index 26027a29b8a1..9a30bc45400d 100644
--- a/arch/arm/mach-s5pv210/common.c
+++ b/arch/arm/mach-s5pv210/common.c
@@ -44,7 +44,6 @@
 #include <plat/iic-core.h>
 #include <plat/keypad-core.h>
 #include <plat/pwm-core.h>
-#include <plat/tv-core.h>
 #include <plat/spi-core.h>
 #include <plat/regs-serial.h>
 
@@ -174,6 +173,13 @@ void __init samsung_timer_init(void)
 					timer_irqs, &s5pv210_pwm_variant);
 }
 
+static inline void s5p_hdmi_setname(char *name)
+{
+#ifdef CONFIG_S5P_DEV_TV
+	s5p_device_hdmi.name = name;
+#endif
+}
+
 /*
  * s5pv210_map_io
  *
diff --git a/arch/arm/plat-samsung/include/plat/tv-core.h b/arch/arm/plat-samsung/include/plat/tv-core.h
deleted file mode 100644
index 3bc34f3ce28f..000000000000
--- a/arch/arm/plat-samsung/include/plat/tv-core.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * arch/arm/plat-samsung/include/plat/tv.h
- *
- * Copyright 2011 Samsung Electronics Co., Ltd.
- *	Tomasz Stanislawski <t.stanislaws@samsung.com>
- *
- * Samsung TV driver core functions
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#ifndef __SAMSUNG_PLAT_TV_H
-#define __SAMSUNG_PLAT_TV_H __FILE__
-
-/*
- * These functions are only for use with the core support code, such as
- * the CPU-specific initialization code.
- */
-
-/* Re-define device name to differentiate the subsystem in various SoCs. */
-static inline void s5p_hdmi_setname(char *name)
-{
-#ifdef CONFIG_S5P_DEV_TV
-	s5p_device_hdmi.name = name;
-#endif
-}
-
-static inline void s5p_mixer_setname(char *name)
-{
-#ifdef CONFIG_S5P_DEV_TV
-	s5p_device_mixer.name = name;
-#endif
-}
-
-static inline void s5p_sdo_setname(char *name)
-{
-#ifdef CONFIG_S5P_DEV_TV
-	s5p_device_sdo.name = name;
-#endif
-}
-
-#endif /* __SAMSUNG_PLAT_TV_H */
-- 
1.7.9.5
