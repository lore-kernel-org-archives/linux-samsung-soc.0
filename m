From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/5] Samsung clock updates for 3.16
Date: Tue, 20 May 2014 10:11:03 +0900
Message-ID: <014501cf73c8$5eb66960$1c233c20$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:44863 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751660AbaETBLF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 May 2014 21:11:05 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5U00IPULYGVL00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 10:11:04 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, olof@lixom.net, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <t.figa@samsung.com>

The following changes since commit 34c453ce16633539a94a2e876faeb731ac1be899:

  ARM: S3C24XX: fix merge conflict (2014-05-15 05:54:38 +0900)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-clk

for you to fetch changes up to 6520e968eef4f88c076a84a80e026049d157132e:

  clk: exynos5420: Add 5800 specific clocks (2014-05-19 22:15:08 +0900)

----------------------------------------------------------------
Samsung clock updates for 3.16

In this time, it is having dependency with arch/arm/ for 3.16,
I pulled them into samsung tree from Tomasz under agreement from Mike.

- Pull for_3.16/exynos5260 from Tomasz Figa:

  "This pull request contains patches preparing Samsung Common Clock
Framework
  helpers to support Exynos5260 by adding support for multiple clock
providers
  and then adding clock driver for Exynos5260."

- Pull for_3.16/clk_fixes_non_critical from Tomasz Figa:

  "This pull requests contains a number of non-critical fixes for Samsung
clock
  framework and drivers, including:
  1) a series of fixes for Exynos5420 to correct clock definitions and make
the
  driver closer to the documentation,
  2) several missing clocks and clock IDs added to Exynos4, Exynos5250 and
  Exynos5420 drivers,
  3) fix for incorrect initialization of clock table with NULL,
  4) compiler warning fix."

- Pull for_3.16/clk_cleanup from Tomasz Figa:

  "This pull requests contains minor clean-up related to Samsung clock
  support, including:
  1) move Kconfig entries of Samsung clock drivers to drivers/clk,
  2) compile drivers/clk/samsung conditionally when COMMON_CLK_SAMSUNG is
  selected,
  3) remove obsolete Kconfig lines after moving s3c24xx to CCF."

- Pull for_3.16/exynos3250 from Tomasz Figa:

  "This small pull request contains a patch adding clock driver for
Exynos3250,
  which depends on previous pull requests in this series."

- add dt bindings for exynos3250 clock
- add exynos5800 specific clocks in current exynos5420 clock

Note that this branch is based on s3c24xx ccf branch

----------------------------------------------------------------
Alim Akhtar (1):
      clk: exynos5420: Add 5800 specific clocks

Arun Kumar K (2):
      clk: samsung: exynos5250: Add clocks for G3D
      clk: samsung: exynos5420: Add clock IDs needed by GPU

Chanwoo Choi (1):
      dt-bindings: add documentation for Exynos3250 clock controller

Kukjin Kim (4):
      Merge branch 'for_3.16/exynos5260' of
git://git.kernel.org/.../tfiga/samsung-clk into v3.16-next/clk-samsung
      Merge branch 'for_3.16/clk_fixes_non_critical' of
git://git.kernel.org/.../tfiga/samsung-clk into v3.16-next/clk-samsung
      Merge branch 'for_3.16/clk_cleanup' of
git://git.kernel.org/.../tfiga/samsung-clk into v3.16-next/clk-samsung
      Merge branch 'for_3.16/exynos3250' of
git://git.kernel.org/.../tfiga/samsung-clk into v3.16-next/clk-samsung

Naveen Krishna Chatradhi (1):
      clk: samsung: exynos5250/5420: Add gate clock for SSS module

Pankaj Dubey (6):
      clk/samsung: add support for pll2550xx
      clk: samsung: fixed compiler warning [-Wpointer-to-int-cast]
      clk: samsung: add new Kconfig for Samsung common clock option
      ARM: select COMMON_CLK_SAMSUNG for ARCH_EXYNOS and ARCH_S3C64XX
      ARM: S3C24XX: move S3C24XX clock Kconfig options to Samsung clock
Kconfig file
      drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock support

Rahul Sharma (4):
      clk/samsung: add support for multiple clock providers
      clk/samsung: add support for pll2650xx
      clk/exynos5260: add macros and documentation for exynos5260
      clk/exynos5260: add clock file for exynos5260

Sachin Kamat (1):
      clk: samsung: exynos5420: Fix VPLL lock offset

