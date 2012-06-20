From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: SAMSUNG: Fix compilation error
Date: Wed, 20 Jun 2012 09:49:10 +0530
Message-ID: <1340165950-8996-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:37945 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab2FTEaw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 00:30:52 -0400
Received: by dady13 with SMTP id y13so9296546dad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jun 2012 21:30:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

=46ixes the following build error:
In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
                 from arch/arm/plat-samsung/include/plat/dma-ops.h:17,
                 from arch/arm/plat-samsung/include/plat/dma.h:128,
                 from sound/soc/samsung/pcm.c:23:
arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8: error: redefiniti=
on of =E2=80=98struct s3c2410_dma_client=E2=80=99
arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally defined=
 here

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/include/plat/dma.h |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/dma.h b/arch/arm/plat-s=
amsung/include/plat/dma.h
index 7b02143..fdf34bc 100644
--- a/arch/arm/plat-samsung/include/plat/dma.h
+++ b/arch/arm/plat-samsung/include/plat/dma.h
@@ -37,10 +37,7 @@ enum s3c2410_chan_op {
 	S3C2410_DMAOP_STARTED,		/* indicate channel started */
 };
=20
-struct s3c2410_dma_client {
-	char                *name;
-};
-
+struct s3c2410_dma_client;
 struct s3c2410_dma_chan;
 enum dma_ch;
=20
--=20
1.7.4.1
