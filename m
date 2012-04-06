From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/4] ARM: Exynos4: NURI and UniversalC210 fixes for v3.4-rc2
Date: Fri, 06 Apr 2012 09:43:22 +0200
Message-ID: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48448 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752946Ab2DFHnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 03:43:35 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M2100ECRS4G57@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:28 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M21003HIS4IAJ@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:30 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hi Kukjin,

I've just checked the support for Samsung NURI and UniversalC210 boards
in v3.4-rc1 and found some issues. The attached patches fixes the
leftovers from missing s3c-sdhci driver changes, fixes division by
zero caused by missing initial value for xusbxti clock and removes broken
optional configuration entries for touch screen driver. It would be great
if the attached patches will get merged to v3.4-rcX series.

Best regards,
Marek Szyprowski


Patch summary:

Marek Szyprowski (4):
  ARM: Exynos4: fix SDHCI support on NURI & UniversalC210 boards
  ARM: Exynos4: fix regulator name for NURI board
  ARM: Exynos4: set fix xusbxti clock for NURI and Universal210 boards
  ARM: Exynos4: Remove broken config values for touchscren for NURI
    board

 arch/arm/mach-exynos/mach-nuri.c           |   51 +++-------------------------
 arch/arm/mach-exynos/mach-universal_c210.c |    5 ++-
 2 files changed, 9 insertions(+), 47 deletions(-)

-- 
1.7.1.569.g6f426
