From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 0/4] ARM: dts: exynos: Enable HDMI in Arndale Octa board
Date: Tue, 23 Aug 2016 18:13:35 +0900
Message-ID: <1471943619-6102-1-git-send-email-woogyom.kim@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f68.google.com ([209.85.220.68]:34541 "EHLO
        mail-pa0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751602AbcHWJOT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 05:14:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Milo Kim <woogyom.kim@gmail.com>

This patch-set enables HDMI in Arndale Octa board and fixes HPD DT property.
It also includes code refactoring on ddc and phy.

Milo Kim (4):
  ARM: dts: exynos: Enable HDMI for Arndale Octa board
  ARM: dts: exynos: Use 'hpd-gpios' instead of 'hpd-gpio'
  gpu: drm: exynos_hdmi: Use consolidated function on binding DDC DT
    property
  gpu: drm: exynos_hdmi: Use consolidated function on binding PHY DT
    property

 .../bindings/display/exynos/exynos_hdmi.txt        |  4 +--
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |  2 +-
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |  2 +-
 arch/arm/boot/dts/exynos5250-arndale.dts           |  2 +-
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |  2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |  2 +-
 arch/arm/boot/dts/exynos5250-spring.dts            |  2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 17 +++++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |  2 +-
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |  2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  2 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |  2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c               | 41 ++++++++++++----------
 13 files changed, 52 insertions(+), 30 deletions(-)

-- 
1.9.1
