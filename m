From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/7] ARM: dts: enable hdmi for exynos5 based peach and snow
 boards
Date: Sun, 20 Apr 2014 16:53:57 +0530
Message-ID: <1397993044-14564-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38214 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755172AbaDTLYv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 07:24:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable hdmi for exynos5250 based snow board and exynos5420
based peach pit board. It also adds properties to hdmi nodes
for accessing hdmiphy as simple phys.

This series is based on Kukjin Kims, for-next branch.

It is dependent on
1) Tomasz Stanislawski's Simple phy driver patches at
https://lkml.org/lkml/2014/4/8/226.
2) Arun's patch for adding peach-pit board dts file at
http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg28846.html.

Rahul Sharma (7):
  ARM: dtsi: add node for simple phy provider for exynos5250
  ARM: dtsi: add node for simple phy provider for exynos5420
  ARM: dtsi: add access to simple hdmiphy to exynos5250 hdmi node
  ARM: dtsi: add access to simple hdmiphy to exynos5420 hdmi node
  ARM: dts: enable hdmi for exynos5250 based snow board
  ARM: dts: change to correct compatible string for exynos5420 hdmi
  ARM: dts: enable hdmi for exynos5420 based peach-pit board

 arch/arm/boot/dts/exynos5250-cros-common.dtsi |   13 ++++++++++++-
 arch/arm/boot/dts/exynos5250-snow.dts         |    7 +++++++
 arch/arm/boot/dts/exynos5250.dtsi             |    8 ++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |   26 +++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi             |   15 +++++++++++++-
 5 files changed, 67 insertions(+), 2 deletions(-)

-- 
1.7.9.5
