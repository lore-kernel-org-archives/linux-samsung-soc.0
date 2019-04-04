From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 0/8] Exynos Adaptive Supply Voltage support
Date: Thu, 04 Apr 2019 19:17:27 +0200
Message-ID: <20190404171735.12815-1-s.nawrocki@samsung.com>
References: <CGME20190404172220epcas1p3a6a8d843780321c4914a63d589c56b33@epcas1p3.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Adaptive Supply Voltage (ASV) on Exynos SoCs is a technique of adjusting
subsystem operating points, i.e. power supply voltage for given clock 
frequency, in order to better match actual capabilities of the hardware 
and optimize power consumption.  This applies to subsystems of the SoC like: 
CPU clusters, GPU, the memory controller or camera ISP.  During production 
process the SoC chip is assigned to one of several bins (ASV groups) and 
the group information is encoded in the SoC CHIPID block registers and/or 
OTP memory.  This information is then used to select more finely matching 
operating points for devices.

The motivation of this patch set was, amongst others, to ensure proper 
Odroid XU3/XU4 operation with highest performance operating points.

This patch set adds a driver parsing ASV tables from DT and finely 
adjusting CPU operating points to optimize power consumption and ensure 
proper operation for each SoC revision.

I just recently noticed there are already somewhat similar drivers located
in drivers/power/avs, I'm considering moving exynos-asv driver there in next 
iteration of this patch set. 

This patch set includes Exynos CHIPID driver posted by Pankaj Dubey and
futher improved by Bartlomiej Zolnierkiewicz [1].

Tested on Odroid XU3, XU3 Lite, XU4 and Exynos5433 TM2 board (with further 
patches not included in this series).

The DT binding documented in patch 3/8 doesn't describe any hardware,
it's purely software description.  I'd like to get some feedback specially
on that one, I thought it was reasonable to put that data in DT.  There 
will be many of this tables, per each SoC type and the driver looks much
better with those tables in DT IMHO. 

[1] https://lkml.org/lkml/2018/11/15/908

Pankaj Dubey (3):
  soc: samsung: Add exynos chipid driver support
  ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
  ARM64: EXYNOS: enable exynos_chipid for ARCH_EXYNOS

Sylwester Nawrocki (5):
  soc: samsung: Exynos chipid driver update
  dt-bindings: exynos: Add ASV tables binding documentation
  soc: samsung: Add Exynos Adaptive Supply Voltage driver
  ARM: EXYNOS: Enable exynos-asv driver for ARCH_EXYNOS
  ARM: dts: exynos: Add ASV tables for exynos5422/5800

 .../devicetree/bindings/arm/samsung/asv.txt   |  76 +++++
 arch/arm/boot/dts/exynos5.dtsi                |   2 +-
 arch/arm/boot/dts/exynos5800.dtsi             | 207 +++++++++++++
 arch/arm/mach-exynos/Kconfig                  |   2 +
 arch/arm64/Kconfig.platforms                  |   1 +
 drivers/soc/samsung/Kconfig                   |  16 +
 drivers/soc/samsung/Makefile                  |   5 +
 drivers/soc/samsung/exynos-asv.c              | 279 ++++++++++++++++++
 drivers/soc/samsung/exynos-asv.h              | 114 +++++++
 drivers/soc/samsung/exynos-chipid.c           | 113 +++++++
 drivers/soc/samsung/exynos-chipid.h           |  48 +++
 drivers/soc/samsung/exynos5422-asv.c          | 209 +++++++++++++
 drivers/soc/samsung/exynos5422-asv.h          |  25 ++
 13 files changed, 1096 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/asv.txt
 create mode 100644 drivers/soc/samsung/exynos-asv.c
 create mode 100644 drivers/soc/samsung/exynos-asv.h
 create mode 100644 drivers/soc/samsung/exynos-chipid.c
 create mode 100644 drivers/soc/samsung/exynos-chipid.h
 create mode 100644 drivers/soc/samsung/exynos5422-asv.c
 create mode 100644 drivers/soc/samsung/exynos5422-asv.h

-- 
2.17.1
