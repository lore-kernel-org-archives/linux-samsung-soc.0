From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/4] S5PC210/S5PV310/EXYNOS4 interrupts update
Date: Mon, 14 Mar 2011 08:04:42 +0100
Message-ID: <1300086286-9006-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:9048 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752584Ab1CNHEu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 03:04:50 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LI100BSXD00K8@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:04:48 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LI100ATUCZZMD@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Mar 2011 07:04:48 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

Hello,

This patch series perform an update on interrupts support for
S5PC210/S5PV310/EXYNOS4 platform. An optional support for GPIO
interrupts handler has been added The patches have been prepared to
maximise the code reuse, so common code for gpio interrupts for s5pc100,
s5pc110 & s5pc210 have been prepared.

The patches have been prepared against
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
for-next branch (commit be7004f73d0).

Patches that make use of these optional features for universal c210
board will follow soon.

Changes since v1:
- rebased onto latest version of kgene/for-next kernel tree (with s5pv310
  to exynos4 rename)
- removed machine specific interrupt patch from this patch series

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center



Patch summary:

Marek Szyprowski (4):
  ARM: EXYNOS4: Add missing GPYx banks.
  ARM: Samsung: cleanup S5P gpio interrupt code
  ARM: Samsung: add function to register gpio interrupt bank data
  ARM: EXYNOS4: add support for gpio interrupts

 arch/arm/mach-exynos4/gpiolib.c               |   67 ++++++++++-
 arch/arm/mach-exynos4/include/mach/gpio.h     |   23 ++++-
 arch/arm/mach-exynos4/include/mach/irqs.h     |   12 ++-
 arch/arm/mach-s5pc100/gpiolib.c               |    1 +
 arch/arm/mach-s5pv210/gpiolib.c               |    1 +
 arch/arm/plat-s5p/irq-gpioint.c               |  169 +++++++++++++++----------
 arch/arm/plat-samsung/include/plat/gpio-cfg.h |   16 +++
 7 files changed, 216 insertions(+), 73 deletions(-)

-- 
1.7.1.569.g6f426
