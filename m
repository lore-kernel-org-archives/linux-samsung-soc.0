From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RESEND PATCH 0/2] ARM: dts: add display device nodes for Exynos4415
Date: Wed, 17 Dec 2014 09:39:40 +0900
Message-ID: <1418776782-6691-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63393 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750810AbaLQAjr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Dec 2014 19:39:47 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, robh+dt@kernel.org, galak@codeaurora.org, kyungmin.park@samsung.com, inki.dae@samsung.com

This patch series adds display device nodes for Exynos4415 SoC support.
The drm/exynos part of original patchset[1] was merged but DTS part is not yet.

This is based on for-next branch in linux-samsung git.

[1] http://www.spinics.net/lists/linux-samsung-soc/msg38649.html

YoungJun Cho (2):
  ARM: dts: add fimd device node to exynos4415.dtsi
  ARM: dts: add mipi dsi device node to exynos4415.dtsi

 arch/arm/boot/dts/exynos4415.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
1.9.0
