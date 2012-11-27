From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 0/3]ARM: Exynos5 : Add Power domain device tree support and fix
 for hardware issue
Date: Tue, 27 Nov 2012 17:52:34 +0530
Message-ID: <1354018957-17752-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22447 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753443Ab2K0MAG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 07:00:06 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ME500J4UAO2LIL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 21:00:05 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0ME500EEJAMW32A0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Nov 2012 21:00:02 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

From: Prasanna Kumar <prasanna.ps@samsung.com>

Hello all,

This patch set is for "for-next" branch.

In this patch set, the first patch adds device tree support for
G-Scaler and MFC power domains of Exynos5. 

The second patch enables power domain support for exynos5 in Kconfig

The last patch provides a software fix for hardware issue found in exynos5
while powergating the power domains.

Prasanna Kumar (3):
  ARM: dts: exynos5: Set up power domain for MFC and G-scaler
  arm: exynos5: Enable PM generic domain support in Kconfig
  ARM: EXYNOS5: save CLK_TOP_SRC3 register before powergating

 arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
 arch/arm/mach-exynos/Kconfig      |    1 +
 arch/arm/mach-exynos/pm_domains.c |   27 +++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
