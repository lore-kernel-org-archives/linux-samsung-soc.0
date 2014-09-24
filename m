From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] Second Samsung DT updates for v3.18
Date: Wed, 24 Sep 2014 17:17:41 +0900
Message-ID: <54227E25.2060903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:47930 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752204AbaIXIRt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 04:17:49 -0400
Received: by mail-pd0-f177.google.com with SMTP id v10so6296968pde.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Sep 2014 01:17:48 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof and Kevin

Here is second bunch of Samsung DT updates for v3.18.

This is based on previous pull-request for tags/samsung-dt but not yet 
pulled into arm-soc.

Please pull and if any problems, kindly let me know.

Thanks,
Kukjin


The following changes since commit 9b02732643d9f4b92b14f5ec041c166bd36033fc:

   ARM: dts: remove old USB2 PHY node for exynos5250 (2014-09-14 
10:11:20 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt-2

for you to fetch changes up to 57901371c9914d5e5eeabf2870c35162837198d2:

   ARM: dts: add MFC codec device node for exynos3250 (2014-09-24 
01:33:23 +0900)

----------------------------------------------------------------
Second Samsung DT updates for v3.18

- add new exynos5250-spring DT
- cleanup exynos5250-arndale, smdk5250 and snow DT

- exynos Peach boards (exynos5420-peach-pit and exynos5800-peach-pi)
   correct mmc0 capability string

- exynos5250-arndale: fix apparent GPIO typo and simplify USB3503
- exynos5250-snow and exynos Peach boards: add rtc_src clock for RTC

- exynos4x12-pinctrl: add utility macro to define pin sleep states
- exynos4412-trats2: add Maxim77693 PMIC node, add sleep mode pin
   configuration and keep eMMC regulators soft-disabled

- exynos3250: add MFC codec nodes

- s3c64xx: enable PWM node by default

----------------------------------------------------------------
Andreas Faerber (8):
       ARM: dts: Prepare node labels for exynos5250
       ARM: dts: Clean up exynos5250-snow
       ARM: dts: Fill in bootargs for exynos5250-snow
       ARM: dts: Clean up exynos5250-smdk5250
       ARM: dts: Clean up exynos5250-arndale
       ARM: dts: Fix apparent GPIO typo in exynos5250-arndale
       ARM: dts: Simplify USB3503 on exynos5250-arndale
       ARM: dts: Add exynos5250-spring device tree

Jacek Anaszewski (1):
       ARM: dts: add MFC codec device node for exynos3250

Javier Martinez Canillas (2):
       ARM: dts: Add rtc_src clk for s3c-rtc on exynos Peach boards
       ARM: dts: Add rtc_src clk for s3c-rtc on exynos5250-snow

Krzysztof Kozlowski (1):
       ARM: dts: Add Maxim 77693 PMIC to exynos4412-trats2

Naveen Krishna Chatradhi (1):
       ARM: dts: correct the mmc0 capability string for exynos Peach boards

Tomasz Figa (4):
       ARM: dts: Enable PWM node by default for s3c64xx
       ARM: dts: Keep eMMC regulators soft-disabled for exynos4412-trats2
       ARM: dts: Add utility macro to define pin sleep states for 
exynos4x12-pinctrl
       ARM: dts: Add sleep mode pin configuration for exynos4412-trats2

  arch/arm/boot/dts/Makefile                 |   1 +
  arch/arm/boot/dts/exynos3250.dtsi          |  10 +
  arch/arm/boot/dts/exynos4412-trats2.dts    | 352 ++++++++++-
  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi  |  16 +
  arch/arm/boot/dts/exynos5250-arndale.dts   | 907 
++++++++++++++---------------
  arch/arm/boot/dts/exynos5250-smdk5250.dts  | 618 ++++++++++----------
  arch/arm/boot/dts/exynos5250-snow.dts      | 280 ++++-----
  arch/arm/boot/dts/exynos5250-spring.dts    | 536 +++++++++++++++++
  arch/arm/boot/dts/exynos5250.dtsi          |  16 +-
  arch/arm/boot/dts/exynos5420-peach-pit.dts |   7 +-
  arch/arm/boot/dts/exynos5800-peach-pi.dts  |   7 +-
  arch/arm/boot/dts/s3c6410-mini6410.dts     |   4 -
  arch/arm/boot/dts/s3c64xx.dtsi             |   1 -
  13 files changed, 1842 insertions(+), 913 deletions(-)
  create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts
