From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 0/8] ARM: dts: exynos5420: add support for hdmi subsystem
Date: Thu, 20 Jun 2013 18:43:46 +0530
Message-ID: <1371734034-21296-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58035 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757657Ab3FTMvf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Jun 2013 08:51:35 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOO00HJIZPYTRU0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Jun 2013 21:51:34 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, l.stach@pengutronix.de, tomasz.figa@gmail.com, rob.herring@calxeda.com, s.nawrocki@samsung.com, grant.likely@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Common properties for I2C and Hdmi Subsystem is moved to exynos5
dtsi file. It also adds Device tree nodes and clocks information
for exynos5420 SoC. It adds pinctrl node for hdmi hpd gpio and
update binding documents.

This patch is based on v3.11-next/soc-exynos5420-pinctrl branch
at http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git

device tree binding document for hdmi compatible type is update at
http://www.spinics.net/lists/dri-devel/msg39987.html

v2:
1) Added patch for moving common i2c properties to exynos5.dtsi
2) Added patch for moving common hdmi, mixer properties to exynos5.dtsi
3) moved hpd pinctrl node to board file.
4) Added Sachin's patch to update binding document for hdmi with hpd
information.

Andrew Bresticker (1):
  ARM: dts: exynos5420: add i2c device nodes

Rahul Sharma (6):
  ARM: dts: exynos5250: move common i2c properties to exynos5 dtsi
  ARM: dts: exynos5250: move common hdmi properties to exynos5 dtsi
  ARM: dts: exynos5420: add dt nodes for hdmi subsystem
  ARM: dts: exynos5420: add clocks for hdmi subsystem
  ARM: dts: exynos5420: add hdmi hpd gpio pinctrl node
  of/documentation: update with clock information for exynos hdmi
    subsystem

Sachin Kamat (1):
  of/documentation: Update hpd gpio property for exynos_hdmi

 .../devicetree/bindings/video/exynos_hdmi.txt      |   20 ++++++--
 .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
 arch/arm/boot/dts/cros5250-common.dtsi             |    2 +-
 arch/arm/boot/dts/exynos5.dtsi                     |   48 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts           |    8 +++-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   10 +++-
 arch/arm/boot/dts/exynos5250-snow.dts              |    8 ++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   28 +-----------
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   31 +++++++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   46 +++++++++++++++++++
 10 files changed, 171 insertions(+), 34 deletions(-)

-- 
1.7.10.4
