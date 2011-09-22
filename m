From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH v3 0/2] Add TVOUT support for SMDKV310
Date: Thu, 22 Sep 2011 11:24:08 +0530
Message-ID: <1316670848-1581-1-git-send-email-hatim.rv@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42208 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750964Ab1IVFzI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 01:55:08 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRW00782TOL8KI0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 14:55:03 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRW00GAJTREJR20@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 22 Sep 2011 14:55:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: s.nawrocki@samsung.com, t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com

This is v3 of the TVOUT patch set for SMDKV310.
v1 is available at below link.
(http://www.spinics.net/lists/arm-kernel/msg138054.html)

Patch 1 has been modified according to the comments received from
Tomasz Stanislawski and Sylwester Nawrocki.

Patch 2 is a resend.

NOTE: This patch set has a dependency on "Setup consistent dma size at boot
time" by Tushar Behera.
(http://www.spinics.net/lists/linux-samsung-soc/msg06627.html)

Hatim Ali (2):
  ARM: EXYNOS4: Add TVOUT support for SMDKV310
  s5p-tv: Add PM_RUNTIME dependency

 arch/arm/mach-exynos4/Kconfig         |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c |   18 ++++++++++++++++++
 drivers/media/video/s5p-tv/Kconfig    |    2 +-
 3 files changed, 21 insertions(+), 1 deletions(-)

-- 
1.7.2.3
