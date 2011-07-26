From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/2] Universal C210 workaround/fix
Date: Tue, 26 Jul 2011 07:50:54 +0200
Message-ID: <1311659456-6659-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28632 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab1GZFvE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jul 2011 01:51:04 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOX00GAKEX1ZD@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 06:51:01 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOX00C0WEWZ6D@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 26 Jul 2011 06:51:00 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

Hello,

Commit 069d4e743 removed support for local timers and forced to use MCT
as event source. However MCT is not operating properly on early revision
(EVT0) of Exynos4 SoCs, what broke support for all UniversalC210 boards
(they are EVT0 based). This short patch series adds a simple workaround
for this issue and lets UniversalC210 board to boot again.

Best regards
Marek Szyprowski
Samsung Poland R&D Center


Summary:

Marek Szyprowski (2):
  ARM: Samsung: Add chained enrty/exit call to timer interrupt handler
  ARM: Exynos4: use s5p-timer for UniversalC210 board

 arch/arm/mach-exynos4/Kconfig               |    3 +++
 arch/arm/mach-exynos4/mach-universal_c210.c |    4 +++-
 arch/arm/plat-samsung/irq-vic-timer.c       |    5 +++++
 3 files changed, 11 insertions(+), 1 deletions(-)

-- 
1.7.1.569.g6f426