Shaik Ameer Basha (15):
      clk: samsung: exynos5420: Rename mux parent arrays
      clk: samsung: exynos5420: add clocks for ISP block
      clk: samsung: exynos5420: update clocks for GSCL and MSCL blocks
      clk: samsung: exynos5420: fix parent clocks for mscl sysmmu
      clk: samsung: exynos5420: update clocks for G2D and G3D blocks
      clk: samsung: exynos5420: update clocks for DISP1 block
      clk: samsung: exynos5420: update clocks for PERIC block
      clk: samsung: exynos5420: update clocks for PERIS and GEN blocks
      clk: samsung: exynos5420: update clocks for WCORE block
      clk: samsung: exynos5420: update clocks for FSYS and FSYS2 blocks
      clk: samsung: exynos5420: correct sysmmu-mfc parent clocks
      clk: samsung: exynos5420: fix register offset for sclk_bpll
      clk: samsung: exynos5420: update clocks for MAU Block
      clk: samsung: exynos5420: add misc clocks
      clk: samsung: exynos5420: add more registers to restore list

Sylwester Nawrocki (1):
      clk: samsung: exynos4: Use single clock ID for CLK_MDMA gate clocks

Tomasz Figa (3):
      clk: samsung: Initialize clock table with error pointers
      ARM: S3C24XX: Remove omitted Kconfig selects and conditionals
      clk: samsung: exynos3250: Add clocks using common clock framework

Tomasz Stanislawski (1):
      clk: samsung: exynos4: export sclk_hdmiphy clock

 .../devicetree/bindings/clock/exynos3250-clock.txt |   41 +
 .../devicetree/bindings/clock/exynos5260-clock.txt |  190 ++
 .../devicetree/bindings/clock/exynos5420-clock.txt |    3 +-
 .../bindings/clock/samsung,s3c2410-clock.txt       |    2 +-
 arch/arm/Kconfig                                   |    4 +-
 arch/arm/boot/dts/exynos5420.dtsi                  |   14 +-
 arch/arm/mach-s3c24xx/Kconfig                      |   37 +-
 drivers/clk/Kconfig                                |    2 +
 drivers/clk/Makefile                               |    2 +-
 drivers/clk/samsung/Kconfig                        |   26 +
 drivers/clk/samsung/Makefile                       |    2 +
 drivers/clk/samsung/clk-exynos3250.c               |  780 ++++++++
 drivers/clk/samsung/clk-exynos4.c                  |   51 +-
 drivers/clk/samsung/clk-exynos5250.c               |   41 +-
 drivers/clk/samsung/clk-exynos5260.c               | 1980
++++++++++++++++++++
 drivers/clk/samsung/clk-exynos5260.h               |  459 +++++
 drivers/clk/samsung/clk-exynos5420.c               | 1127 +++++++----
 drivers/clk/samsung/clk-exynos5440.c               |   18 +-
 drivers/clk/samsung/clk-pll.c                      |  223 ++-
 drivers/clk/samsung/clk-pll.h                      |    2 +
 drivers/clk/samsung/clk-s3c2410.c                  |   51 +-
 drivers/clk/samsung/clk-s3c2412.c                  |   29 +-
 drivers/clk/samsung/clk-s3c2443.c                  |   46 +-
 drivers/clk/samsung/clk-s3c64xx.c                  |   44 +-
 drivers/clk/samsung/clk.c                          |  123 +-
 drivers/clk/samsung/clk.h                          |   72 +-
 include/dt-bindings/clock/exynos3250.h             |  258 +++
 include/dt-bindings/clock/exynos4.h                |    2 +-
 include/dt-bindings/clock/exynos5250.h             |    5 +-
 include/dt-bindings/clock/exynos5260-clk.h         |  469 +++++
 include/dt-bindings/clock/exynos5420.h             |   43 +-
 31 files changed, 5543 insertions(+), 603 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/clock/exynos3250-clock.txt
 create mode 100644
Documentation/devicetree/bindings/clock/exynos5260-clock.txt
 create mode 100644 drivers/clk/samsung/Kconfig
 create mode 100644 drivers/clk/samsung/clk-exynos3250.c
 create mode 100644 drivers/clk/samsung/clk-exynos5260.c
 create mode 100644 drivers/clk/samsung/clk-exynos5260.h
 create mode 100644 include/dt-bindings/clock/exynos3250.h
 create mode 100644 include/dt-bindings/clock/exynos5260-clk.h
