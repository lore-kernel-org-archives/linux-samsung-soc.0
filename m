From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/5] S5PC210/S5PV310/EXYNOS4 interrupts update
Date: Thu, 17 Feb 2011 08:25:22 +0100
Message-ID: <1297927527-1338-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:16816 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751910Ab1BQHZk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Feb 2011 02:25:40 -0500
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LGR00GZZ3APSU20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Feb 2011 07:25:37 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LGR0009Y3AO9I@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 17 Feb 2011 07:25:36 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This patch series perform an update on interrupts support for
S5PC210/S5PV310/EXYNOS4 platform. Two optional features have been added.
The first one is GPIO interrupts handler, a second is support for board
specific interrupts. The patches have been prepared to maximise the code
reuse, so common code for gpio interrupts for s5pc100, s5pc110 & s5pc210
have been prepared.

The patches have been prepared against
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
for-next branch (commit 857ddb87db).

Patches that make use of these 2 optional features for universal c210
board will follow soon.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center



Patch summary:

Marek Szyprowski (5):
  ARM: S5PV310: Add missing GPYx banks.
  ARM: Samsung: cleanup S5P gpio interrupt code
  ARM: Samsung: add function to register gpio interrupt bank data
  ARM: S5PC210: add support for gpio interrupts
  ARM: S5PC210: add a placeholder for board specific interrupts

 arch/arm/mach-s5pc100/gpiolib.c               |    1 +
 arch/arm/mach-s5pv210/gpiolib.c               |    1 +
 arch/arm/mach-s5pv310/gpiolib.c               |   67 ++++++++++-
 arch/arm/mach-s5pv310/include/mach/gpio.h     |   23 ++++-
 arch/arm/mach-s5pv310/include/mach/irqs.h     |   16 ++-
 arch/arm/plat-s5p/irq-gpioint.c               |  169 +++++++++++++++----------
 arch/arm/plat-samsung/include/plat/gpio-cfg.h |   16 +++
 7 files changed, 220 insertions(+), 73 deletions(-)

-- 
1.7.1.569.g6f426
