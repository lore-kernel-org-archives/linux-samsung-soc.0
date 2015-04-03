From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 0/6] clk: samsung: Fix bug of Exynos5433 clocks
Date: Fri, 03 Apr 2015 09:29:05 +0900
Message-ID: <1428020951-30428-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:27759 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbbDCA3P (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Apr 2015 20:29:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, jonghwa3.lee@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patchset remove the CONFIG_ARCH_EXYNOS5433 insteadf use the CONFIG_ARCH_EXYNOS
because Arnd Bergmann gave me a comment[1] that don't add specific CONFIG_ARCH_EXYNOS5433
for ARM-64bit SoC. And this patchset fix following bugs:
- Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG in CMU_MSCL.
- Fix wrong PMS value for 700MHz.
- Fix wrong parent clock of 'sclk_apollo' clock.
- Fix wrong register for ENABLE_PCLK_MIF_SECURE_MONOTONIC_CNT
- Add CLK_SET_RATE_PARENT flags to propagate parent clock
  when changing the clock for DVFS feature.
[1] https://lkml.org/lkml/2015/2/26/102

Changelog:
Change from v1:
(https://lkml.org/lkml/2015/3/17/855)
- Add new patches (patch3 ~ patch6)

Chanwoo Choi (4):
  clk: samsung: Use CONFIG_ARCH_EXYNOS instead of CONFIG_ARCH_EXYNOS5433
  clk: samsung: exynos5433: Fix wrong parent clock of sclk_apollo clock
  clk: samsung: exynos5433: Fix wrong PMS value of exynos5433_pll_rates
  clk: samsung: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core

Jonghwa Lee (2):
  clk: samsung: exynos5433: Fix wrong offset of PCLK_MSCL_SECURE_SMMU_JPEG
  clk: samsung: exynos5433: Fix CLK_PCLK_MONOTONIC_CNT's register correctly

 drivers/clk/samsung/Makefile         |  2 +-
 drivers/clk/samsung/clk-exynos5433.c | 34 ++++++++++++++++------------------
 2 files changed, 17 insertions(+), 19 deletions(-)

-- 
1.8.5.5
