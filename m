From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/4] ARM: Samsung: Add board setup for M-5MOLS and NOON010PC30
 camera sensors
Date: Fri, 16 Sep 2011 12:27:49 +0200
Message-ID: <1316168873-22257-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27529 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751563Ab1IPK17 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Sep 2011 06:27:59 -0400
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LRM0027K2ELR3@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 11:27:57 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LRM00CL32ELLD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2011 11:27:57 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, s.nawrocki@samsung.com

Hello,

the following patch series adds board setup code for NOOON01PC30 sensor
on GONI and M-5MOLS on UNIVERSAL_C210 board.
Some clocks are modified in line with latest FIMC driver modifcations for v3.2.

Sylwester Nawrocki (4):
  ARM: S5PV210: Rename sclk_cam clocks for FIMC media driver
  ARM: S5PV210: Add support for NOON010PC30 sensor on GONI board
  ARM: EXYNOS4: Rename sclk_cam clocks for FIMC driver
  ARM: S5PV210: UNIVERSAL_C210: Add support for M-5MOLS image sensor

 arch/arm/mach-exynos4/Kconfig               |    3 +
 arch/arm/mach-exynos4/clock.c               |    6 +-
 arch/arm/mach-exynos4/mach-universal_c210.c |  211 ++++++++++++++++++++++++++-
 arch/arm/mach-s5pv210/Kconfig               |    1 +
 arch/arm/mach-s5pv210/clock.c               |    6 +-
 arch/arm/mach-s5pv210/mach-goni.c           |   53 +++++++
 6 files changed, 264 insertions(+), 16 deletions(-)

Created against samsung-for-next branch at git://github.com/kgene/linux-samsung.git
on top of the HDMI board patches from Tomasz Stanislawski.

The patches can be pulled from git://git.infradead.org/users/kmpark/linux-2.6-samsung, 
branch samsung-board-camera.


Thanks,
--
Sylwester Nawrocki
Samsung Poland R&D Center
