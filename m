From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/5] ARM: dts: Use GPIO constants for flags cells in exynos boards
Date: Wed,  7 Oct 2015 15:14:12 +0200
Message-ID: <1444223657-7248-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:47648 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751157AbbJGNOd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 09:14:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

This series contains trivial patches that use the GPIO constants
defined in include/dt-bindings/gpio/gpio.h to express GPIO polarity
instead of numeric values.

There is no functional change and the compiled dtbs are unchanged but
is a good practice to use the defined macros instead of magic numbers
since that makes the DTS more readable.

Since the changes are trivial, I thought that split the changes per
board DTS would create an unnecessary churn but a single patch would
maybe be harder to review so I decided that split it by SoC family
would be a good trade off.

Please let me know if you prefer another approach.

Best regards,
Javier


Javier Martinez Canillas (5):
  ARM: dts: Use GPIO constants for flags cells in exynos3250 boards
  ARM: dts: Use GPIO constants for flags cells in exynos4120 boards
  ARM: dts: Use GPIO constants for flags cells in exynos4412 boards
  ARM: dts: Use GPIO constants for flags cells in exynos5420/5422/5800
    boards
  ARM: dts: Use GPIO constants for flags cells in exynos5440 boards

 arch/arm/boot/dts/exynos3250-monk.dts              |  8 ++---
 arch/arm/boot/dts/exynos3250-rinato.dts            | 10 +++---
 arch/arm/boot/dts/exynos4210-origen.dts            | 15 ++++----
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |  3 +-
 arch/arm/boot/dts/exynos4210-trats.dts             | 29 +++++++--------
 arch/arm/boot/dts/exynos4210-universal_c210.dts    | 42 +++++++++++-----------
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    | 15 ++++----
 arch/arm/boot/dts/exynos4412-odroidu3.dts          |  2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts           |  8 ++---
 arch/arm/boot/dts/exynos4412-origen.dts            | 15 ++++----
 arch/arm/boot/dts/exynos4412-tiny4412.dts          |  9 ++---
 arch/arm/boot/dts/exynos4412-trats2.dts            | 34 +++++++++---------
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |  3 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |  8 ++---
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |  7 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  4 +--
 arch/arm/boot/dts/exynos5440-ssdk5440.dts          |  5 +--
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |  8 ++---
 18 files changed, 118 insertions(+), 107 deletions(-)

-- 
2.4.3
