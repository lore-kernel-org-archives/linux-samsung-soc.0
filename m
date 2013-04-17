From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/3] drm/exynos: Add device tree support for IPP driver
Date: Wed, 17 Apr 2013 11:53:01 +0200
Message-ID: <1366192384-18829-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58144 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965826Ab3DQJxk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Apr 2013 05:53:40 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLE00LZJ8T57UH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Apr 2013 18:53:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Inki,

This small patch series adds device tree support for the DRM FIMC driver.
The binding documentation can be found in -next at Documentation/devicetree/
bindings/media/samsung-fimc.txt.
It will make the driver dependent on OF. This patch series is needed in
3.10 to ensure simultaneous operation of the DRM FIMC and the camera ISP
on Exynos4x12.

Changes since v1:
 - removed devm_kfree() that got erroneously re-added in patch 2/3 during
   rebase.

Thanks,
Sylwester

Sylwester Nawrocki (3):
  drm/exynos: Remove redundant devm_kfree()
  drm/exynos: Rework fimc clocks handling
  drm/exynos: Add device tree support for fimc ipp driver

 drivers/gpu/drm/exynos/Kconfig           |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |  264 ++++++++++++++++--------------
 drivers/gpu/drm/exynos/regs-fimc.h       |    7 +-
 3 files changed, 147 insertions(+), 126 deletions(-)

--
1.7.9.5
