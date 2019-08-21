From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v13 0/8] Exynos5 Dynamic Memory Controller driver
Date: Wed, 21 Aug 2019 12:42:55 +0200
Message-ID: <20190821104303.32079-1-l.luba@partner.samsung.com>
References: <CGME20190821104316eucas1p2ecd715f3105921ec83e0acf1291201f8@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi all,

This is v13 which makes cosmetic changes. It is based on current mainline
(v5.3-rc5) with with devfreq/for-next where there is a PPMU patch [1].

The patch set adds support of Dynamic Memory Controller for Exynos5422 SoC.
The driver supports Dynamic Voltage and Frequency Scaling
for the DMC and DRAM. It also provides needed timings for different
speed operations of the DRAM memory.
There is also new generic code in of_memory and headers which allows to parse
LPDDR3 memories defined in device-tree.

Here are the last changes suggested by Krzysztof during his review.
For the previous changes in older revisions please refer to [2], there is
more detailed change log.

changes:
v13:
- skipped patch with chipID changes in DT, since it is not used anymore,
- removed license comment in of_memory.c since SPDX has been merged,
- aligned comment to the current fields in the structure,
- changed printed warning when timings are not found,

Regards,
Lukasz Luba

[1] https://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git/commit/?h=for-next&id=b617376df8f01c975dee66802f4da16291f92079
[2] https://lkml.org/lkml/2019/7/22/251


Lukasz Luba (8):
  dt-bindings: ddr: rename lpddr2 directory
  dt-bindings: ddr: add LPDDR3 memories
  drivers: memory: extend of_memory by LPDDR3 support
  dt-bindings: memory-controllers: add Exynos5422 DMC device description
  drivers: memory: add DMC driver for Exynos5422
  ARM: dts: exynos: add syscon to clock compatible
  ARM: dts: exynos: add DMC device for exynos5422
  ARM: exynos_defconfig: enable DMC driver

 .../{lpddr2 => ddr}/lpddr2-timings.txt        |    0
 .../bindings/{lpddr2 => ddr}/lpddr2.txt       |    2 +-
 .../bindings/ddr/lpddr3-timings.txt           |   58 +
 .../devicetree/bindings/ddr/lpddr3.txt        |   97 ++
 .../memory-controllers/exynos5422-dmc.txt     |   73 +
 MAINTAINERS                                   |    8 +
 arch/arm/boot/dts/exynos5420.dtsi             |   73 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  116 ++
 arch/arm/boot/dts/exynos5800.dtsi             |    2 +-
 arch/arm/configs/exynos_defconfig             |    1 +
 drivers/memory/jedec_ddr.h                    |   61 +
 drivers/memory/of_memory.c                    |  149 ++
 drivers/memory/of_memory.h                    |   18 +
 drivers/memory/samsung/Kconfig                |   13 +
 drivers/memory/samsung/Makefile               |    1 +
 drivers/memory/samsung/exynos5422-dmc.c       | 1257 +++++++++++++++++
 16 files changed, 1926 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/{lpddr2 => ddr}/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{lpddr2 => ddr}/lpddr2.txt (96%)
 create mode 100644 Documentation/devicetree/bindings/ddr/lpddr3-timings.txt
 create mode 100644 Documentation/devicetree/bindings/ddr/lpddr3.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
 create mode 100644 drivers/memory/samsung/exynos5422-dmc.c

-- 
2.17.1
