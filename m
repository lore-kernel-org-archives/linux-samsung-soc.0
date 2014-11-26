From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 0/4] Add CPU clock support for Exynos7
Date: Wed, 26 Nov 2014 16:47:47 +0530
Message-ID: <1417000671-11996-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:40239 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118AbaKZLSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Nov 2014 06:18:14 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFN00DIY8QCD140@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Nov 2014 20:18:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com, mturquette@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com

These patches add the atlas clocks on Exynos7. It also modifies the
existing cpu clock infrastructure to handle exynos7 differences. These
patches are a pre-requisite for enabling CPUFreq on Exynos7.

Following are the dependencies:
1) arch: arm64: Enable support for Samsung Exynos7 SoC
http://www.spinics.net/lists/linux-samsung-soc/msg38734.html
2) cpufreq: use generic cpufreq drivers for exynos platforms
http://www.spinics.net/lists/linux-samsung-soc/msg39332.html

For testing I have applied the following:
1) mfd: sec: add S2MPS15 PMIC support
https://lkml.org/lkml/2014/10/14/50
2) regulator: s2mps11: add support for S2MPS15 regulators
https://lkml.org/lkml/2014/10/14/52
3) Regulators dt nodes were added in the espresso dts file and I2C channel 4
which has the PMIC on it was tested.

Abhilash Kesavan (4):
  clk: samsung: exynos7: add clocks for CPU block
  clk: samsung: retrieve the clock provider information from
    samsung_cmu_register_one
  clk: samsung: add cpu clock support for Exynos7
  clk: samsung: add cpu clock configuration data and instantiate cpu
    clock

 .../devicetree/bindings/clock/exynos7-clock.txt    |    6 +
 drivers/clk/samsung/clk-cpu.c                      |  130 ++++++++++++++++-
 drivers/clk/samsung/clk-cpu.h                      |   38 ++++-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos5250.c               |    2 +-
 drivers/clk/samsung/clk-exynos5420.c               |    4 +-
 drivers/clk/samsung/clk-exynos7.c                  |  147 ++++++++++++++++++++
 drivers/clk/samsung/clk.c                          |    6 +-
 drivers/clk/samsung/clk.h                          |    4 +-
 include/dt-bindings/clock/exynos7-clk.h            |   21 ++-
 10 files changed, 347 insertions(+), 13 deletions(-)

-- 
1.7.9.5
