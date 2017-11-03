From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 0/2] ARM: dts: exynos: Updates for Odroid HDMI audio
Date: Fri, 03 Nov 2017 17:43:12 +0100
Message-ID: <20171103164314.14919-1-s.nawrocki@samsung.com>
References: <CGME20171103164358epcas2p1556289ae7a9f2e29da932fc24651d592@epcas2p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63786 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752425AbdKCQoB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Nov 2017 12:44:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, mihailescu2m@gmail.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

These patches are intended for v4.16-rc1 as they depend on the
HDMI codec patch which is going to be merged in coming merge
window.

Sylwester Nawrocki (2):
  ARM: dts: exynos: Switch to dedicated Odroid-XU3 sound card binding
  ARM: dts: exynos: Add sound support for Odroid XU4

 arch/arm/boot/dts/exynos4.dtsi                    |  1 +
 arch/arm/boot/dts/exynos5420.dtsi                 |  1 +
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi | 64 ++++++++++++++--------
 arch/arm/boot/dts/exynos5422-odroidxu4-audio.dtsi | 67 +++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroidxu4.dts        |  1 +
 5 files changed, 111 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos5422-odroidxu4-audio.dtsi

--
2.14.2
