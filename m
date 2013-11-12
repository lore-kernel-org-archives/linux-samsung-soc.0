From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 0/3] thermal: samsung: Clean up and add support for Exynos5420
Date: Tue, 12 Nov 2013 12:05:32 +0530
Message-ID: <1384238132-24515-1-git-send-email-ch.naveen@samsung.com>
References: <1377668719-8602-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27566 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944Ab3KLGeE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Nov 2013 01:34:04 -0500
In-reply-to: <1377668719-8602-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-pm@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, rui.zhang@intel.com, eduardo.valentin@ti.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, amit.daniel@samsung.com, kgene.kim@samsung.com, devicetree@vger.kernel.org, b.zolnierkie@samsung.com, cpgs@samsung.com, t.figa@samsung.com

This patchset does a little clean up of the existing code
1.  [v9] thermal: samsung: replace inten_ bit fields with intclr_
2.  [v9] thermal: samsung: change base_common to more meaningful base_second

adds support for Exynos5420 in the driver and
3.  [v9] thermal: samsung: Add TMU support for Exynos5420 SoCs
also adds the device tree nodes for the same to exynos5420.dtsi (linux-samsung.git)
4.  [v3] ARM: dts: Exynos5420: Add device nodes for TMU blocks

Naveen Krishna Chatradhi (3):
  thermal: samsung: replace inten_ bit fields with intclr_
  thermal: samsung: change base_common to more meaningful base_second
  thermal: samsung: Add TMU support for Exynos5420 SoCs
  ARM: dts: Exynos5420: Add device nodes for TMU blocks

 .../devicetree/bindings/thermal/exynos-thermal.txt |   49 +++++++-
 drivers/thermal/samsung/exynos_tmu.c               |   78 +++++++++---
 drivers/thermal/samsung/exynos_tmu.h               |   22 ++--
 drivers/thermal/samsung/exynos_tmu_data.c          |  126 ++++++++++++++++++--
 drivers/thermal/samsung/exynos_tmu_data.h          |   12 +-
 5 files changed, 249 insertions(+), 38 deletions(-)

-- 
1.7.10.4
