From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/7] Exynos DRM: use of_device_get_match_data helper
Date: Fri, 01 Apr 2016 15:17:39 +0200
Message-ID: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14541 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbcDANSM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:12 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y00B5TIA9KQ10@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:09 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello,

This patch series simplifies the code by replacing custom code with
generic helper.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (7):
  drm/exynos: exynos5433_decon: use generic of_device_get_match_data
    helper
  drm/exynos: dsi: use generic of_device_get_match_data helper
  drm/exynos: fimd: use generic of_device_get_match_data helper
  drm/exynos: rotator: use generic of_device_get_match_data helper
  drm/exynos: hdmi: use generic of_device_get_match_data helper
  drm/exynos: mixer: remove support for non-dt platforms
  drm/exynos: mixer: use generic of_device_get_match_data helper

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 11 +----------
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 11 +----------
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 11 +++--------
 drivers/gpu/drm/exynos/exynos_hdmi.c          |  7 +------
 drivers/gpu/drm/exynos/exynos_mixer.c         | 26 +++-----------------------
 6 files changed, 10 insertions(+), 61 deletions(-)

-- 
1.9.2
