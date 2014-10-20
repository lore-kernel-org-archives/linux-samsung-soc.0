From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/3] 1st Round of Samsung DT updates for v3.19
Date: Tue, 21 Oct 2014 00:54:41 +0900
Message-ID: <54453041.3040401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:44723 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbaJTPyu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 11:54:50 -0400
Received: by mail-pd0-f170.google.com with SMTP id p10so5223377pdj.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2014 08:54:50 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

Here is Samsung DT updates for v3.19, please pull.

Thanks,
Kukjin

---

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-dt

for you to fetch changes up to e540920cf21c2764047b8a6ddaeaa0683624e46e:

   ARM: dts: add CPU nodes for Exynos4 SoCs (2014-10-21 00:12:42 +0900)

----------------------------------------------------------------
Samsung DT updates for v3.19

- add CPU nodes for exynos4210, exynos4212, exynos4412

- exynos4x12-pinctrl: add utility macro to define pin sleep states
- exynos4412-trats2: add Maxim77693 PMIC node, add sleep mode pin
   configuration and keep eMMC regulators soft-disabled

- add new exynos5250-spring DT

- cleanup exynos5250-arndale, exynos5250-smdk5250 and exynos5250-snow

- exynos5250-arndale: fix apparent GPIO typo and simplify USB3503
- exynos5250-snow and exynos Peach boards: add rtc_src clock for RTC

- correct mmc0 capability string exynos5420-peach-pit and exynos5800-
   peach-pi

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

Bartlomiej Zolnierkiewicz (1):
       ARM: dts: add CPU nodes for Exynos4 SoCs

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
  arch/arm/boot/dts/exynos4210.dtsi          |  17 +
  arch/arm/boot/dts/exynos4212.dtsi          |  17 +
  arch/arm/boot/dts/exynos4412-trats2.dts    | 352 ++++++++++-
  arch/arm/boot/dts/exynos4412.dtsi          |  29 +
  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi  |  16 +
  arch/arm/boot/dts/exynos5250-arndale.dts   | 907 
++++++++++++++---------------
  arch/arm/boot/dts/exynos5250-smdk5250.dts  | 618 ++++++++++----------
  arch/arm/boot/dts/exynos5250-snow.dts      | 266 ++++-----
  arch/arm/boot/dts/exynos5250-spring.dts    | 536 +++++++++++++++++
  arch/arm/boot/dts/exynos5250.dtsi          |  16 +-
  arch/arm/boot/dts/exynos5420-peach-pit.dts |   7 +-
  arch/arm/boot/dts/exynos5800-peach-pi.dts  |   7 +-
  arch/arm/boot/dts/s3c6410-mini6410.dts     |   4 -
  arch/arm/boot/dts/s3c64xx.dtsi             |   1 -
  16 files changed, 1890 insertions(+), 914 deletions(-)
  create mode 100644 arch/arm/boot/dts/exynos5250-spring.dts
