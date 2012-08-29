From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/2] ARM: EXYNOS: Set the capability of pdm0 and pdm1 as DMA_PRIVATE
Date: Wed, 29 Aug 2012 10:16:23 +0530
Message-ID: <1346215585-31023-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:35290 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943Ab2H2Esv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 00:48:51 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr13so461235pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Aug 2012 21:48:51 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: vinod.koul@intel.com, kgene.kim@samsung.com, jaswinder.singh@linaro.org, patches@linaro.org

DMA clients pdma0 and pdma1 are internal to the SoC and are used only
by dedicated peripherals. Since they cannot be used for generic
purpose, their capability should be set as DMA_PRIVATE.

The patches are rebased on top of v3.6-rc3.

Tushar Behera (2):
  ARM: EXYNOS: Set the capability of pdm0 and pdm1 as DMA_PRIVATE
  DMA: PL330: Set the capability of pdm0 and pdm1 as DMA_PRIVATE

 arch/arm/mach-exynos/dma.c |    2 ++
 drivers/dma/pl330.c        |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.4.1
