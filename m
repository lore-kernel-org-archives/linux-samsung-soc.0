From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/9] Samsung PM consolidation part 1 (clocks)
Date: Thu, 06 Feb 2014 19:16:47 +0100
Message-ID: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:10074 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752378AbaBFSRE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:17:04 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00HIU6SEMLA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 18:17:03 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This series reworks suspend/resume handling of Samsung clock drivers
to cover more SoC specific aspects that are beyond simple register
save and restore. The goal is to have all the suspend/resume code
that touches the clock controller in single place, which is the
clock driver.

On Exynos4210-based Trats, Exynos4412-based Trats2 and Exynos5250-based
Arndale boards (except suspend/resume, which is broken because of
unrelated reasons):

Tested-by: Tomasz Figa <t.figa@samsung.com>

Tomasz Figa (9):
  clk: exynos4: Remove remnants of non-DT support
  clk: samsung: Provide common helpers for register save/restore
  clk: samsung: exynos4: Move suspend/resume handling to SoC driver
  clk: samsung: exynos5250: Move suspend/resume handling to SoC driver
  clk: samsung: exynos5420: Move suspend/resume handling to SoC driver
  clk: samsung: s3c64xx: Move suspend/resume handling to SoC driver
  clk: samsung: Drop old suspend/resume code
  clk: samsung: exynos4: Add remaining suspend/resume handling
  ARM: EXYNOS: pm: Drop legacy Exynos4 clock suspend/resume code

 arch/arm/mach-exynos/pm.c            | 148 +-----------------------------
 drivers/clk/samsung/clk-exynos4.c    | 172 +++++++++++++++++++++++++++++++----
 drivers/clk/samsung/clk-exynos5250.c |  49 +++++++++-
 drivers/clk/samsung/clk-exynos5420.c |  49 +++++++++-
 drivers/clk/samsung/clk-exynos5440.c |   2 +-
 drivers/clk/samsung/clk-s3c64xx.c    |  79 +++++++++++++---
 drivers/clk/samsung/clk.c            |  71 ++++++---------
 drivers/clk/samsung/clk.h            |  14 ++-
 8 files changed, 348 insertions(+), 236 deletions(-)

-- 
1.8.5.2
