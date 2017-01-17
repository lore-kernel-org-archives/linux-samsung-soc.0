From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 0/2] Add USB DRD 3.0 device node for Exynos7
Date: Tue, 17 Jan 2017 16:02:21 +0530
Message-ID: <1484649143-19423-1-git-send-email-pankaj.dubey@samsung.com>
References: <CGME20170117102937epcas5p1f49119a781097709b6bd6d29730c0c0f@epcas5p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56896 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbdAQK3t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 05:29:49 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, robh+dt@kernel.org, sanath@samsung.com, javier@osg.samsung.com, gautamvivek1987@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This patch series adds USB 3.0 DRD device node for Exynos7 and 
required Vbus and Vbus-boost support for espresso dev boards.
These patches are part of patch series [1] earlier submitted by Vivek

[1]: https://lkml.org/lkml/2014/11/21/247

While other patches in these series got merged, DTS related change were
left. I have prepared and tested these patches on top of krzk/for-next.


Pankaj Dubey (2):
  arm64: dts: exynos: Add USB 3.0 controller node for Exynos7
  arm64: dts: exynos: Add regulators for Vbus and Vbus-Boost

 arch/arm64/boot/dts/exynos/exynos7-espresso.dts | 44 +++++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi         | 34 +++++++++++++++++++
 2 files changed, 78 insertions(+)

-- 
2.7.4
