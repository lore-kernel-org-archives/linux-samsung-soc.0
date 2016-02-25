From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL] clk/samsung updates
Date: Thu, 25 Feb 2016 16:18:56 +0100
Message-ID: <56CF1B60.5090300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13629 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759993AbcBYPTB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Feb 2016 10:19:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


Hello Stephen, Mike,

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-4.6

for you to fetch changes up to a6cb74cbc927af04af827ef590082f9717ffad51:

  clk: samsung: exynos5433: Fix wrong registers of PCLK_GSCL_SMMU clocks
(2016-02-25 12:10:00 +0100)

----------------------------------------------------------------
Mostly correction of errors in the exynos5433 SoC
clocks definition, dropping read-only registers
from the suspend/resume register save/restore list
and exposition of two clocks required for the
exynos5433 HDMI subsystem operation.

----------------------------------------------------------------
Andrzej Hajda (2):
      clk/samsung: exynos5433: add definitions of HDMI-PHY output clocks
      clk/samsung: exynos5433: add pclk_decon clock

Jonghwa Lee (1):
      clk: samsung: exynos5433: Fix wrong registers of PCLK_GSCL_SMMU clocks

Marek Szyprowski (1):
      clk: samsung: exynos5433: Fix definitions of SCLK ISP SENSOR0 clocks

Sylwester Nawrocki (4):
      clk: samsung: exynos5433: Fix typos in *_ISP_MPWM clock names
      clk: samsung: exynos5433: Fix definitions of MUX_SEL_CAM04 clocks
      clk: samsung: exynos5433: Drop RO registers from the save/restore lists
      clk: samsung: exynos5433: Fix mout_aclk_cam1*_user clocks definition

 drivers/clk/samsung/clk-exynos5433.c   | 138
+++++++------------------------------------
 include/dt-bindings/clock/exynos5433.h |   9 ++-
 2 files changed, 28 insertions(+), 119 deletions(-)

--
Thanks,
Sylwester
