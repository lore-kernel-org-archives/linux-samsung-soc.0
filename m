From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3rd 2/3] Samsung Exynos SoC updates for 3.16
Date: Mon, 26 May 2014 13:03:22 +0900
Message-ID: <035701cf7897$6fb5e460$4f21ad20$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:10656 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbaEZEDY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 00:03:24 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6500183XXN6V30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 13:03:23 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The following changes since commit be1f7c8d7e2bc8b8c76846aa6f276e8d2ef8975a:

  cpufreq: exynos: Fix the compile error (2014-05-26 04:05:01 +0900)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/exynos-soc

for you to fetch changes up to 455ae9aba2f05e77eaf1073b78e887b06f93a4fd:

  ARM: dts: Add device tree sources for exynos3250 (2014-05-26 05:32:02
+0900)

----------------------------------------------------------------
Exynos new SoCs support for v3.16

- add support for exynos5260 SoC and exynos5260-xyref5260 board
- add support for exynos5800 SoC and exynos5800-peach-pi board
- add support for exynos3250 SoC

Note that this branch is on top of tags/samsung-cleanup.

----------------------------------------------------------------
Arun Kumar K (4):
      ARM: EXYNOS: Add 5800 SoC support
      ARM: dts: Add exynos5800 dt file
      ARM: dts: Add exynos5800-peach-pi board support
      ARM: dts: Add mfc node for exynos5800

Chanwoo Choi (2):
      ARM: EXYNOS: Add Exynos3250 SoC ID
      ARM: EXYNOS: Support secondary CPU boot of Exynos3250

Pankaj Dubey (1):
      ARM: EXYNOS: initial board support for exynos5260 SoC

Rahul Sharma (5):
      ARM: dts: add dts files for exynos5260 SoC
      ARM: dts: add dts files for exynos5260-xyref5260 board
      ARM: dts: enable hdmi for exynos5800-peach-pi board
      ARM: dts: enable display controller for exynos5800-peach-pi board
      ARM: dts: enable fimd for exynos5800-peach-pi board

Tomasz Figa (1):
      ARM: dts: Add device tree sources for exynos3250

Vivek Gautam (1):
      ARM: dts: Add Vbus regulator for USB 3.0 on exynos5800-peach-pi

 arch/arm/boot/dts/Makefile                 |    4 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi  |  475 +++++++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi          |  439 +++++++++++++++++++++
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi  |  574
++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5260-xyref5260.dts |  103 +++++
 arch/arm/boot/dts/exynos5260.dtsi          |  304 +++++++++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  |  253 ++++++++++++
 arch/arm/boot/dts/exynos5800.dtsi          |   28 ++
 arch/arm/mach-exynos/Kconfig               |   32 ++
 arch/arm/mach-exynos/common.h              |   21 +-
 arch/arm/mach-exynos/exynos.c              |    3 +
 arch/arm/mach-exynos/firmware.c            |    9 +-
 arch/arm/mach-exynos/platsmp.c             |    2 +-
 13 files changed, 2243 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/exynos3250.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5260-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5260-xyref5260.dts
 create mode 100644 arch/arm/boot/dts/exynos5260.dtsi
 create mode 100644 arch/arm/boot/dts/exynos5800-peach-pi.dts
 create mode 100644 arch/arm/boot/dts/exynos5800.dtsi
