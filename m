From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH 0/3] Add soc nodes to exynos4 series DTS
Date: Mon, 05 Feb 2018 12:25:33 +0100
Message-ID: <1517829936-26311-1-git-send-email-m.purski@samsung.com>
References: <CGME20180205112602eucas1p26be8f7ca95f7e14d5d62940cf29de7b4@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41662 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752253AbeBEL0G (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 06:26:06 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, Maciej Purski <m.purski@samsung.com>

Hi all,

this patchset adds soc node to exynos4, exynos4210 and exynos4412
DTS. The main goal for these changes is unification of all exynos
DTS. Soc nodes are already present in for example exynos5 series.

Best regards,

Maciej Purski

Maciej Purski (3):
  ARM: dts: exynos: Add soc node to exynos4
  ARM: dts: exynos: Add soc node to exynos4210
  ARM: dts: exynos: Add soc node to exynos4412

 arch/arm/boot/dts/exynos4.dtsi    | 1727 +++++++++++++++++++------------------
 arch/arm/boot/dts/exynos4210.dtsi |  513 +++++------
 arch/arm/boot/dts/exynos4412.dtsi |  954 ++++++++++----------
 3 files changed, 1609 insertions(+), 1585 deletions(-)

-- 
2.7.4
