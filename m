From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/2] drm/exynos: dp: add of_graph dt binding for panel device
Date: Thu, 26 Nov 2015 21:47:18 +0900
Message-ID: <1448542040-22057-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:59997 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060AbbKZMrX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 07:47:23 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NYF02G6KA6XPTE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Nov 2015 21:47:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, javier@osg.samsung.com, Inki Dae <inki.dae@samsung.com>

This patch series adds of_graph dt binding for panel device
and fixes wrong return type when the dt binding of bridge device failed.

Inki Dae (2):
  drm/exynos: dp: add of_graph dt binding support for panel
  drm/exynos: dp: fix wrong return type

 drivers/gpu/drm/exynos/exynos_dp_core.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

-- 
1.9.1
