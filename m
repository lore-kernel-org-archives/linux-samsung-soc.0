From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 0/4] drm/exynos: support Exynos4415 SoC
Date: Fri, 07 Nov 2014 15:12:23 +0900
Message-ID: <1415340747-27904-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19662 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750996AbaKGGMd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 01:12:33 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kyungmin.park@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, cw00.choi@samsung.com, kgene.kim@samsung.com

This patch series adds of_device_id and relevant device nodes
for Exynos4415 SoC support.

This is based on exynos-drm-next branch for drm/exynos,
and is based on for-next branch in linux-samsung git for dts.

I think this requires rebase for the patch "drm/exynos: add has_vtsel flag"[1].

[1] http://www.spinics.net/lists/dri-devel/msg71092.html

YoungJun Cho (4):
  drm/exynos: dsi: support Exynos4415 SoC
  drm/exynos: fimd: support Exynos4415 SoC
  ARM: dts: add fimd device node to exynos4415.dtsi
  ARM: dts: add mipi dsi device node to exynos4415.dtsi

 .../devicetree/bindings/video/exynos_dsim.txt      |  1 +
 .../devicetree/bindings/video/samsung-fimd.txt     |  1 +
 arch/arm/boot/dts/exynos4415.dtsi                  | 27 ++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  7 ++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           | 11 +++++++++
 5 files changed, 47 insertions(+)

-- 
1.9.0
