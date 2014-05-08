From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 0/5] ARM: dts: enable display for peach-pit and snow boards
Date: Thu, 08 May 2014 11:49:50 +0530
Message-ID: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23770 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaEHGUx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 02:20:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Add nodes for fimd and dp controller for exynos5250 based snow
and exynos5420 based peach-pit board.

This series is based on Kukjin Kims, for-next branch.

V2:
1) Rebase on Peach-pit dependent patches.

It is dependent on
1) Andrew Bresticker's patch for hpd gpio addition, avilable at
http://www.spinics.net/lists/linux-samsung-soc/msg28827.html [Patch is 'ACK'ed.]
2) Arun's patch for adding peach-pit board dts file at
http://www.spinics.net/lists/linux-samsung-soc/msg30103.html. [Patch is 'ACK'ed.]

Rahul Sharma (5):
  ARM: dts: move dp hpd line to the board file for exynos5420
  ARM: dts: enable fimd for exynos5250 based snow board
  ARM: dts: enable dp-controller for exynos5250 based snow board
  ARM: dts: enable fimd for exynos5420 based peach-pit board
  ARM: dts: enable dp-controller for exynos5420 based peach-pit board

 arch/arm/boot/dts/exynos5250-snow.dts      |   33 +++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts |   39 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi  |    7 -----
 arch/arm/boot/dts/exynos5420-smdk5420.dts  |    7 +++++
 4 files changed, 79 insertions(+), 7 deletions(-)

-- 
1.7.9.5
