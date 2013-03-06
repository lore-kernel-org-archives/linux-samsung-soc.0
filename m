From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] ARM: dts: Add default pin states for client nodes on
 Exynos4/5 platforms
Date: Wed, 06 Mar 2013 18:06:36 +0530
Message-ID: <1362573398-15126-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29754 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736Ab3CFMPp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 07:15:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJ8002N2NE65610@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Mar 2013 21:15:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, heiko@sntech.de, linus.walleij@linaro.org, patches@linaro.org

This patch series populates the default pin states in client nodes
of Exynos4 and Exynos5 platforms. Exynos4/5 platforms are migrating
to use pinctrl framework and having the default pin states listed
in the client nodes allows the device core to setup the default
pin configuration for all the controllers.

This means the old-styled Samsung specific gpio bindings, which have
been used till now for setting up the pin configurations, will not be
used anymore. The corresponding changes required in device drivers
have been posted seperatly.

Thomas Abraham (2):
  ARM: dts: add pin state information in client nodes for Exynos4 platforms
  ARM: dts: add pin state information in client nodes for Exynos5 platforms

 arch/arm/boot/dts/cros5250-common.dtsi    |   51 +--
 arch/arm/boot/dts/exynos4.dtsi            |   10 +
 arch/arm/boot/dts/exynos4210-smdkv310.dts |   53 +--
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi |  783 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts |   33 +-
 arch/arm/boot/dts/exynos5250-snow.dts     |   22 +-
 arch/arm/boot/dts/exynos5250.dtsi         |  310 +++---------
 7 files changed, 923 insertions(+), 339 deletions(-)
 create mode 100755 arch/arm/boot/dts/exynos5250-pinctrl.dtsi
