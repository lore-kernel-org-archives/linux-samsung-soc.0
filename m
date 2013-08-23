From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 0/7] ARM: dts: add support for exynos hdmi subsystem
Date: Fri, 23 Aug 2013 15:54:14 +0530
Message-ID: <1377253461-20851-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30517 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753600Ab3HWKCX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Aug 2013 06:02:23 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, s.nawrocki@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

It adds Device tree nodes and clocks information for HDMI subsystem
for exynos5420 and exynos5250 SoCs. It adds pinctrl node for hdmi
hpd gpio and update binding documents.

This set is based on kukjin's for-next branch at
http://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git.

v4:
1) Remove the movement of common properties to Exynos5.dtsi for
I2C and hdmi subsystem.
2) Change the title of the patches.

v3:
1) Rebase to kgene for-next based on 3.11-rc1.
2) Changes clock numbers as per updated clocks file for
exyno5250 and exynos5420.
3) Dropped Sachin patch as already got merged.

v2:
1) Added patch for moving common i2c properties to exynos5.dtsi
2) Added patch for moving common hdmi, mixer properties to exynos5.dtsi
3) moved hpd pinctrl node to board file.
4) Added Sachin's patch to update binding document for hdmi with hpd
information.

Andrew Bresticker (1):
  ARM: dts: add i2c device nodes for Exynos5420

Rahul Sharma (5):
  ARM: dts: add clocks to hdmi dt node for exynos5250
  ARM: dts: add dt nodes for hdmi subsystem for exynos5420
  ARM: dts: add clocks for hdmi subsystem for exynos5420
  ARM: dts: add hdmi hpd gpio pinctrl node for exynos5420
  of/documentation: update with clock information for exynos hdmi
    subsystem

Sean Paul (1):
  ARM: dts: add mixer clocks to mixer node for Exynos5250

 .../devicetree/bindings/video/exynos_hdmi.txt      |   14 +++-
 .../devicetree/bindings/video/exynos_mixer.txt     |    4 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |    8 ++-
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   30 ++++++++
 arch/arm/boot/dts/exynos5420.dtsi                  |   76 ++++++++++++++++++++
 5 files changed, 128 insertions(+), 4 deletions(-)

-- 
1.7.10.4
