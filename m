From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/4] ARM: dts: Use labels instead of full paths for Exynos5 pinctrl nodes
Date: Tue,  7 Jul 2015 22:36:26 -0700
Message-ID: <1436333790-18219-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56904 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753301AbbGHFho (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jul 2015 01:37:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hello Kukjin and Krzysztof,

This is a trivial series that changes Exynos5 pinctrl dtsi files to extend
the pinctrl nodes using labels instead of full paths.

Using labels is less error prone since a misstyped label leads to a build
error while full paths can lead to the creation of a new node instead of
overriding the original which makes the mistake harder to detect.

I tested the changes by decompiling the Exynos5* dtbs and comparing before
and after. The resulting dts were identical modulo some node ordering due
the pinctrl include change.

The series is composed of the following trivial patches:


Javier Martinez Canillas (4):
  ARM: dts: Include exynos5250-pinctrl after the nodes were defined
  ARM: dts: Extend exynos5250-pinctrl nodes using labels instead of
    paths
  ARM: dts: Include exynos5420-pinctrl after the nodes were defined
  ARM: dts: Extend exynos5420-pinctrl nodes using labels instead of
    paths

 arch/arm/boot/dts/exynos5250-pinctrl.dtsi | 1600 ++++++++++++++---------------
 arch/arm/boot/dts/exynos5250.dtsi         |    3 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi | 1411 +++++++++++++------------
 arch/arm/boot/dts/exynos5420.dtsi         |    3 +-
 4 files changed, 1508 insertions(+), 1509 deletions(-)

-- 
2.4.3
