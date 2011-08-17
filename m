From: alim akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 0/3] ARM: SAMSUNG: register the second instance of PL330 DMAC
Date: Wed, 17 Aug 2011 09:36:06 +0530
Message-ID: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55981 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1HQEF0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 00:05:26 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ2000UW0OUH790@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Aug 2011 13:05:24 +0900 (KST)
Received: from alim.sisodomain.com ([107.108.73.28])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ200DNO0OF9I@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Aug 2011 13:05:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: boojin.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

Two instance of platform data is provided for PL330 but only one PL330 DMAC 
instance is registered with amba_device.
These patch sets registers the second instance with amba_device.

These patches are based on kgene's tree next/topic-dma-pl330 branch.
http://git.kernel.org/?p=linux/kernel/git/kgene/linux-samsung.git;;a=summary

Alim Akhtar (3):
  ARM: EXYNOS4: register the second instance of pl330 DMAC
  ARM: S5PV210: register the second instance of pl330 DMAC
  ARM: S5PC100: register the second instance of pl330 DMAC

 arch/arm/mach-exynos4/dma.c |    1 +
 arch/arm/mach-s5pc100/dma.c |    1 +
 arch/arm/mach-s5pv210/dma.c |    1 +
 3 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.2.3
