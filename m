From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 00/10] clk: samsung: exynos5433: Fix bug and support
 dvfs/suspend-to-ram
Date: Mon, 27 Apr 2015 20:36:27 +0900
Message-ID: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60513 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619AbbD0Li0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Apr 2015 07:38:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patchset fix the bug and support the DVFS/Suspend-to-RAM. And This patchset
remove the CONFIG_ARCH_EXYNOS5433 insteadf use the CONFIG_ARCH_EXYNOS because
Arnd Bergmann gave me a comment[1] that don't add specific CONFIG_ARCH_EXYNOS5433
for ARM-64bit SoC. And this patchset fix following bugs:
[1] https://lkml.org/lkml/2015/2/26/102

Detailed descirption of each patch:
1. Fix the bug
- Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG in CMU_MSCL. (patch2)
- Fix wrong register for ENABLE_PCLK_MIF_SECURE_MONOTONIC_CNT (patch3)
- Fix wrong parent clock of 'sclk_apollo' clock. (patch4)
- Fix wrong PMS value for 700MHz. (patch5)

2. Support the DVFS for big.LITTLE cores and GPU
- Add CLK_SET_RATE_PARENT flags to propagate parent clock
  when changing the clock for DVFS(big.LITTLE Cores and GPU) (patch6/8)

3. Support the suspend-to-ram
- Add missing DIV_CPIF register to save/restore register on suspend-to-ram (patch7)
- Add CLK_IGNORE_UNUSED flag to SMC (Secure Monitor Call) cloks to support
  the suspend-to-ram (patch9)
- Add CLK_IGNORE_UNUSED flag some clocks to support the suspend-to-ram (patch10)

Changelog:
Change fromv v2:
(https://lkml.org/lkml/2015/4/2/824)
- Add new patches (patch7 ~ patch10)

Change from v1:
(https://lkml.org/lkml/2015/3/17/855)
- Add new patches (patch3 ~ patch6)

Chanwoo Choi (4):
  clk: samsung: Use CONFIG_ARCH_EXYNOS instead of CONFIG_ARCH_EXYNOS5433
  clk: samsung: exynos5433: Fix wrong parent clock of sclk_apollo clock
  clk: samsung: exynos5433: Fix wrong PMS value of exynos5433_pll_rates
  clk: samsung: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core

Hyungwon Hwang (1):
  clk: samsung: exynos5433: Add DIV_CPIF to store it when the board is being suspended

Jonghwa Lee (4):
  clk: samsung: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG
  clk: samsung: exynos5433: Fix CLK_PCLK_MONOTONIC_CNT's register correctly.
  clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for sercure monitor call
  clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to prevent the hang for suspend-to-ram

Joonyoung Shim (1):
  clk: samsung: exynos5433: Add clock flag to support the DVFS of GPU

 drivers/clk/samsung/Makefile         |   2 +-
 drivers/clk/samsung/clk-exynos5433.c | 126 +++++++++++++++++++----------------
 2 files changed, 68 insertions(+), 60 deletions(-)

-- 
1.8.5.5
