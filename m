From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 6/7] Samsung DT for v3.14
Date: Mon, 16 Dec 2013 05:22:50 +0900
Message-ID: <52AE0F9A.3010407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:56769 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829Ab3LOUW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 15:22:57 -0500
Received: by mail-pd0-f173.google.com with SMTP id p10so4476217pdj.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2013 12:22:57 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt

for you to fetch changes up to e0b51c2eae8ebf10d80530b7a306818252206325:

   ARM: dts: Update Samsung sysreg binding document (2013-12-16 04:47:38 
+0900)

----------------------------------------------------------------
Samsung DT updates for v3.14
- Add support Octa Cores for exynos5420
   : populate CPU node entries to 8 Cores
   : extend mct to support 8 local interrupts
- Update dwmmc nodes for exynos5250 and exynos5420
   : change status property of dwmmc nodes for exynos5250
   : move dwmmc nodes from exynos5 to exynos5250 because
     it's different between exynos5250 and exynos5420
   : rename mmc nodes from dwmmc for exynos5 SoCs
   : add dwmmc nodes for exynos5420
- Add G-Scaler nodes for exynos5420
- Add HS-i2c nodes in exynos5420
   : High Speed I2C 7 channels (4 to 10)
- Update sysreg binding and node name in exynos4
- Update min voltage on exynos5250-arndale
- Move fifo-depth property from boards to exynos5250 SoC
   : because the fifo-depth property is SoC specific

----------------------------------------------------------------
Chander Kashyap (2):
       clocksource: mct: extend mct to support 8 local interrupts for 
Exynos5420
       ARM: dts: populate cpu node entries to 8 cpus for exynos5420

Leela Krishna Amudala (1):
       ARM: dts: Add device nodes for GScaler blocks for exynos5420

Sachin Kamat (4):
       ARM: dts: Update min voltage for vdd_arm on Arndale
       ARM: dts: Add hs-i2c nodes to exynos5420
       ARM: dts: Fix sysreg node name in exynos4.dtsi
       ARM: dts: Update Samsung sysreg binding document

Yuvaraj Kumar C D (5):
       ARM: dts: Move dwmmc nodes from exynos5.dtsi to exynos5250.dtsi
       ARM: dts: change status property of dwmmc nodes for exynos5250
       ARM: dts: Move fifo-depth property from exynos5250 board dts
       ARM: dts: rename mmc dts node for exynos5 series
       ARM: dts: Add dwmmc DT nodes for exynos5420 SOC

  .../devicetree/bindings/arm/samsung/sysreg.txt     |   7 +-
  .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |   2 +
  arch/arm/boot/dts/cros5250-common.dtsi             |  11 +-
  arch/arm/boot/dts/exynos4.dtsi                     |   2 +-
  arch/arm/boot/dts/exynos5.dtsi                     |  21 ---
  arch/arm/boot/dts/exynos5250-arndale.dts           |  18 +-
  arch/arm/boot/dts/exynos5250-smdk5250.dts          |  16 +-
  arch/arm/boot/dts/exynos5250-snow.dts              |   2 +-
  arch/arm/boot/dts/exynos5250.dtsi                  |  36 +++-
  arch/arm/boot/dts/exynos5420-smdk5420.dts          |  33 ++++
  arch/arm/boot/dts/exynos5420.dtsi                  | 194 
++++++++++++++++++++-
  drivers/clocksource/exynos_mct.c                   |   4 +
  12 files changed, 280 insertions(+), 66 deletions(-)
