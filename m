From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH v4 0/8] ARM: dts: exynos5: labels for overriding nodes
Date: Sun, 17 May 2015 17:26:07 +0900
Message-ID: <1431851175-32624-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:34288 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207AbbEQI01 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 May 2015 04:26:27 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

Hi,


Changes since v3
================
1. Rebased on current Kukjin's for-next branch:
   v4.1-rc3-34-gfcfae6b049cf

Changes since v2
================
1. New patch 8/8: ARM: dts: Use labels for overriding nodes
   in exynos5422-odroidxu3
2. To avoid conflicts rebased on my "for-next" branch of
   https://github.com/krzk/linux
   The branch above contains some patches for Exynos5 boards
   applied from LKML.

Changes since v1
================
1. Re-phrased the description (phandle->label). Suggested by Arnd.


Description
===========
The label-based notation reduces possible mistakes when overriding
nodes by child DTSI and board files and reduces duplication
of addresses.

The patchset refactors Exynos5 boards to use labels for overriding nodes.

Tested by comparison of decompiled DTB for each commit.


Best regards,
Krzysztof


Krzysztof Kozlowski (8):
  ARM: dts: Add labels to exynos5 nodes
  ARM: dts: Use labels for overriding nodes in exynos5250
  ARM: dts: Remove duplicated I2C7 nodes in exynos5250-snow
  ARM: dts: Use labels for overriding nodes in exynos5420-arndale-octa
  ARM: dts: Use labels for overriding nodes in exynos542x
  ARM: dts: Use labels for overriding nodes in exynos5420-smdk5420
  ARM: dts: Use labels for overriding nodes in exynos5440 boards
  ARM: dts: Use labels for overriding nodes in exynos5422-odroidxu3

 arch/arm/boot/dts/exynos5.dtsi                |   6 +-
 arch/arm/boot/dts/exynos5250-snow.dts         |  46 +-
 arch/arm/boot/dts/exynos5250.dtsi             |  82 ++--
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 634 ++++++++++++-------------
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |   2 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts     | 645 +++++++++++++-------------
 arch/arm/boot/dts/exynos5420.dtsi             |  82 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts    | 568 +++++++++++------------
 arch/arm/boot/dts/exynos5440-sd5v1.dts        |  10 +-
 arch/arm/boot/dts/exynos5440-ssdk5440.dts     |  85 ++--
 arch/arm/boot/dts/exynos5440.dtsi             |   4 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |   2 +-
 12 files changed, 1082 insertions(+), 1084 deletions(-)

-- 
2.1.4
