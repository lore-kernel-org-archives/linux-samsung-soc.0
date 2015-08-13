From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 2nd 2/4] Samsung DT 3rd updates for v4.3
Date: Thu, 13 Aug 2015 09:12:34 +0900
Message-ID: <55CBE0F2.4020104@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56822 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751495AbbHMAMp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Aug 2015 20:12:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Mike Turquette <mturquette@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>

Hi Arnd, Olof, Kevin

This is based on tags/samsung-dt-2 and including exynos4 related clock
changes to support cpufreq-dt driver for exynos4 SoCs. Note that I've
created one more clk topic branch called v4.3-topic/clk-samsung-2 based
on previous one has been merged by Mike into clock tree before but I'm
not sure new one merged into clk tree that's why I've noted its merge in
this signed tag.

Please pull.

Thanks,
Kukjin


The following changes since commit 71ae9acc2e3b4b85a08c65e7f411d110b786ca1d:

  ARM: dts: Add SPI CS on exynos5250-snow (2015-07-30 23:12:43 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt-3

for you to fetch changes up to 99f610d89b5bb1852742165b94ab99a8f63af6a9:

  ARM: dts: add CPU OPP and regulator supply property for exynos4x12
(2015-08-12 07:38:45 +0900)

----------------------------------------------------------------
Samsung 3rd DT updates for v4.3

- add CPU OPP and regulator for exynos4212 and 4412
  based on adding regarding cpu clock configuration

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (2):
      clk: exynos4x12: add cpu clock configuration data and instantiate
cpu clock
      ARM: dts: add CPU OPP and regulator supply property for exynos4x12

Kukjin Kim (1):
      Merge branch 'v4.3-topic/clk-samsung-2' into v4.3-next/dt-samsung-3

 arch/arm/boot/dts/exynos4212.dtsi               | 81
++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  4 ++
 arch/arm/boot/dts/exynos4412-origen.dts         |  4 ++
 arch/arm/boot/dts/exynos4412-trats2.dts         |  4 ++
 arch/arm/boot/dts/exynos4412.dtsi               | 83
+++++++++++++++++++++++++
 drivers/clk/samsung/clk-exynos4.c               | 50 +++++++++++++++
 6 files changed, 226 insertions(+)
