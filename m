From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 0/2] S5P-TV support for Exynos Nuri and Universal boards
Date: Thu, 26 Jan 2012 18:13:29 +0100
Message-ID: <1327598012-30467-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44419 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752563Ab2AZRNm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 12:13:42 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYF000LK16S32@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2012 17:13:40 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYF004XW16SZ5@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2012 17:13:40 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com

Hello,

This patch series contains platform definitions for s5p-tv driver. It includes
fixes to HDMI support on Exynos Universal.  It adds S5P-TV support on Nuri
board.

Please refer to patchset 'Updates to S5P-TV drivers' on linux-media where
definitions of platform data for SII0234 were introduced.

Regards
Tomasz Stanislawski

Tomasz Stanislawski (2):
  ARM: Exynos4: enable TV support on Nuri board
  ARM: Exynos4: fix TV support on Universal_C210 board

 arch/arm/mach-exynos/Kconfig               |    2 +
 arch/arm/mach-exynos/mach-nuri.c           |   99 ++++++++++++++++++++++++++++
 arch/arm/mach-exynos/mach-universal_c210.c |   14 ++++
 3 files changed, 115 insertions(+), 0 deletions(-)

-- 
1.7.5.4
