From: Pavel Fedin <p.fedin-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v7 0/4] Exynos SROMc configuration and Ethernet support for
 SMDK5410
Date: Fri, 06 Nov 2015 13:03:45 +0300
Message-ID: <cover.1446799912.git.p.fedin@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch extends Exynos SROM controller driver with ability to configure
controller outputs and enables SMSC9115 Ethernet chip on SMDK5410 board,
which is connected via SROMc bank #3.

With this patchset, support for the whole existing SMDK range can be added.
Actually, only bank number is different.

This patchset also depends on Exynos 5410 pinctrl support, introduced by
patches 0003 and 0004 from this set:
[PATCH v4 0/5] ARM: EXYNOS: ODROID-XU DT and LEDs
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/330862.html

Pinctrl support is necessary in order to correctly configure
multifunctional pins of the Exynos chip.

v6 => v7:
- Fixed stupid error in Tacc description in the documentation

v5 => v6:
- Even more improvements to the documentation, fixed some errors and typos.
- Separated adding bus ranges from generic SROMc support
- Some stuff renamed for even better code readability
- Stylistic cleanups in the DTS (everything in alphabetic order, use named
  constant name for interrupt config byte)

v4 => v5:
- Some cosmetic changes in the dtsi ("compatible" goes first)
- Use correctly specified ranges for the SROMc node
- Reuse existing properties where possible ("reg" for bank# and
  "reg-io-width" for data width)
- Separated page-mode property from timings array
- More improvements to the documentation

v3 => v4:
- Devices are now added as subnodes, with additional properties. This allows
  to cleary specify dependency. If configuration fails, error will be reported
  and child devices will not be probed.
- These additional properties now have "samsung,srom-XXX" format
- Fixed code style, now better understood.

v2 => v3:
- Fixed up SROMc region size in the device tree
- Reordered patches, documentation goes first now

v1 => v2:
- Fixed some typos and bad labels in device tree
- Improved documentation

Pavel Fedin (4):
  Documentation: dt-bindings: Describe SROMc configuration
  ARM: dts: Add SROMc to Exynos 5410
  drivers: exynos-srom: Add support for bank configuration
  ARM: dts: Add Ethernet chip to SMDK5410

 .../bindings/arm/samsung/exynos-srom.txt           | 71 +++++++++++++++++++++-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          | 41 +++++++++++++
 arch/arm/boot/dts/exynos5410.dtsi                  | 11 ++++
 arch/arm/mach-exynos/Kconfig                       |  2 +-
 drivers/soc/samsung/Kconfig                        |  2 +-
 drivers/soc/samsung/exynos-srom.c                  | 61 ++++++++++++++++++-
 6 files changed, 182 insertions(+), 6 deletions(-)

-- 
2.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
