From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/2] drm/exynos: clean up bridge binding
Date: Mon, 03 Jul 2017 16:27:57 +0900
Message-ID: <1499066879-13241-1-git-send-email-inki.dae@samsung.com>
References: <CGME20170703072800epcas1p3247364bee692c338920c73bb856e8fad@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:37101 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750793AbdGCH2D (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jul 2017 03:28:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch series cleans up bridge binding of DSI and MIC driver.

It doesn't have to call of_drm_find_bridge function every time
bind callback of DSI driver is called so moves this function call
into probe function and for this support it adds a bridge
at probe function of MIC driver instead of adding it at bind callback.

Inki Dae (2):
  drm/exynos: dsi: move of_drm_find_bridge call into probe
  drm/exynos: mic: add a bridge at probe

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 23 ++++++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 17 ++++++++++-------
 2 files changed, 22 insertions(+), 18 deletions(-)

-- 
1.9.1
