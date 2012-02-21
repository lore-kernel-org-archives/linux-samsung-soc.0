From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Subject: [PATCHv4 0/2] ARM: Exynos: JPEG device register
Date: Tue, 21 Feb 2012 11:04:46 +0100
Message-ID: <1329818688-27337-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45414 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753086Ab2BUKEz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 05:04:55 -0500
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZQ00NW4MO40F@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 10:04:52 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZQ002GTMO46C@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 10:04:52 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Dear All,

This patch series adds device registration code for JPEG IP found in
Exynos4 SoC on universal_c210 and nuri boards.

This version is a simplified revision of these patches:

http://www.spinics.net/lists/linux-samsung-soc/msg09164.html
http://www.spinics.net/lists/linux-samsung-soc/msg09165.html

and because of that it relies on this patch:

http://www.spinics.net/lists/linux-samsung-soc/msg09463.html

which adds JPEG power domain to generic power domain infrastructure.

This version also depends on:

http://www.spinics.net/lists/linux-samsung-soc/msg09163.html

which contains JPEG board definition.

Andrzej Pietrasiewicz (2):
  ARM: Exynos: Register JPEG on universal_c210
  ARM: Exynos: Register JPEG on nuri

 arch/arm/mach-exynos/Kconfig               |    2 ++
 arch/arm/mach-exynos/mach-nuri.c           |    1 +
 arch/arm/mach-exynos/mach-universal_c210.c |    1 +
 3 files changed, 4 insertions(+), 0 deletions(-)
