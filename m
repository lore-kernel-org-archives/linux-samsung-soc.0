From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/3] ARM: dts: Exynos4 dts reorganization
Date: Mon, 03 Sep 2012 14:34:31 +0200
Message-ID: <1346675674-16034-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:63380 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755908Ab2ICMey (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Sep 2012 08:34:54 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9R00JMAXLXJ9P0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 21:34:52 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9R00H05XLX9920@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 21:34:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>

This patch series prepares existing Exynos4210 DT infrastructure to be
further extended for new SoCs from Exynos4 line and new boards.

Tomasz Figa (3):
  ARM: dts: Move parts common to Exynos4 from Exynos4210.dtsi to
    Exynos4.dtsi
  ARM: EXYNOS: exynos4-dt: Use exynos4 prefix instead of exynos4210
  ARM: dts: exynos4: Assume status of all optional nodes as disabled

 arch/arm/boot/dts/exynos4.dtsi            | 232 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4210-origen.dts   |  58 +-------
 arch/arm/boot/dts/exynos4210-smdkv310.dts |  52 +------
 arch/arm/boot/dts/exynos4210.dtsi         | 181 +----------------------
 arch/arm/mach-exynos/mach-exynos4-dt.c    |  18 +--
 5 files changed, 248 insertions(+), 293 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos4.dtsi

-- 
1.7.12
