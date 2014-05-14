From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 0/5] ARM: dts: enable hdmi for exynos5 based peach and snow
 boards
Date: Wed, 14 May 2014 08:15:57 +0530
Message-ID: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61392 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbaENCqw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 22:46:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable hdmi for exynos5250 based snow board, exynos5420
based peach pit board and 5800 based peach-pi board.
V4:
1) Removed hdmi_hpd_irq pin from peach-pi board as it already
present in exynos5420-pinctrl.dtsi.

V3:
1) Re-spin on dependent patches.
2) Added patch to enable hdmi for Peach-pi board.

V2:
1) Re-spin on dependent patches.
2) Added patch to remove chip specific hdmi hpd gpio from
board file top SoC file.

This series is based on Kukjin Kims, for-next branch.

It is dependent on

1) Sachin's patch: "ARM: dts: exynos5250-snow: add tps65090 power regulator"
at https://patches.linaro.org/28325/ : [Reviewed-by: Doug Anderson]

All other dependent patches are already landed in maintainers
tree.



Rahul Sharma (5):
  ARM: dts: enable hdmi for exynos5250 based snow board
  ARM: dts: change to correct compatible string for exynos5420 hdmi
  ARM: dts: enable hdmi for exynos5420 based peach-pit board
  ARM: dts: remove chip specific hdmi hpd pin from board
  ARM: dts: enable hdmi for exynos5800 based peach-pi board

 arch/arm/boot/dts/exynos5250-cros-common.dtsi |    6 +++++-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi     |    7 +++++++
 arch/arm/boot/dts/exynos5250-snow.dts         |    7 +++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |   19 +++++++++++++++++++
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi     |    7 +++++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |    9 ---------
 arch/arm/boot/dts/exynos5420.dtsi             |    7 ++++++-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |   19 +++++++++++++++++++
 8 files changed, 70 insertions(+), 11 deletions(-)

-- 
1.7.9.5
