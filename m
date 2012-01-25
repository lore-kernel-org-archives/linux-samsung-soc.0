From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/6] ARM: SAMSUNG: Board updates and minor fixes
Date: Wed, 25 Jan 2012 15:23:21 +0100
Message-ID: <1327501407-1927-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:62684 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029Ab2AYOXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jan 2012 09:23:53 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LYC00A3SYNQG9@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LYC0038PYNQDN@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jan 2012 14:23:50 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com, riverful.kim@samsung.com, sw0312.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

The following patch series adds S5K6AAFX sensor support on Nuri and 
UNIVERSAL_C210 boards. It also includes minor correction for the I2C
controller setup and the M-5MOLS sensor. 


Sylwester Nawrocki (6):
  ARM: SAMSUNG: Increase virtual framebuffer size on Universal C210 board
  ARM: SAMSUNG: Add support for S5K6AAFX image sensor on Universal C210 board
  ARM: SAMSUNG: Add support for S5K6AAFX camera on Nuri board
  ARM: SAMSUNG: Correct framebuffer window size on Nuri board
  ARM: SAMSUNG: Correct M-5MOLS sensor clock frequency on Nuri board
  ARM: SAMSUNG: Fix platform data setup for I2C adapter 0

 arch/arm/mach-exynos/Kconfig               |    2 +
 arch/arm/mach-exynos/mach-nuri.c           |   73 ++++++++++++++++++++++++--
 arch/arm/mach-exynos/mach-universal_c210.c |   78 ++++++++++++++++++++++++++--
 arch/arm/plat-samsung/devs.c               |    4 +-
 4 files changed, 147 insertions(+), 10 deletions(-)

-- 
1.7.8.3
