From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 00/16] Exynos clock clean-up for 3.12
Date: Tue, 20 Aug 2013 19:31:27 +0200
Message-ID: <1377019903-14614-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37421 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420Ab3HTRcA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Aug 2013 13:32:00 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>

This series fixes various functional and non-functional (e.g. stylistic)
issues in Common Clock Framework drivers for Samsung Exynos SoCs. See
particular patches for more detailed descriptions.

Tomasz Figa (16):
  pwm: samsung: Update DT bindings documentation to cover clocks
  ARM: dts: exynos4: Specify PWM clocks in PWM node
  clocksource: samsung_pwm_timer: Get clock from device tree
  clk: samsung: exynos4: Use separate aliases for cpufreq related clocks
  clk: samsung: Modify _get_rate() helper to use __clk_lookup()
  clk: samsung: exynos4: Remove unused static clkdev aliases
  clk: samsung: exynos4: Remove checks for DT node
  clk: samsung: exynos4: Rename exynos4_plls to exynos4x12_plls
  clk: samsung: pll: Use new registration method for PLL45xx
  clk: samsung: pll: Add support for rate configuration of PLL45xx
  clk: samsung: pll: Use new registration method for PLL46xx
  clk: samsung: pll: Add support for rate configuration of PLL46xx
  clk: samsung: exynos4: Reorder registration of mout_vpllsrc
  clk: samsung: exynos4: Register PLL rate tables for Exynos4210
  clk: samsung: exynos4: Register PLL rate tables for Exynos4x12
  clk: samsung: exynos5250: Simplify registration of PLL rate tables

 .../devicetree/bindings/pwm/pwm-samsung.txt        |  12 +
 arch/arm/boot/dts/exynos4.dtsi                     |   2 +
 drivers/clk/samsung/clk-exynos4.c                  | 539 ++++++++++++---------
 drivers/clk/samsung/clk-exynos5250.c               |  12 +-
 drivers/clk/samsung/clk-exynos5440.c               |   2 +-
 drivers/clk/samsung/clk-pll.c                      | 284 ++++++++---
 drivers/clk/samsung/clk-pll.h                      |  59 ++-
 drivers/clk/samsung/clk.c                          |  10 +-
 drivers/clocksource/samsung_pwm_timer.c            |  12 +-
 9 files changed, 601 insertions(+), 331 deletions(-)

-- 
1.8.3.2
