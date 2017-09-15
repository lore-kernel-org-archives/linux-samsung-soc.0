From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/5] Exynos HDMI bindings cleanup
Date: Fri, 15 Sep 2017 11:11:18 +0200
Message-ID: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170915091138eucas1p2068550e7fa64e2449d7094179c7cd3b6@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33473 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdIOJLm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 05:11:42 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi!

This patchset performs a cleanup of HDMI (and related) device tree
nodes for various Exynos boards. There are no functional changes.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Marek Szyprowski (5):
  bindings: mark separate Exynos HDMI DDC node as deprecated
  ARM: dts: exynos: Move HDMI PHY node to exynos5250.dtsi
  ARM: dts: exynos: Cleanup HDMI DCC definitions
  ARM: dts: exynos: Add status property to Exynos 5250 HDMI and Mixer
    nodes
  ARM: dts: exynos: Add status property to Exynos 54xx Mixer nodes

 .../bindings/display/exynos/exynos_hdmiddc.txt     |  5 ++++-
 arch/arm/boot/dts/exynos5250-arndale.dts           | 22 ++++++++--------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts          | 18 ++++++++----------
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 18 +++++++-----------
 arch/arm/boot/dts/exynos5250-spring.dts            | 18 +++++++-----------
 arch/arm/boot/dts/exynos5250.dtsi                  | 10 +++++++++-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |  4 ++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |  4 ++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |  9 +++++----
 arch/arm/boot/dts/exynos5420.dtsi                  |  1 +
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  9 +++++----
 11 files changed, 62 insertions(+), 56 deletions(-)

-- 
1.9.1
