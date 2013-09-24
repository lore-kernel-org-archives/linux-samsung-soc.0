From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: [PATCH 0/3] ARM: S5PC100: move to common clk framework
Date: Tue, 24 Sep 2013 18:55:23 +0200
Message-ID: <1380041723-15877-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11268 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754062Ab3IXQzq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Sep 2013 12:55:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kyungmin.park@samsung.com
Cc: mturquette@linaro.org, t.figa@samsung.com, s.nawrocki@samsung.com, yadi.brar@samsung.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, rob@landley.net, devicetree@vger.kernel.org, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, Mateusz Krawczuk <m.krawczuk@partner.samsung.com>

This patch series is the new s5pc100 clock implementation
(using common clk framework).

This implementation is compatible with device tree definition and board files.

This patch series is based on linux-next and has been tested on smdkc100 
board using board file.

Mateusz Krawczuk (3):
  clk: samsung: pll: Add support for PLL6545a and PLL6522x
  clk: samsung: Add clock driver for s5pc100
  ARM: s5pc100: Migrate clock handling to Common Clock Framework

 .../bindings/clock/samsung,s5pc100-clock.txt       |  72 +++
 arch/arm/mach-s5pc100/Kconfig                      |   8 +
 arch/arm/mach-s5pc100/Makefile                     |   4 +-
 arch/arm/mach-s5pc100/common.c                     |  23 +-
 arch/arm/mach-s5pc100/common.h                     |  13 +
 arch/arm/mach-s5pc100/mach-smdkc100.c              |   3 +-
 arch/arm/plat-samsung/Kconfig                      |   2 +-
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-pll.c                      |   2 +
 drivers/clk/samsung/clk-pll.h                      |   2 +
 drivers/clk/samsung/clk-s5pc100.c                  | 695 +++++++++++++++++++++
 include/dt-bindings/clock/samsung,s5pc100-clock.h  | 202 ++++++
 12 files changed, 1022 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pc100-clock.txt
 create mode 100644 drivers/clk/samsung/clk-s5pc100.c
 create mode 100644 include/dt-bindings/clock/samsung,s5pc100-clock.h

-- 
1.8.1.2
