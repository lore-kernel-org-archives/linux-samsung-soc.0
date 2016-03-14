From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 00/10] ARM: dts: Add new Exynos3250-based ARTIK5 module dtsi
 file
Date: Mon, 14 Mar 2016 11:04:05 +0900
Message-ID: <1457921056-21257-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34872 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753274AbcCNCEZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Mar 2016 22:04:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com
Cc: jh80.chung@samsung.com, andi.shyti@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, pankaj.dubey@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org

This patchset add the support for Device Tree source for Samsung ARTIK5 module[1]
based on Exynos3250 SoC and development board[2]. The ARTIK5 module includes
the follwoing devices:
- Application Processor (Samsung Exynos3250)
- WiFi/BT Combo chip
- PMIC (Samsung S2MPS14)
- eMMC (4GB)
- DRAM LPDDR3 (512MB)
- Connectors pin (60 Pins x 3 set)

Also, this patchset add the ARTIK5 development board[2] dts file which includes
the ARTIK5 module[1] and have the devices such as sound codec, sd card port,
ethernet port, uart port and so on.

[1] https://www.artik.io/hardware/artik-5
[2] http://www.digikey.com/product-detail/en/SIP-KITNXB001/1510-1316-ND/5825102

Chanwoo Choi (6):
  clk: samsung: exynos3250: Add MMC2 clock
  ARM: dts: Add MSHC2 dt node for Exynos3250 SoC
  ARM: dts: Add exynos3250-artik5 dtsi file for ARTIK5 module
  ARM: dts: Add thermal zone and cpufreq node for exynos3250-artik5 module
  ARM: dts: Add rtc and adc dt node for exynos3250-artik5 module
  ARM: dts: Add PPMU node for exynos3250-artik5 module

Jaehoon Chung (2):
  ARM: dts: Add MSHC0 dt node for eMMC device for exynos3250-artik5 module
  ARM: dts: Add MSHC2 dt node for SD card for exynos3250-artik5-devel board

Pankaj Dubey (2):
  clk: samsung: exynos3250: Add UART2 clock
  ARM: dts: Add UART2 dt node for Exynos3250 SoC

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/exynos3250-artik5-devel.dts |  42 +++
 arch/arm/boot/dts/exynos3250-artik5.dtsi      | 372 ++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi     |  42 +++
 arch/arm/boot/dts/exynos3250.dtsi             |  25 ++
 drivers/clk/samsung/clk-exynos3250.c          |  15 ++
 include/dt-bindings/clock/exynos3250.h        |  11 +-
 7 files changed, 507 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-artik5-devel.dts
 create mode 100644 arch/arm/boot/dts/exynos3250-artik5.dtsi

-- 
1.9.1
