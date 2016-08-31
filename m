From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/7] ARM: dts: exynos: Remove skeleton.dtsi usage and fix memory node DTC warnings
Date: Wed, 31 Aug 2016 14:14:32 +0200
Message-ID: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

This series removes the usage of the skeleton.dtsi in all the Exynos dts,
which allows to get rid of the DTC warnings about a mismatch between the
memory nodes' unit names and reg properties.

Patches are pretty trivial and shouldn't cause functional changes AFAIK,
but only the Exynos5 changes have been tested. The others patches were
just built tested.

Best regards,
Javier


Javier Martinez Canillas (7):
  ARM: dts: exynos: Add missing memory node for Exynos5440 boards
  ARM: dts: exynos: Remove skeleton.dtsi usage for Exynos3
  ARM: dts: exynos: Remove skeleton.dtsi usage for Exynos4
  ARM: dts: exynos: Remove skeleton.dtsi usage for Exynos5
  ARM: dts: exynos: Add missing unit name to memory nodes in Exynos3 DTS
  ARM: dts: exynos: Add missing unit name to memory nodes in Exynos4 DTS
  ARM: dts: exynos: Add missing unit name to memory nodes in Exynos5 DTS

 arch/arm/boot/dts/exynos3250-artik5.dtsi           | 3 ++-
 arch/arm/boot/dts/exynos3250-monk.dts              | 3 ++-
 arch/arm/boot/dts/exynos3250-rinato.dts            | 3 ++-
 arch/arm/boot/dts/exynos3250.dtsi                  | 3 ++-
 arch/arm/boot/dts/exynos4.dtsi                     | 3 ++-
 arch/arm/boot/dts/exynos4210-origen.dts            | 3 ++-
 arch/arm/boot/dts/exynos4210-smdkv310.dts          | 3 ++-
 arch/arm/boot/dts/exynos4210-trats.dts             | 3 ++-
 arch/arm/boot/dts/exynos4210-universal_c210.dts    | 3 ++-
 arch/arm/boot/dts/exynos4412-odroidu3.dts          | 3 ++-
 arch/arm/boot/dts/exynos4412-odroidx.dts           | 3 ++-
 arch/arm/boot/dts/exynos4412-odroidx2.dts          | 3 ++-
 arch/arm/boot/dts/exynos4412-origen.dts            | 3 ++-
 arch/arm/boot/dts/exynos4412-smdk4412.dts          | 3 ++-
 arch/arm/boot/dts/exynos4412-tiny4412.dts          | 3 ++-
 arch/arm/boot/dts/exynos4412-trats2.dts            | 3 ++-
 arch/arm/boot/dts/exynos4415.dtsi                  | 3 ++-
 arch/arm/boot/dts/exynos5.dtsi                     | 3 ++-
 arch/arm/boot/dts/exynos5250-arndale.dts           | 3 ++-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          | 3 ++-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 3 ++-
 arch/arm/boot/dts/exynos5250-spring.dts            | 3 ++-
 arch/arm/boot/dts/exynos5260-xyref5260.dts         | 3 ++-
 arch/arm/boot/dts/exynos5260.dtsi                  | 4 ++--
 arch/arm/boot/dts/exynos5410-odroidxu.dts          | 3 ++-
 arch/arm/boot/dts/exynos5410-smdk5410.dts          | 3 ++-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 3 ++-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 3 ++-
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 3 ++-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 3 ++-
 arch/arm/boot/dts/exynos5440-sd5v1.dts             | 5 +++++
 arch/arm/boot/dts/exynos5440-ssdk5440.dts          | 5 +++++
 arch/arm/boot/dts/exynos5440.dtsi                  | 3 ++-
 arch/arm/boot/dts/exynos54xx.dtsi                  | 1 -
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 3 ++-
 35 files changed, 74 insertions(+), 34 deletions(-)

-- 
2.7.4
