From: Simon Shields <simon@lineageos.org>
Subject: [PATCH 0/5] midas: fix IRQ pin configuration
Date: Sat, 21 Jul 2018 22:50:48 +1000
Message-ID: <20180721125128.31498-1-simon@lineageos.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Simon Shields <simon@lineageos.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch series disables the internal pull-up/down resistors
for IRQ lines which are pulled up externally. Without these patches the
associated IRQs never fire if the bootloader hasn't configured the pins
correctly.

Simon Shields (5):
  ARM: dts: exynos: add max77693 pinctrl config for midas
  ARM: dts: exynos: add pinctrl config for midas keys
  ARM: dts: exynos: add pinctrl for midas fuelgauge irq pin
  ARM: dts: exynos: configure max77686 IRQ pin on midas
  ARM: dts: exynos: configure midas SD card CD pin

 arch/arm/boot/dts/exynos4412-midas.dtsi | 35 ++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

-- 
2.18.0
