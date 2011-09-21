From: Hatim Ali <hatim.rv@samsung.com>
Subject: [PATCH V2 0/3] Add TVOUT support for SMDKV310
Date: Wed, 21 Sep 2011 11:14:17 +0530
Message-ID: <1316583860-32510-1-git-send-email-hatim.rv@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52777 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751622Ab1IUFpo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 01:45:44 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRU003LQYO7EB00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:45:43 +0900 (KST)
Received: from hatim-linux.sisodomain.com ([107.108.73.95])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRU0000KYO05M@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Sep 2011 14:45:43 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: t.stanislaws@samsung.com, mchehab@infradead.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, banajit.g@samsung.com, Hatim Ali <hatim.rv@samsung.com>

This is v2 of the TVOUT patch set for SMDKV310.
v1 is available at below link.
(http://www.spinics.net/lists/arm-kernel/msg138054.html)

Patch 1 has been modified according to the comments received from
Tomasz Stanislawski.
Patches 2 and 3 are RESENDs.

Hatim Ali (3):
  ARM: EXYNOS4: Add TVOUT support for SMDKV310
  ARM: EXYNOS4: Update consistent DMA size to 8MB
  s5p-tv: Add PM_RUNTIME dependency

 arch/arm/mach-exynos4/Kconfig               |    2 ++
 arch/arm/mach-exynos4/include/mach/memory.h |    2 ++
 arch/arm/mach-exynos4/mach-smdkv310.c       |   25 +++++++++++++++++++++++++
 drivers/media/video/s5p-tv/Kconfig          |    2 +-
 4 files changed, 30 insertions(+), 1 deletions(-)

-- 
1.7.2.3
