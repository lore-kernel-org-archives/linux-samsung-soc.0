From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 0/2] Add USB DRD 3.0 device node for Exynos7
Date: Tue, 17 Jan 2017 20:34:02 +0530
Message-ID: <1484665444-23365-1-git-send-email-pankaj.dubey@samsung.com>
References: <CGME20170117150119epcas1p30b5cfc4e4be8f0dc300fa587e6cac7f1@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47321 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdAQPBd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 10:01:33 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series adds USB 3.0 DRD device node for Exynos7 and 
required Vbus and Vbus-boost support for espresso dev boards.
These patches are part of patch series [1] earlier submitted by Vivek

[1]: https://lkml.org/lkml/2014/11/21/247

While other patches in these series got merged, DTS related change were
left. I have prepared and tested these patches on top of krzk/for-next.

Changes since v1:
 - Updated S-o-B order and Authorship of patches.
 - Added Javier's Reviewed-by.
 - Replaced GPIO polarity values with appropriate macros.

Vivek Gautam (2):
  arm64: dts: exynos: Add USB 3.0 controller node for Exynos7
  arm64: dts: exynos: Add regulators for Vbus and Vbus-Boost

 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 45 +++++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         | 34 +++++++++++++++++++
 2 files changed, 79 insertions(+)

-- 
2.7.4
