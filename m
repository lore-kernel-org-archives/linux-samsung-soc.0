From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 0/9] Exynos 4210, 4412 DTS cleanup
Date: Mon, 05 Feb 2018 08:56:59 +0100
Message-ID: <1517817428-7898-1-git-send-email-m.purski@samsung.com>
References: <CGME20180205075723eucas1p1e14d59501a636903262aee195348d53c@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56104 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbeBEH52 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 02:57:28 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Hi all,

this patchset performs cleanup of exynos4 series DTS. The main goal
is to prepare them to add "soc" node just like it is done in other
exynos DTS. Basically those patches use labels wherever possible
instead of redefining nodes, which have been defined in
exynos4.dtsi, exynos4210.dtsi or exynos4412.dtsi.

Best Regards,

Maciej Purski

---

Changes in v2:
- squashed patch #3 and #4
- move interrupts, reg and status properties to exynos4.dtsi
- put nodes in alphabetical order in exynos4412-odroid common
  and exynos4210-universal_c210

Maciej Purski (9):
  ARM: dts: exynos: Use pinctrl labels in exynos4210-pinctrl
  ARM: dts: exynos: Use pinctrl labels in exynos4412-pinctrl
  ARM: dts: exynos:  Use labels instead of full names in exynos4210
  ARM: dts: exynos: Use fimc labels in exynos4210-trats
  ARM: dts: exynos: Use labels instead of full names in
    exynos4210-universal_c210
  ARM: dts: exynos: Use camera label in exynos4412
  ARM: dts: exynos: Use camera label in exynos4412-odroid-common
  ARM: dts: exynos: Use labels instead of full names in
    exynos4412-trats2
  ARM: dts: exynos: Use camera label in exynos4412-itop-elite

 arch/arm/boot/dts/exynos4.dtsi                  |    6 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi       | 1680 ++++++++++----------
 arch/arm/boot/dts/exynos4210-trats.dts          |   73 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts |  115 +-
 arch/arm/boot/dts/exynos4210.dtsi               |  101 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts     |   16 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi |   12 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi       | 1914 +++++++++++------------
 arch/arm/boot/dts/exynos4412-trats2.dts         |   73 +-
 arch/arm/boot/dts/exynos4412.dtsi               |  237 +--
 10 files changed, 2114 insertions(+), 2113 deletions(-)

-- 
2.7.4
