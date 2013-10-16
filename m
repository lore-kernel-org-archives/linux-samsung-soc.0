From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/9] Samsung clock PM consolidation part 1
Date: Wed, 16 Oct 2013 13:08:09 +0200
Message-ID: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30793 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760299Ab3JPLIZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 07:08:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUR00GEODLNYT70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Oct 2013 12:08:23 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Tomasz Figa <t.figa@samsung.com>

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

 arch/arm/mach-exynos/pm.c            | 125 +-------------------------
 drivers/clk/samsung/clk-exynos4.c    | 170 ++++++++++++++++++++++++++++++-----
 drivers/clk/samsung/clk-exynos5250.c |  49 ++++++++--
 drivers/clk/samsung/clk-exynos5420.c |  49 ++++++++--
 drivers/clk/samsung/clk-exynos5440.c |   2 +-
 drivers/clk/samsung/clk-s3c64xx.c    |  79 +++++++++++++---
 drivers/clk/samsung/clk.c            |  71 ++++++---------
 drivers/clk/samsung/clk.h            |  14 ++-
 8 files changed, 346 insertions(+), 213 deletions(-)

-- 
1.8.3.2
