From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 00/27] Support new Exynos3250 SoC based on Cortex-A7 dual core
Date: Thu, 10 Apr 2014 18:28:17 +0900
Message-ID: <1397122124-15690-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: hyunhee.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, yj44.cho@samsung.com, inki.dae@samsung.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This patchset support new Exynos3250 Samsung SoC based on Cortex-A7 dual core.
Exynos3250 is a System-On-Chip (SoC) that is based on 32-bit RISC processor
for Smartphone. It is desigend with the 28nm low-power high-K metal gate process
and provides the best performance features.

This patchset include some patches such as:
- Support secondary CPU of Exynos3250 (cpu up/down)
- Supoort uart/mct/adc/gic/i2c/spi/power-domain/pmu/mshc/pwm/amba
- Support the gpio control for Exynos3250 using pinctrl
- Support the clock control for Exynos3250 using common clk framework

Chanwoo Choi (11):
  ARM: EXYNOS: Add Exynos3250 SoC ID
  ARM: EXYNOS: Add IO mapping for non-secure SYSRAM of Exynos3250
  ARM: EXYNOS: Add IO mapping for PMU of Exynos3250
  ARM: EXYNOS: Support secondary CPU boot of Exynos3250
  ARM: EXYNOS:: Enter a15 lowpower mode for Exynos3250 based on Cortex-a7
  irqchip: Declare cortex-a7's irqchip to initialize gic from dt
  ARM: dts: exynos3250: Add default interrupt-parent connected with GIC
  ARM: dts: exynos3250: Add uart dt node to support seiral ports
  ARM: dts: exynos3250: Add MCT dt node
  ARM: dts: exynos3250: Add ADC dt node to read analog raw data
  ARM: dts: exynos3250: Add CPUs dt node for Exynos3250

Hyunhee Kim (1):
  ARM: dts: exynos3250: Add PMU dt data

Inki Dae (2):
  ARM: dts: exynos3250: Add i2c dt node
  ARM: dts: exynos3250: Add power domain dt nodes

Kyungmin Park (2):
  ARM: EXYNOS: Support secondary CPU boot of Exynos4212
  ARM: dts: exynos3250: Add Mobile Storage Host Card

Tomasz Figa (11):
  pinctrl: exynos: Add driver data for Exynos3250
  clk: samsung: exynos3250: Add clocks using common clock framework
  ARM: dts: exynos3250: Add new exynos3250.dtsi file
  ARM: dts: exynos3250: Add GIC dt node for Exynos3250
  ARM: dts: exynos3250: Add pin control device tree data
  ARM: dts: exynos3250: Add device tree nodes for clock controllers
  ARM: dts: exynos3250: Move definitions of external clocks to SoC dtsi
  ARM: dts: exynos3250: Add amba and pdma dt node
  ARM: dts: exynos3250: Add spi dt node to support spi bus
  ARM: dts: exynos3250: Add pwm dt node to support PWM Timer
  ARM: dts: exynos3250: Add RTC dt node

 arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 477 ++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi         | 410 ++++++++++++++++
 arch/arm/mach-exynos/Kconfig              |  22 +
 arch/arm/mach-exynos/exynos.c             |  18 +
 arch/arm/mach-exynos/firmware.c           |  17 +-
 arch/arm/mach-exynos/hotplug.c            |  13 +-
 arch/arm/mach-exynos/include/mach/map.h   |   2 +
 arch/arm/plat-samsung/include/plat/cpu.h  |  10 +
 drivers/clk/samsung/Makefile              |   1 +
 drivers/clk/samsung/clk-exynos3250.c      | 785 ++++++++++++++++++++++++++++++
 drivers/irqchip/irq-gic.c                 |   1 +
 drivers/pinctrl/pinctrl-exynos.c          |  67 +++
 drivers/pinctrl/pinctrl-samsung.c         |   2 +
 drivers/pinctrl/pinctrl-samsung.h         |   1 +
 include/dt-bindings/clock/exynos3250.h    | 256 ++++++++++
 15 files changed, 2077 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos3250-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/exynos3250.dtsi
 create mode 100644 drivers/clk/samsung/clk-exynos3250.c
 create mode 100644 include/dt-bindings/clock/exynos3250.h

-- 
1.8.0
