From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] ARM: Exynos4: Universal C210 machine update
Date: Tue, 07 Jun 2011 09:02:56 +0200
Message-ID: <1307430179-15891-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38101 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910Ab1FGHDE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jun 2011 03:03:04 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LME00E75RL1IK@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:02 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LME00AMKRL0P6@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Jun 2011 08:03:00 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hello,

This is a short patch series that updates device definitions for
Universal C210 board. The series is based on kgene/for-next kernel tree.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center


Marek Szyprowski (3):
  ARM: Exynos4: Universal_C210: add FIMC device
  ARM: Exynos4: Universal_C210: add MCS Touchkey device
  ARM: Exynos4: Universal_C210: add qt602240 touch screen device

 arch/arm/mach-exynos4/Kconfig               |    7 ++
 arch/arm/mach-exynos4/mach-universal_c210.c |  108 +++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 0 deletions(-)

-- 
1.7.1.569.g6f426
