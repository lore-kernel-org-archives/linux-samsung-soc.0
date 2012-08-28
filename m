From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: Add support for GPIO on Exynos4x12
Date: Tue, 28 Aug 2012 12:01:05 +0200
Message-ID: <4648723.rWnut7F0uJ@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56089 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752101Ab2H1KBO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Aug 2012 06:01:14 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9G0002SMHMQ970@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 19:01:13 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9G007Z0MHU6460@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 28 Aug 2012 19:01:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>

This patch series makes necessary preparations and adds support for GPIO on 
Exynos4x12 SoCs.

Tomasz Figa (3):
  ARM: EXYNOS: Use EXYNOS4210_GPEx instead of EXYNOS4_GPEx
  gpio: samsung: Add support for Exynos4x12 SoCs
  ARM: EXYNOS: Add support for FIMC cam port B GPIO setup on Exynos4x12

 arch/arm/mach-exynos/include/mach/gpio.h   |   58 ++++--
 arch/arm/mach-exynos/include/mach/irqs.h   |    6 -
 arch/arm/mach-exynos/mach-nuri.c           |   16 +-
 arch/arm/mach-exynos/mach-origen.c         |    6 +-
 arch/arm/mach-exynos/mach-trats.c          |    4 +-
 arch/arm/mach-exynos/mach-universal_c210.c |   32 ++--
 arch/arm/mach-exynos/setup-fimc.c          |   21 ++-
 drivers/gpio/gpio-samsung.c                |  351 
++++++++++++++++++++++++----
 8 files changed, 399 insertions(+), 95 deletions(-)

-- 
1.7.8.6
