From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 00/10] ARM/arm64: dts: exynos: Add support for Mali
Date: Tue, 18 Jun 2019 21:05:24 +0200
Message-ID: <20190618190534.4951-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Inspired by patch from Joseph Kogut [1], let's add support for Mali GPUs
to most of other boards.  However it was tested only on Odroid U3
(Exynos4412) and not fully because requirement of special Mesa drivers
with Lima support.

Even without tests it brings full description of hardware and replaces
some out-of-tree downstream code (e.g. in Tizen).

Comments and tests are welcomed.

[1] https://patchwork.kernel.org/patch/10996887/

Best regards,
Krzysztof


Krzysztof Kozlowski (10):
  dt-bindings: gpu: mali: Add Samsung compatibles for Midgard and Utgard
  clk: samsung: Add bus clock for GPU/G3D on Exynos4412
  ARM: dts: exynos: Fix language typo and indentation
  ARM: dts: exynos: Add GPU/Mali 400 node to Exynos3250
  ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4
  arm64: dts: exynos: Add GPU/Mali T760 node to Exynos5433
  arm64: dts: exynos: Add GPU/Mali T760 node to Exynos7
  ARM: multi_v7_defconfig: Enable Panfrost and LIMA drivers
  ARM: exynos_defconfig: Enable Panfrost and LIMA drivers
  arm64: defconfig: Enable Panfrost driver

 .../bindings/gpu/arm,mali-midgard.txt         |  1 +
 .../bindings/gpu/arm,mali-utgard.txt          |  1 +
 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  5 ++
 arch/arm/boot/dts/exynos3250-monk.dts         |  5 ++
 arch/arm/boot/dts/exynos3250-rinato.dts       |  5 ++
 arch/arm/boot/dts/exynos3250.dtsi             | 33 ++++++++++++
 arch/arm/boot/dts/exynos4.dtsi                | 29 +++++++++++
 arch/arm/boot/dts/exynos4210-origen.dts       |  5 ++
 arch/arm/boot/dts/exynos4210-trats.dts        |  4 ++
 .../boot/dts/exynos4210-universal_c210.dts    |  5 ++
 arch/arm/boot/dts/exynos4210.dtsi             | 36 +++++++++++--
 .../boot/dts/exynos4412-itop-scp-core.dtsi    |  5 ++
 arch/arm/boot/dts/exynos4412-midas.dtsi       |  5 ++
 .../boot/dts/exynos4412-odroid-common.dtsi    |  5 ++
 arch/arm/boot/dts/exynos4412.dtsi             | 32 ++++++++++++
 arch/arm/configs/exynos_defconfig             |  3 +-
 arch/arm/configs/multi_v7_defconfig           |  3 +-
 .../dts/exynos/exynos5433-tm2-common.dtsi     |  5 ++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 51 +++++++++++++++++++
 .../boot/dts/exynos/exynos7-espresso.dts      |  5 ++
 arch/arm64/boot/dts/exynos/exynos7.dtsi       | 11 ++++
 arch/arm64/configs/defconfig                  |  2 +-
 drivers/clk/samsung/clk-exynos4.c             |  1 +
 include/dt-bindings/clock/exynos4.h           |  1 +
 24 files changed, 251 insertions(+), 7 deletions(-)

-- 
2.17.1
