From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH-RESEND 0/2] Support device_prep_dma_sg for pl330
Date: Fri, 09 Aug 2013 20:11:32 +0900
Message-ID: <1376046694-2638-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59058 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967445Ab3HILLs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Aug 2013 07:11:48 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MR900KAUGEZLSP0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 09 Aug 2013 20:11:47 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com
Cc: jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, Chanho Park <chanho61.park@samsung.com>

This patchset support device_prep_dma_sg functionality for pl330 dmaengine
driver. The prep_dma_sg function prepares descriptors to transfer between src
and dest memory which consists of scatter/gather list. The patchset contains
code clean-up to eliminate duplications.

Chanho Park (2):
  dma: pl330: split off common code to give back descriptors
  dma: pl330: add pl330_prep_dma_sg to transfer from sglist to sglist

 drivers/dma/pl330.c |  209 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 157 insertions(+), 52 deletions(-)

-- 
1.7.9.5
