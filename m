From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: S5PV210: Fix compiler warning in dma.c file
Date: Mon,  9 Apr 2012 09:56:37 +0530
Message-ID: <1333945597-28243-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:40054 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809Ab2DIEe5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Apr 2012 00:34:57 -0400
Received: by dake40 with SMTP id e40so4795909dak.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Apr 2012 21:34:57 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

=46ixes the following warning:

warning: =E2=80=98dma_dmamask=E2=80=99 defined but not used [-Wunused-v=
ariable]

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/dma.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/dma.c b/arch/arm/mach-s5pv210/dma.c
index 86ce62f..b8337e2 100644
--- a/arch/arm/mach-s5pv210/dma.c
+++ b/arch/arm/mach-s5pv210/dma.c
@@ -33,8 +33,6 @@
 #include <mach/irqs.h>
 #include <mach/dma.h>
=20
-static u64 dma_dmamask =3D DMA_BIT_MASK(32);
-
 static u8 pdma0_peri[] =3D {
 	DMACH_UART0_RX,
 	DMACH_UART0_TX,
--=20
1.7.4.1
