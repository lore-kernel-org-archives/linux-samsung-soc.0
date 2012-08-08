From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ASoC: Samsung: Fix build error
Date: Wed,  8 Aug 2012 11:34:43 +0530
Message-ID: <1344405883-27603-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:36058 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415Ab2HHGGQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 02:06:16 -0400
Received: by pbbrr13 with SMTP id rr13so926142pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Aug 2012 23:06:16 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, sachin.kamat@linaro.org, patches@linaro.org, sbkim73@samsung.com

=46ixes the following build error:
In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
		from arch/arm/plat-samsung/include/plat/dma-ops.h:17,
		from arch/arm/plat-samsung/include/plat/dma.h:128,
		from sound/soc/samsung/pcm.c:23:
arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8:
			error: redefinition of =E2=80=98struct s3c2410_dma_client=E2=80=99
arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally defined=
 here
make[3]: *** [sound/soc/samsung/pcm.o] Error 1

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
---
 sound/soc/samsung/pcm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index b7b2a1f..89b0646 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -20,7 +20,7 @@
 #include <sound/pcm_params.h>
=20
 #include <plat/audio.h>
-#include <plat/dma.h>
+#include <mach/dma.h>
=20
 #include "dma.h"
 #include "pcm.h"
--=20
1.7.4.1
