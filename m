From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [RESEND][PATCH 0/3] dma: pl330: Simplify platform data for pl330 driver
Date: Tue, 23 Aug 2011 03:29:42 +0530
Message-ID: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31559 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668Ab1HVVnO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 17:43:14 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQC0064QN014SA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 06:43:13 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQC00M1CMZXIN@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 06:43:13 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, vinod.koul@intel.com

The rqtype parameter specified in platform data as part of the
'struct dma_pl330_peri' can be infered from the direction of the transfer
specified with transfer requests. So the rqtype parameter can be removed
and 'struct dma_pl330_peri' is then left with only one field 'peri_id'
which itself can be moved into 'struct dma_pl330_platdata' and the
entire 'struct dma_pl330_peri' can be eliminated.

This is first step towards adding device tree support for pl330 dma driver.
With rqtype information inferred from transfer requests, it need not be
included in device tree to describe each hardware dma request.

This patchset is based on following tree.
http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
and branch 'kgene/next/topic-dma-pl330'.

This patchset has been implemented and tested only for Exynos4. If this
patchset is acceptable, then pl330 driver platform data for other samsung
platforms will also be modfied.

Thomas Abraham (3):
  DMA: PL330: Infer transfer direction from transfer request instead of platform data
  ARM: SAMSUNG: Modify pl330 channel filter function
  ARM: EXYNOS4: Modify platform data for pl330 driver

 arch/arm/mach-exynos4/dma.c     |  220 +++++++++++----------------------------
 arch/arm/plat-samsung/dma-ops.c |    4 +-
 drivers/dma/pl330.c             |   56 ++--------
 include/linux/amba/pl330.h      |   14 +--
 4 files changed, 75 insertions(+), 219 deletions(-)
