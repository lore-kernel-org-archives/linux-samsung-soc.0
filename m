From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: [PATCH v4 0/3] ARM: S5PV210: move to common clk framework
Date: Sat, 21 Sep 2013 19:45:25 +0200
Message-ID: <1379785528-25322-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11776 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993Ab3IURpm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Sep 2013 13:45:42 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MTH00FYULC5V9C0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 22 Sep 2013 02:45:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>

This patch series is the new s5pv210 clock implementation
(using common clk framework).

This implementation is compatible with device tree definition and board 
files.

This patch series is based on linux-next and has been tested on goni and 
aquila 
boards using board file.

Since v3:

Replace s5pv210_clk_register_finpll, by creating mux finpll
with xusbxti and xxti as parrents.

Mateusz Krawczuk (3):
  clk: samsung: Add clock driver for s5pc110/s5pv210
  Cpufreq: s5pv210 cpufreq fixes for CCF
  ARM: s5pv210: Migrate clock handling to Common Clock Framework

 .../bindings/clock/samsung,s5pv210-clock.txt       |  75 +++
 arch/arm/mach-s5pv210/Kconfig                      |   9 +
 arch/arm/mach-s5pv210/Makefile                     |   4 +-
 arch/arm/mach-s5pv210/common.c                     |  17 +
 arch/arm/mach-s5pv210/common.h                     |  10 +
 arch/arm/mach-s5pv210/mach-goni.c                  |   2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   2 +-
 arch/arm/plat-samsung/Kconfig                      |   2 +-
 drivers/clk/samsung/Makefile                       |   3 +
 drivers/clk/samsung/clk-s5pv210.c                  | 673 +++++++++++++++++++++
 drivers/cpufreq/s5pv210-cpufreq.c                  |   6 +-
 include/dt-bindings/clock/samsung,s5pv210-clock.h  | 224 +++++++
 12 files changed, 1019 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s5pv210-clock.txt
 create mode 100644 drivers/clk/samsung/clk-s5pv210.c
 create mode 100644 include/dt-bindings/clock/samsung,s5pv210-clock.h

-- 
1.8.1.2
