From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 0/2] DRM: Add runtime PM to Exynos DSI
Date: Fri, 07 Nov 2014 14:53:57 +0100
Message-ID: <1415368439-23642-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:17574 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbaKGNyP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 08:54:15 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Hilman <khilman@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi,

Changes since v1
================
1. Replace patch 1 changing PM core with fix only for DRM exynos driver.

Description
===========
The goal of the patch 2 is to add runtime PM to the Exynos DSI driver.
This allows LCD power domain to be turned off.

However after adding this patch an interesing issue came in. The DSI
driver could not runtime resume during sustem resume because power
domain was not allowed to power on.

The issue is solved by patch 1.

Tested on Trats2 board.

Comments are welcomed.

Best regards,
Krzysztof


Krzysztof Kozlowski (2):
  drm/exynos: Fix DSI resuming fail because power domain being off
  drm/exynos/dsi: Add runtime PM so LCD power domain could be turned off

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 2 --
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.9.1
