From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] ARM: dts: exynos5420: add support for hdmi subsystem
Date: Thu, 20 Jun 2013 11:11:46 +0530
Message-ID: <1371706911-27016-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35692 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064Ab3FTFS0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 01:18:26 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00HM8EO0TR80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 14:18:24 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Add dt nodes and clocks for hdmi subsystem. It also add pinctrl
node for hdmi hpd gpio and update binding documents.

This patch is based on v3.11-next/soc-exynos5420-pinctrl branch
at http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git

device tree binding document for hdmi compatible type is update at
http://www.spinics.net/lists/dri-devel/msg39987.html

Andrew Bresticker (1):
  ARM: dts: exynos5420: add i2c device nodes

Rahul Sharma (4):
  ARM: dts: exynos5420: add dt nodes for hdmi subsystem
  ARM: dts: exynos5420: add clocks for hdmi subsystem
  ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
  ARM: dts: update binding documentation for hdmi subsystem

 .../devicetree/bindings/video/exynos_hdmi.txt      |   17 ++++-
 .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi          |    7 ++
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   17 +++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   74 ++++++++++++++++++++
 5 files changed, 116 insertions(+), 3 deletions(-)

-- 
1.7.10.4
