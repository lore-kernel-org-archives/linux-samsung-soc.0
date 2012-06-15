From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] Exynos4: power domain fixes for v3.5-rc
Date: Fri, 15 Jun 2012 10:54:31 +0200
Message-ID: <1339750473-32699-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:42423 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128Ab2FOIzS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jun 2012 04:55:18 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5N00D9TI1Q93I0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jun 2012 17:55:16 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M5N003NNI3RZC00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jun 2012 17:55:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Hello,

This is a resend of my power domain fixes for Samsung Exynos platform.
They fix issues introduced by switching to gen_pd based driver in commit
91cfbd4ee0 ('ARM: EXYNOS: Hook up power domains to generic power domain
infrastructure') and restore runtime pm functionality for multimedia
drivers (s5p-fimc, s5p-mfc, s5p-tv, exynos-drm). Tested on Universal
C210 and NURI boards, but the issues were also reported for Origen
boards and others. If possible, please consider these patches as fixes
(runtime pm is broken without them) and merge to v3.5-rc line.

Best regards
Marek Szyprowski
Samsung Poland R&D Center


Patch summary:

Marek Szyprowski (2):
  ARM: Exynos4: read initial state of power domain from hw registers
  ARM: Exynos4: pm_domains: register devices in 'need_restore' state

 arch/arm/mach-exynos/pm_domains.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.1.569.g6f426
