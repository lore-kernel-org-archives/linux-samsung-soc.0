From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v2 0/4] Devicetree updates for Exynos 5260
Date: Tue, 19 Feb 2019 13:03:33 +0000
Message-ID: <20190219130337.21353-1-stuart@menefy.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

These four patches are stand alone updates for the Exynos 5260 device
tree, which do not depend on any other code changes. They either
fix issues or add functionality which is already available
on other Exynos devices. They were previously posted as version 1
of the larger patch series "Resuscitate Exynos 5260 support"
https://www.spinics.net/lists/linux-samsung-soc/#65035
which was only posted to the samsung-soc mailing list.

Changes since v1:
- Removed from larger patch set for easier review
- Applied reviewer comments to patch 2/4 "Add high speed I2C ports
  for exynos5260"
- Expanded patch comments

Stuart Menefy (4):
  ARM: dts: exynos: Use bustop PLL as the source for MMC clocks on
    Exynos5260
  ARM: dts: exynos: Add high speed I2C ports for exynos5260
  ARM: dts: exynos: Add interrupts for dedicated EINTs on Exynos5260
  ARM: dts: exynos: Fix interrupt for shared EINTs on Exynos5260

 arch/arm/boot/dts/exynos5260-pinctrl.dtsi | 16 ++++++
 arch/arm/boot/dts/exynos5260.dtsi         | 82 ++++++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 1 deletion(-)

-- 
2.13.6
