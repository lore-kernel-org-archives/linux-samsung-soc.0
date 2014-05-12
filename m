From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 0/5] ARM: dts: enable hdmi for exynos5 based peach and snow
 boards
Date: Mon, 12 May 2014 15:54:03 +0530
Message-ID: <1399890248-27409-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36392 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753993AbaELKYu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 May 2014 06:24:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable hdmi for exynos5250 based snow board and exynos5420
based peach pit board. It also adds properties to hdmi nodes
for accessing hdmiphy as simple phys.

V3:
1) Re-spin on dependent patches.
2) Added patch to enable hdmi for Peach-pi board.

V2:
1) Re-spin on dependent patches.
2) Added patch to remove chip specific hdmi hpd gpio from
board file top SoC file.

This series is based on Kukjin Kims, for-next branch.

It is dependent on
1) Arun's patch for adding peach-pit board dts file at
http://www.spinics.net/lists/linux-samsung-soc/msg30103.html. [Patch is 'ACK'ed.]
2) Sachin's patch for snow board dts file at
https://patches.linaro.org/28325/
3) DRM Hdmi driver patch which is changing the DT binding at
http://www.spinics.net/lists/linux-samsung-soc/msg28052.html
4) Arun's patches for basic Exynos5800 support, available at
http://comments.gmane.org/gmane.linux.kernel.samsung-soc/30667
[Already Applied in Kukjin's v3.16-next/soc-exynos]

Rahul Sharma (5):
  ARM: dts: enable hdmi for exynos5250 based snow board
  ARM: dts: change to correct compatible string for exynos5420 hdmi
  ARM: dts: enable hdmi for exynos5420 based peach-pit board
  ARM: dts: remove chip specific hdmi hpd pin from board
  ARM: dts: enable hdmi for exynos5800 based peach-pi board

 arch/arm/boot/dts/exynos5250-cros-common.dtsi |    6 +++++-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi     |    7 +++++++
 arch/arm/boot/dts/exynos5250-snow.dts         |    7 +++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |   19 ++++++++++++++++++
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi     |    7 +++++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |    9 ---------
 arch/arm/boot/dts/exynos5420.dtsi             |    7 ++++++-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |   26 +++++++++++++++++++++++++
 8 files changed, 77 insertions(+), 11 deletions(-)

-- 
1.7.9.5
