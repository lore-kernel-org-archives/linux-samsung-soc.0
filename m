From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/4] ARM: EXYNOS: Power domain DT support extension
Date: Tue, 02 Oct 2012 11:24:02 +0200
Message-ID: <1349169846-30385-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:19869 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752967Ab2JBJY1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Oct 2012 05:24:27 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB900M1CE4K65L0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 18:24:25 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MB900MEOE4G7Q90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Oct 2012 18:24:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, rjw@sisk.pl, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch series fixes two issues with existing DT support for Exynos
power domains and extends it with the ability of binding devices to domains,
basically making it possible to use power domains with DT.

Based on next/dt-samsung-new branch of Samsung tree.

Changes since v1:
 - Added "samsung," prefix to "power-domain" property.
 - Added power domain nodes to Exynos4 device tree sources.

Tomasz Figa (4):
  ARM: EXYNOS: pm_domain: Detect domain state on registration from DT
  ARM: EXYNOS: pm_domain: Fix power domain name initialization
  ARM: EXYNOS: pm_domain: Bind devices to power domains using DT
  ARM: dts: exynos4: Set up power domains

 .../bindings/arm/exynos/power_domain.txt           | 15 +++-
 arch/arm/boot/dts/exynos4.dtsi                     | 30 +++++++
 arch/arm/boot/dts/exynos4210.dtsi                  |  5 ++
 arch/arm/mach-exynos/pm_domains.c                  | 93 +++++++++++++++++++++-
 4 files changed, 135 insertions(+), 8 deletions(-)

-- 
1.7.12
