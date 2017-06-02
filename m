From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/2] ARM: dts: exynos: Use human-friendly symbols for interrupt flags
Date: Fri,  2 Jun 2017 20:13:44 +0200
Message-ID: <20170602181346.32166-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750971AbdFBSN7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Jun 2017 14:13:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

Tested with comparing decompiled DTBs (dtx_diff). No differences.

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  ARM: dts: exynos: Use human-friendly symbols for interrupt flags in
    board sources
  ARM: dts: exynos: Use human-friendly symbols for GIC interrupt
    properties

 arch/arm/boot/dts/exynos3250-monk.dts             |  6 +-
 arch/arm/boot/dts/exynos3250-rinato.dts           |  6 +-
 arch/arm/boot/dts/exynos4210-origen.dts           |  2 +-
 arch/arm/boot/dts/exynos4210-trats.dts            |  4 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi   |  6 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts          |  2 +-
 arch/arm/boot/dts/exynos4412-trats2.dts           |  8 +--
 arch/arm/boot/dts/exynos5.dtsi                    | 84 +++++++++++------------
 arch/arm/boot/dts/exynos5250.dtsi                 |  8 +--
 arch/arm/boot/dts/exynos5420-peach-pit.dts        |  4 +-
 arch/arm/boot/dts/exynos5420.dtsi                 | 76 ++++++++++----------
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi |  2 +-
 arch/arm/boot/dts/exynos5440.dtsi                 |  2 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts         |  4 +-
 14 files changed, 107 insertions(+), 107 deletions(-)

-- 
2.9.3
