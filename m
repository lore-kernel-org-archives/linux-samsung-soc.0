From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 00/10] ARM: Remove support for Exynos5440
Date: Tue, 24 Apr 2018 22:32:29 +0200
Message-ID: <20180424203239.21885-1-krzk__25446.683218661$1524601886$gmane$org@kernel.org>
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
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Cc: Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,


Overview
========
Let's continue the removal of old platforms. We already get rid of Exynos4212.
Now it's time for Exynos5440.

The Exynos5440 (quad-core A15 with GMAC, PCIe, SATA) was targeting
server platforms but it did not make it to the market really.  There are
no development boards with it and probably there are no real products
neither.  The development for Exynos5440 ended in 2013 and since then
the platform is in maintenance mode.

The only development happening around it is the PCIe driver for Exynos5433
(ARMv8). [1]

Removing Exynos5440, makes our life slightly easier:
1. Less maintenance,
2. Smaller code, less quirks,
3. No need to preserve (imaginary) backward-compatibility for Exynos PCIe
   driver (so it is easier to add support for Exynos5433).


Because of point (3) above - I left the PCIe and PCIe PHY drivers intact.


Dependencies
============
I think about starting with removal of DTS in some kernel release (patch 1/10).
Then all drivers can be removed/updated - subsystem maintainers can pick their
patches freely.

Finally, after getting rid of all Exynos5440 symbols, the last patch (10/10) will
end in arm-soc tree.


Any comments?


Best regards,
Krzysztof

[1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1569919.html

Krzysztof Kozlowski (10):
  ARM: dts: exynos: Remove Exynos5440
  ata: ahci-platform: Remove support for Exynos5440
  cpufreq: exynos: Remove support for Exynos5440
  clk: samsung: Remove support for Exynos5440
  i2c: s3c2410: Remove support for Exynos5440
  thermal: samsung: Remove support for Exynos5440
  pinctrl: samsung: Remove support for Exynos5440
  spi: s3c64xx: samsung: Remove support for Exynos5440
  usb: host: exynos: Remove support for Exynos5440
  ARM: exynos: Remove support for Exynos5440

 .../bindings/arm/samsung/samsung-boards.txt        |    2 -
 .../devicetree/bindings/ata/ahci-platform.txt      |    1 -
 .../devicetree/bindings/clock/exynos5440-clock.txt |   28 -
 .../bindings/cpufreq/cpufreq-exynos5440.txt        |   28 -
 .../devicetree/bindings/i2c/i2c-s3c2410.txt        |    4 +-
 .../devicetree/bindings/thermal/exynos-thermal.txt |   14 +-
 arch/arm/boot/dts/Makefile                         |    2 -
 arch/arm/boot/dts/exynos5440-sd5v1.dts             |   42 -
 arch/arm/boot/dts/exynos5440-ssdk5440.dts          |   81 --
 arch/arm/boot/dts/exynos5440-tmu-sensor-conf.dtsi  |   20 -
 arch/arm/boot/dts/exynos5440-trip-points.dtsi      |   21 -
 arch/arm/boot/dts/exynos5440.dtsi                  |  355 -------
 arch/arm/mach-exynos/Kconfig                       |   12 -
 arch/arm/mach-exynos/common.h                      |    8 -
 arch/arm/mach-exynos/exynos.c                      |   15 +-
 drivers/ata/ahci_platform.c                        |    1 -
 drivers/clk/samsung/Makefile                       |    1 -
 drivers/clk/samsung/clk-exynos5440.c               |  167 ----
 drivers/cpufreq/Kconfig.arm                        |   14 -
 drivers/cpufreq/Makefile                           |    1 -
 drivers/cpufreq/exynos5440-cpufreq.c               |  452 ---------
 drivers/i2c/busses/i2c-s3c2410.c                   |    2 -
 drivers/pinctrl/samsung/Kconfig                    |   10 +-
 drivers/pinctrl/samsung/Makefile                   |    1 -
 drivers/pinctrl/samsung/pinctrl-exynos5440.c       | 1005 --------------------
 drivers/spi/spi-s3c64xx.c                          |   12 -
 drivers/thermal/samsung/exynos_tmu.c               |  155 +--
 drivers/thermal/samsung/exynos_tmu.h               |    1 -
 drivers/usb/host/ehci-exynos.c                     |    7 -
 drivers/usb/host/ohci-exynos.c                     |    6 -
 include/dt-bindings/clock/exynos5440.h             |   44 -
 31 files changed, 9 insertions(+), 2503 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos5440-clock.txt
 delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-exynos5440.txt
 delete mode 100644 arch/arm/boot/dts/exynos5440-sd5v1.dts
 delete mode 100644 arch/arm/boot/dts/exynos5440-ssdk5440.dts
 delete mode 100644 arch/arm/boot/dts/exynos5440-tmu-sensor-conf.dtsi
 delete mode 100644 arch/arm/boot/dts/exynos5440-trip-points.dtsi
 delete mode 100644 arch/arm/boot/dts/exynos5440.dtsi
 delete mode 100644 drivers/clk/samsung/clk-exynos5440.c
 delete mode 100644 drivers/cpufreq/exynos5440-cpufreq.c
 delete mode 100644 drivers/pinctrl/samsung/pinctrl-exynos5440.c
 delete mode 100644 include/dt-bindings/clock/exynos5440.h

-- 
2.14.1
