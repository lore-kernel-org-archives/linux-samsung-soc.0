From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Thu, 12 Dec 2013 17:07:13 +0100
Message-ID: <1386864441-19561-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:52763 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452Ab3LLQHp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Dec 2013 11:07:45 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Lee Jones <lee.jones@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This series intends to improve clock provider impementation of max77686
PMIC driver. First two patches are simple fixes of current implementation
to allow correct control of provided clocks. Further patches refactor
the driver to make the code cleaner and prepare for further patches. Then
last two patches add registration of OF clock provider and adjust device
tree nodes of boards containing max77686 chip to contain properties
required by clock provider.

Tested on Exynos4412-based Trats2 board, with additional patches adding
driver being a consumer of one of max77686 clocks.

Changes since v1:
 - rebased on top of current clk-next (no functional changes)

Tomasz Figa (8):
  clk: max77686: Correct callback used for checking clock status
  clk: max77686: Provide .recalc_rate() operation
  clk: max77686: Refactor successful exit of probe function
  clk: max77686: Make max77686_clk_register() return struct clk *
  clk: max77686: Fix clean-up in error and remove paths
  clk: max77686: Refactor driver data handling
  clk: max77686: Register OF clock provider
  ARM: dts: Add clock provider specific properties to max77686 node

 .../devicetree/bindings/clock/maxim,max77686.txt   | 38 +++++++++
 Documentation/devicetree/bindings/mfd/max77686.txt |  3 +
 arch/arm/boot/dts/cros5250-common.dtsi             |  1 +
 arch/arm/boot/dts/exynos4412-odroidx.dts           |  1 +
 arch/arm/boot/dts/exynos4412-trats2.dts            |  1 +
 drivers/clk/clk-max77686.c                         | 97 +++++++++++++---------
 6 files changed, 104 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.txt

-- 
1.8.4.3
