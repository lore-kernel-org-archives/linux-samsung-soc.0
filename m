From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/3] Add pl330 residue support
Date: Wed, 11 Sep 2013 11:38:02 +0530
Message-ID: <1378879685-5352-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32576 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751819Ab3IKGIk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 02:08:40 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MSY0091Y6E8DHJ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Sep 2013 15:08:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, vinod.koul@intel.com, kgene.kim@samsung.com, arnd@arndb.de, dgreid@chromium.org, olofj@chromium.org

This patch set adds support for finding the remaining number of bytes
in the current transfer and fills txstate.residue with the amount of
bytes remaining. Although Samsung specific dma operations will be
removed in future, the residue specific patches are required. So when
we add support for generic dma engine these patches have to be ported
accordingly.

Dylan Reid (3):
  dmaengine: pl330: Set residue in tx_status callback.
  ARM: SAMSUNG: Add residue DMA operation.
  ASoC: Update pointer to account for pending dma transfers.

 arch/arm/plat-samsung/dma-ops.c              |   14 +++++++
 arch/arm/plat-samsung/include/plat/dma-ops.h |    1 +
 drivers/dma/pl330.c                          |   55 +++++++++++++++++++++++++-
 sound/soc/samsung/dma.c                      |   27 +++++++++----
 4 files changed, 88 insertions(+), 9 deletions(-)

-- 
1.7.4.4
