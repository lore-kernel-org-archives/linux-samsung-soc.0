From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ASoC: Samsung: Trivial cleanups in header files
Date: Thu, 26 Dec 2013 11:41:29 +0530
Message-ID: <1388038289-8953-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:36961 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778Ab3LZGO6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Dec 2013 01:14:58 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so7909024pbc.15
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Dec 2013 22:14:57 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: alsa-devel@alsa-project.org
Cc: linux-samsung-soc@vger.kernel.org, broonie@kernel.org, sachin.kamat@linaro.org, patches@linaro.org

commit 5d229ce569be ("ASoC: samsung: move plat/ headers to local directory")
moved the header files but forgot to clean the pointers to their old locaton.
Remove them now.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 sound/soc/samsung/regs-ac97.h |    9 ++++-----
 sound/soc/samsung/regs-iis.h  |    9 ++++-----
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/samsung/regs-ac97.h b/sound/soc/samsung/regs-ac97.h
index c3878f7acb83..a71be45bbffc 100644
--- a/sound/soc/samsung/regs-ac97.h
+++ b/sound/soc/samsung/regs-ac97.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/regs-ac97.h
- *
+/*
  * Copyright (c) 2006 Simtec Electronics <linux@simtec.co.uk>
  *		http://www.simtec.co.uk/products/SWLINUX/
  *
@@ -10,8 +9,8 @@
  * S3C2440 AC97 Controller
 */
 
-#ifndef __ASM_ARCH_REGS_AC97_H
-#define __ASM_ARCH_REGS_AC97_H __FILE__
+#ifndef __SAMSUNG_REGS_AC97_H__
+#define __SAMSUNG_REGS_AC97_H__
 
 #define S3C_AC97_GLBCTRL				(0x00)
 
@@ -64,4 +63,4 @@
 #define S3C_AC97_PCM_DATA				(0x18)
 #define S3C_AC97_MIC_DATA				(0x1C)
 
-#endif /* __ASM_ARCH_REGS_AC97_H */
+#endif /* __SAMSUNG_REGS_AC97_H__ */
diff --git a/sound/soc/samsung/regs-iis.h b/sound/soc/samsung/regs-iis.h
index a18d35e7a735..dc6cbbe9c4f0 100644
--- a/sound/soc/samsung/regs-iis.h
+++ b/sound/soc/samsung/regs-iis.h
@@ -1,5 +1,4 @@
-/* arch/arm/plat-samsung/include/plat/regs-iis.h
- *
+/*
  * Copyright (c) 2003 Simtec Electronics <linux@simtec.co.uk>
  *		      http://www.simtec.co.uk/products/SWLINUX/
  *
@@ -10,8 +9,8 @@
  * S3C2410 IIS register definition
 */
 
-#ifndef __ASM_ARCH_REGS_IIS_H
-#define __ASM_ARCH_REGS_IIS_H
+#ifndef __SAMSUNG_REGS_IIS_H__
+#define __SAMSUNG_REGS_IIS_H__
 
 #define S3C2410_IISCON			(0x00)
 
@@ -67,4 +66,4 @@
 
 #define S3C2410_IISFIFO			(0x10)
 
-#endif /* __ASM_ARCH_REGS_IIS_H */
+#endif /* __SAMSUNG_REGS_IIS_H__ */
-- 
1.7.9.5
