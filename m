From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/2] ASOC: SAMSUNG: Add dt support for i2s
Date: Wed, 25 Jul 2012 17:39:28 +0530
Message-ID: <1343218170-30483-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61980 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756558Ab2GYMEz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jul 2012 08:04:55 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7P00EJ8TJXA1Q0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jul 2012 21:04:54 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7P003XATJZ9260@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jul 2012 21:04:54 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: padma.v@samsung.com, rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, thutt@chromium.org, joshi@samsung.com

This patch series adds device tree based discovery support for Samsung's
i2s controller. This is tested on Exynos5250 with 8994 codec for playback
and capturing modes on 3.5.0-rc7

Padmavathi Venna (2):
  ASOC: SAMSUNG: Add DT support for i2s
  ASOC: SAMSUNG: Add dma_prop variable in s3c_dma_params

 .../devicetree/bindings/sound/samsung-i2s.txt      |   62 ++++++
 sound/soc/samsung/dma.c                            |    1 +
 sound/soc/samsung/dma.h                            |    1 +
 sound/soc/samsung/i2s.c                            |  228 +++++++++++++++-----
 4 files changed, 243 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt

-- 
1.7.4.4
