From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/3] ARM: dts: Mark SDIO as non-removable for Exynos Chromebooks
Date: Thu, 15 Oct 2015 12:55:27 +0200
Message-ID: <1444906530-25048-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:57584 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752162AbbJOK6v (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2015 06:58:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Douglas Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

Hello,

The Exynos based Chromebooks have a Marvell WiFi SDIO chip which is always
present and cannot be detected. The mmc device node is marked as broken-cd
since that property is used in the vendor tree instead of non-removable.

This causes the device to be removed when the system enteres into a suspend
gettings the following warning when the system is resumed:

[  181.944636] mmc2: error -2 during resume (card was removed?)

The rationale for that is explained in commit [0] and it was that using the
non-removable property caused issues with the driver whose reset logic used
the mmc_{remove,add}_host() functions.

But the reset logic in the mwifiex mainline driver has changed and this is
longer the case so it's safe to use non-removable. This series changes the
Snow, Peach Pi and Peach Pit boards to use the correct DT property.

To test, I've cherry picked commit [1] from the vendor tree that adds a
debugfs entry to force a card reset and after the reset, WiFi rescanning works
the card gets connected to an AP and works correctly:

$ echo 1 > /sys/kernel/debug/mwifiex/mlan0/reset

I don't have access to a Snow anymore so testing patch 3/3 on that board will
be appreciated.

[0]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/ad348e1e2381
[1]: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/5995363523de

Best regards,
Javier


Javier Martinez Canillas (3):
  ARM: dts: Mark SDIO as non-removable in exynos5800-peach-pi
  ARM: dts: Mark SDIO as non-removable in exynos5420-peach-pit
  ARM: dts: Mark SDIO as non-removable in exynos5250-snow-common

 arch/arm/boot/dts/exynos5250-snow-common.dtsi | 2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts    | 2 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.4.3
