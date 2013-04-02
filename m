From: Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 0/2] Support device_prep_dma_sg for pl330
Date: Tue, 02 Apr 2013 21:01:14 +0900
Message-ID: <1364904076-3130-1-git-send-email-chanho61.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18305 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754730Ab3DBMC2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 08:02:28 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKM00B9GMRREYR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 21:02:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com
Cc: boojin.kim@samsung.com, jaswinder.singh@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, Chanho Park <chanho61.park@samsung.com>

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
