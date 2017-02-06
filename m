From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH 0/5] Fix the parse_dt of exynos dsi
Date: Mon, 06 Feb 2017 11:19:39 +0900
Message-ID: <1486347584-6762-1-git-send-email-hoegeun.kwon@samsung.com>
References: <CGME20170206021950epcas1p3b03ac70f840e5df8a991a24a2249d1cb@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56174 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752506AbdBFCTx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Feb 2017 21:19:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, robh+dt@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>

This patch fixed the parse_dt function of exynos dsi and fixed the
related exynos3250, exynos4210, exynos4412, exynos5433 dts.

Hoegeun Kwon (5):
  drm/exynos: dsi: Fix the parse_dt function
  arm64: dts: exynos: Move the clock-frequency property
  arm: dts: Move the clock-frequency property for exynos3250 dts
  arm: dts: Move the clock-frequency property for exynos4412 dts
  arm: dts: Move the clock-frequency property for exynos4210 dts

 arch/arm/boot/dts/exynos3250-rinato.dts            | 23 ++--------------
 arch/arm/boot/dts/exynos4210-trats.dts             | 23 ++--------------
 arch/arm/boot/dts/exynos4412-trats2.dts            | 23 ++--------------
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 16 ++---------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 32 ++++++----------------
 5 files changed, 16 insertions(+), 101 deletions(-)

-- 
1.9.1
