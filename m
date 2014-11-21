From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 4/5] Samsung 2nd round of DT updates for v3.19
Date: Fri, 21 Nov 2014 23:16:18 +0900
Message-ID: <546F4932.2070702@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:39499 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755426AbaKUOQX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 09:16:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit e540920cf21c2764047b8a6ddaeaa0683624e46e:

  ARM: dts: add CPU nodes for Exynos4 SoCs (2014-10-21 00:12:42 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt-2

for you to fetch changes up to a427d15062ac46a00a22d2f0b9d05093c18ff2f1:

  ARM: dts: Add micro SD card SDHCI node for exynos4412-trats
(2014-11-07 08:28:24 +0900)

----------------------------------------------------------------
Samsung 2nd DT updates for v3.19

- add micro SD card SDHCI node for exynos4412-trats
- add exynos4415 DT
- add exynos3250-rinato DT and sleep mode support

Note: based on previous tags/samsung-dt for v3.19

----------------------------------------------------------------
Chanwoo Choi (4):
      ARM: dts: Add board dts file for exynos3250-rinato
      ARM: dts: Add sleep mode pin configuration for exynos3250-rinato
      ARM: dts: Add sleep mode of regulator for exynos3250-rinato
      ARM: dts: Add dts files for exynos4415 SoC

Krzysztof Kozlowski (1):
      ARM: dts: Add micro SD card SDHCI node for exynos4412-trats

 arch/arm/boot/dts/Makefile                |   3 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi |  16 +
 arch/arm/boot/dts/exynos3250-rinato.dts   | 686
++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4412-trats2.dts   |  10 +
 arch/arm/boot/dts/exynos4415-pinctrl.dtsi | 573 +++++++++++++++++++++++++
 arch/arm/boot/dts/exynos4415.dtsi         | 604 ++++++++++++++++++++++++++
 6 files changed, 1891 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-rinato.dts
 create mode 100644 arch/arm/boot/dts/exynos4415-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4415.dtsi
