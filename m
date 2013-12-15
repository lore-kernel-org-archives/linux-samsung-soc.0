From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 7/7] Samsung SoC for v3.14
Date: Mon, 16 Dec 2013 05:23:01 +0900
Message-ID: <52AE0FA5.3090804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:40756 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab3LOUXJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Dec 2013 15:23:09 -0500
Received: by mail-pb0-f52.google.com with SMTP id uo5so4628277pbc.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Dec 2013 12:23:09 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:

   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-soc

for you to fetch changes up to 538cfbb4c40ab59688236484138133b8e3e89220:

   ARM: dts: Add initial support for Arndale Octa board (2013-12-16 
05:05:43 +0900)

----------------------------------------------------------------
Samsung SoC updates for v3.14
- Add exynos5410 SoC and smdk5410 board support
   : add supporting SoC and board DT files
   : add clk-exynos5410 with using CCF
- Add exynos5420-arndale-octa board support
   : basic supporting for Arndale Octa board

----------------------------------------------------------------
Sachin Kamat (1):
       ARM: dts: Add initial support for Arndale Octa board

Tarek Dakhran (3):
       ARM: EXYNOS: Add support for EXYNOS5410 SoC
       clk: exynos5410: register clocks using common clock framework
       ARM: dts: Add initial device tree support for EXYNOS5410

  .../devicetree/bindings/clock/exynos5410-clock.txt |  54 +++++
  arch/arm/boot/dts/Makefile                         |   2 +
  arch/arm/boot/dts/exynos5410-smdk5410.dts          |  72 +++++++
  arch/arm/boot/dts/exynos5410.dtsi                  | 145 +++++++++++++
  arch/arm/boot/dts/exynos5420-arndale-octa.dts      |  66 ++++++
  arch/arm/mach-exynos/Kconfig                       |  10 +
  arch/arm/mach-exynos/common.c                      |  18 ++
  arch/arm/mach-exynos/include/mach/map.h            |   1 +
  arch/arm/mach-exynos/mach-exynos5-dt.c             |   1 +
  arch/arm/mach-exynos/platsmp.c                     |   2 +
  arch/arm/plat-samsung/include/plat/cpu.h           |   8 +
  arch/arm/plat-samsung/include/plat/map-s5p.h       |   3 +
  drivers/clk/samsung/Makefile                       |   1 +
  drivers/clk/samsung/clk-exynos5410.c               | 239 
+++++++++++++++++++++
  include/dt-bindings/clock/exynos5410.h             |  32 +++
  15 files changed, 654 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/clock/exynos5410-clock.txt
  create mode 100644 arch/arm/boot/dts/exynos5410-smdk5410.dts
  create mode 100644 arch/arm/boot/dts/exynos5410.dtsi
  create mode 100644 arch/arm/boot/dts/exynos5420-arndale-octa.dts
  create mode 100644 drivers/clk/samsung/clk-exynos5410.c
  create mode 100644 include/dt-bindings/clock/exynos5410.h
