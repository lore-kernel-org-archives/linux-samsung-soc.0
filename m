From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 00/16] Exynos clock clean-up for 3.12
Date: Mon, 26 Aug 2013 19:08:55 +0200
Message-ID: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50462 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752166Ab3HZRJs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 13:09:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>, Tomasz Figa <t.figa@samsung.com>

This series fixes various functional and non-functional (e.g. stylistic)
issues in Common Clock Framework drivers for Samsung Exynos SoCs. See
particular patches for more detailed descriptions.

Changes since v1:
[http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg21665.html]
 - Addressed comments from Yadwinder Singh Brar:
   - added missing __initdata keywords,
   - various typoes fixed,
   - other minor stylistic improvements.

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
 drivers/clk/samsung/clk-pll.c                      | 285 ++++++++---
 drivers/clk/samsung/clk-pll.h                      |  59 ++-
 drivers/clk/samsung/clk.c                          |  10 +-
 drivers/clocksource/samsung_pwm_timer.c            |  12 +-
 9 files changed, 602 insertions(+), 331 deletions(-)

-- 
1.8.3.2
