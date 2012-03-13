From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix compilation warning in dma.c
Date: Tue, 13 Mar 2012 12:10:12 +0530
Message-ID: <1331620812-10982-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40736 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751780Ab2CMGr0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 02:47:26 -0400
Received: by dajr28 with SMTP id r28so393615daj.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 23:47:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jaswinder.singh@linaro.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The following warning is fixed in dma.c file:
"warning: =E2=80=98dma_dmamask=E2=80=99 defined but not used [-Wunused-=
variable]"

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/dma.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/dma.c b/arch/arm/mach-exynos/dma.c
index 13607c4..d3ed1fb 100644
--- a/arch/arm/mach-exynos/dma.c
+++ b/arch/arm/mach-exynos/dma.c
@@ -35,8 +35,6 @@
 #include <mach/irqs.h>
 #include <mach/dma.h>
=20
-static u64 dma_dmamask =3D DMA_BIT_MASK(32);
-
 static u8 exynos4210_pdma0_peri[] =3D {
 	DMACH_PCM0_RX,
 	DMACH_PCM0_TX,
--=20
1.7.4.1
