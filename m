From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/2] 3rd Round Samsung DT s3c64xx for v3.12
Date: Wed, 28 Aug 2013 09:59:05 +0900
Message-ID: <235201cea389$cb3cce90$61b66bb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45820 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753051Ab3H1A7H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Aug 2013 20:59:07 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MS7008WXUQ5QYF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Aug 2013 09:59:05 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Mike Turquette' <mturquette@linaro.org>

The following changes since commit 1ca2dad9588ac09310154a480f8f9cf400760a31:

  Merge branch 'clk-next-s3c64xx-delta' into v3.12-next/common-clk-s3c64xx
(2013-08-28 01:03:31 +0900)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt-s3c64xx

for you to fetch changes up to 75094f99b0d23d6ecdf5cc9a9d98ea670482c914:

  ARM: dts: Add dts file for S3C6410-based SMDK6410 board (2013-08-28
01:18:59 +0900)

----------------------------------------------------------------
Add device tree support for S3C64xx
- add device tree infrastructure for s3c64xx
- add DT SoC file for s3c64XX
- add DT board file for FriendlyARM Mini6410 board
- add DT board file for SAMSUNG SMDK6410

Based on Common clk for S3C64XX
- this branch is on top of v3.12-next/common-clk-s3c64xx

----------------------------------------------------------------
Tomasz Figa (7):
      irqchip: vic: Parse interrupt and resume masks from device tree
      ARM: S3C64XX: Bypass legacy initialization when booting with DT
      gpio: samsung: Skip initialization if device tree is present
      ARM: S3C64XX: Add board file for boot using Device Tree
      ARM: dts: Add basic dts include files for Samsung S3C64xx SoCs
      ARM: dts: Add dts file for S3C6410-based Mini6410 board
      ARM: dts: Add dts file for S3C6410-based SMDK6410 board

 Documentation/devicetree/bindings/arm/vic.txt |   12 +
 arch/arm/boot/dts/Makefile                    |    2 +
 arch/arm/boot/dts/s3c6400.dtsi                |   41 ++
 arch/arm/boot/dts/s3c6410-mini6410.dts        |  228 ++++++++
 arch/arm/boot/dts/s3c6410-smdk6410.dts        |  103 ++++
 arch/arm/boot/dts/s3c6410.dtsi                |   57 ++
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi        |  687
+++++++++++++++++++++++++
 arch/arm/boot/dts/s3c64xx.dtsi                |  199 +++++++
 arch/arm/mach-s3c64xx/Kconfig                 |   16 +
 arch/arm/mach-s3c64xx/Makefile                |    1 +
 arch/arm/mach-s3c64xx/common.c                |   12 +
 arch/arm/mach-s3c64xx/dma.c                   |    9 +
 arch/arm/mach-s3c64xx/irq-pm.c                |    9 +
 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c       |   85 +++
 arch/arm/mach-s3c64xx/s3c6400.c               |    9 +
 arch/arm/mach-s3c64xx/s3c6410.c               |    9 +
 arch/arm/plat-samsung/init.c                  |   12 +-
 drivers/gpio/gpio-samsung.c                   |   34 +-
 drivers/irqchip/irq-vic.c                     |    7 +-
 19 files changed, 1503 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm/boot/dts/s3c6400.dtsi
 create mode 100644 arch/arm/boot/dts/s3c6410-mini6410.dts
 create mode 100644 arch/arm/boot/dts/s3c6410-smdk6410.dts
 create mode 100644 arch/arm/boot/dts/s3c6410.dtsi
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/s3c64xx.dtsi
 create mode 100644 arch/arm/mach-s3c64xx/mach-s3c64xx-dt.c
