From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: Power domain DT support extension
Date: Thu, 06 Sep 2012 11:38:03 +0200
Message-ID: <1346924286-9584-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:64747 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756741Ab2IFJiT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Sep 2012 05:38:19 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9X00EBK9FQPD50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 18:38:18 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9X00K2L9FLF240@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Sep 2012 18:38:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl, Tomasz Figa <t.figa@samsung.com>

This patch series fixes two issues with existing DT support for Exynos
power domains and extends it with the ability of binding devices to domains,
basically making it possible to use power domains when using DT.

Tomasz Figa (3):
  ARM: EXYNOS: pm_domain: Detect domain state on registration from DT
  ARM: EXYNOS: pm_domain: Fix power domain name initialization
  ARM: EXYNOS: pm_domain: Bind devices to power domains using DT

 .../bindings/arm/exynos/power_domain.txt           | 15 +++-
 arch/arm/mach-exynos/pm_domains.c                  | 93 +++++++++++++++++++++-
 2 files changed, 100 insertions(+), 8 deletions(-)

-- 
1.7.12
