From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 0/4] Add support for Exynos5800 SoC
Date: Mon, 21 Apr 2014 12:15:08 +0530
Message-ID: <1398062712-28602-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:46156 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091AbaDUGpS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 02:45:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, alim.akhtar@samsung.com, tomasz.figa@gmail.com, olofj@google.com, arunkk.samsung@gmail.com

Exynos5800 is a derivative of Exynos5420 with higher
clock speeds and most other IP blocks remaining the same
except for a few.
Due to the similarities with 5420, following is done to
achieve maximum code re-use:
- Use the same 5420 clock file with few changes for adding
  extra 5800 clocks.
- Re-use the 5420 dtsi by renaming it to exynos5-octa.

This series is re-based on the 5420 clock cleanup series
posted by Shaik [1].
[1] http://www.spinics.net/lists/arm-kernel/msg318493.html

Alim Akhtar (1):
  clk: exynos5420: Add 5800 specific clocks

Arun Kumar K (3):
  ARM: EXYNOS: Add 5800 SoC support
  ARM: dts: Add 5800 dt files
  ARM: dts: Add peach-pi board support

 .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
 arch/arm/boot/dts/Makefile                         |    3 +-
 ...5420-pinctrl.dtsi => exynos5-octa-pinctrl.dtsi} |    0
 arch/arm/boot/dts/exynos5-octa.dtsi                |  732 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |  713 +------------------
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |  225 ++++++
 arch/arm/boot/dts/exynos5800.dtsi                  |   24 +
 arch/arm/mach-exynos/Kconfig                       |    8 +
 arch/arm/mach-exynos/exynos.c                      |    1 +
 arch/arm/mach-exynos/platsmp.c                     |    2 +-
 arch/arm/plat-samsung/include/plat/cpu.h           |   11 +-
 drivers/clk/samsung/clk-exynos5420.c               |  276 ++++++--
 include/dt-bindings/clock/exynos5420.h             |    4 +
 13 files changed, 1230 insertions(+), 772 deletions(-)
 rename arch/arm/boot/dts/{exynos5420-pinctrl.dtsi => exynos5-octa-pinctrl.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/exynos5-octa.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
 create mode 100644 arch/arm/boot/dts/exynos5800.dtsi

-- 
1.7.9.5
