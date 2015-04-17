From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCHv2 00/11] ARM: dts: exynos4: labels for overriding nodes
Date: Fri, 17 Apr 2015 22:21:01 +0900
Message-ID: <1429276870-19506-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:36278 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441AbbDQNVn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Apr 2015 09:21:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>


Hi,

Changes since v1
================
1. Re-phrased the description (phandle->label). Suggested by Arnd.

Description
===========

The label-based notation reduces possible mistakes when overriding
nodes by child DTSI and board files and reduces duplication
of addresses.

The patchset refactors Exynos4 boards to use labels for overriding nodes.

Tested by comparison of decompiled DTB for each commit.

Best regards,
Krzysztof


Krzysztof Kozlowski (11):
  ARM: dts: Add labels to Exynos4 nodes
  ARM: dts: exynos4: Use labels for overriding nodes in Exynos4210
  ARM: dts: exynos4: Use labels for overriding nodes in Exynos4210
    Origen
  ARM: dts: exynos4: Use labels for overriding nodes in SMDKv310
  ARM: dts: exynos4: Use labels for overriding nodes in Trats
  ARM: dts: exynos4: Use labels for overriding nodes in Exynos4212
  ARM: dts: exynos4: Use labels for overriding nodes in Exynos4x12
  ARM: dts: exynos4: Use labels for overriding nodes in Exynos4412
  ARM: dts: exynos4: Use labels for overriding nodes in Odroid
  ARM: dts: exynos4: Use labels for overriding nodes in SMDK4412
  ARM: dts: exynos4: Use labels for overriding nodes in Trats2

 arch/arm/boot/dts/exynos4.dtsi                  |   22 +-
 arch/arm/boot/dts/exynos4210-origen.dts         |  418 +++----
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi       |    6 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts       |  280 ++---
 arch/arm/boot/dts/exynos4210-trats.dts          |  592 +++++-----
 arch/arm/boot/dts/exynos4210.dtsi               |   49 +-
 arch/arm/boot/dts/exynos4212.dtsi               |   12 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |  728 ++++++-------
 arch/arm/boot/dts/exynos4412-odroidx.dts        |   16 +-
 arch/arm/boot/dts/exynos4412-smdk4412.dts       |  210 ++--
 arch/arm/boot/dts/exynos4412-trats2.dts         | 1331 ++++++++++++-----------
 arch/arm/boot/dts/exynos4412.dtsi               |   20 +-
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi       |    8 +-
 arch/arm/boot/dts/exynos4x12.dtsi               |  212 ++--
 14 files changed, 1952 insertions(+), 1952 deletions(-)

-- 
2.1.0
