From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/3] drm/exynos: add framework to control DISP1BLK setting
Date: Wed, 25 Jun 2014 19:45:49 +0530
Message-ID: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55197 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756775AbaFYOS1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 10:18:27 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Q008MAAEP0WD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 23:18:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, vikas.sajjan@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

This series is based on exynos-drm-next branch of Inki Dae's tree at:
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git

Exynos SOC have a DISP1BLK register where we can select
the path for FIMD output. We can redirect the video data
directly to DP/MIPI interface, or we can pass it via
image enhancement chips.

Since we don't use any image enhancement chips in exynos-drm,
we need to set FIMD BYPASS in DISP1BLK.

This patchset is tested for basic display + DPMS + S2R on snow and peach_pit.

Ajay Kumar (3):
  [PATCH 1/3] drm/exynos: Control DISP1BLK system register in FIMD
  [PATCH 2/3] ARM: dts: exynos5420: Add sysreg phandle to FIMD node
  [PATCH 3/3] ARM: dts: exynos5250: Add sysreg phandle to FIMD node

 .../devicetree/bindings/video/samsung-fimd.txt     |    2 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |    1 +
 arch/arm/boot/dts/exynos5420.dtsi                  |    1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   19 +++++++++++++++++++
 include/video/samsung_fimd.h                       |    5 +++++
 5 files changed, 28 insertions(+)

-- 
1.7.9.5
