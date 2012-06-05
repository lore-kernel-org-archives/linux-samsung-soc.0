From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S5P64X0: Remove unused variable in dma.c file
Date: Tue,  5 Jun 2012 10:08:08 +0530
Message-ID: <1338871088-15668-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:49509 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751675Ab2FEEtK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jun 2012 00:49:10 -0400
Received: by dady13 with SMTP id y13so6797622dad.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jun 2012 21:49:10 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, jaswinder.singh@linaro.org, sachin.kamat@linaro.org, patches@linaro.org

=46ixes the following warning:
arch/arm/mach-s5p64x0/dma.c:39:12: warning: =E2=80=98dma_dmamask=E2=80=99=
 defined but not used [-Wunused-variable]

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5p64x0/dma.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/dma.c b/arch/arm/mach-s5p64x0/dma.c
index 2ee5dc0..9c4ce08 100644
--- a/arch/arm/mach-s5p64x0/dma.c
+++ b/arch/arm/mach-s5p64x0/dma.c
@@ -36,8 +36,6 @@
 #include <plat/devs.h>
 #include <plat/irqs.h>
=20
-static u64 dma_dmamask =3D DMA_BIT_MASK(32);
-
 static u8 s5p6440_pdma_peri[] =3D {
 	DMACH_UART0_RX,
 	DMACH_UART0_TX,
--=20
1.7.4.1
