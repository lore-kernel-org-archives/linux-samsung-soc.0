From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 0/2] drm/exynos: fix null pointer dereferenece issue
Date: Thu, 13 Nov 2014 16:50:07 +0900
Message-ID: <1415865009-15979-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56519 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753762AbaKMHuO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 02:50:14 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEY009BBWFO9B60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 16:50:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com, Inki Dae <inki.dae@samsung.com>

This patch set fixes null pointer dereference issue incurred when
Exynos drm driver is closed. And it rebases a existing cleanup patch
posted by Andrzej on top of exynos-drm-fixes after the infinite loop
and null pointer dereference issues are resolved.

Andrzej Hajda (1):
  drm/exynos: remove ifdeferry from initialization code

Inki Dae (1):
  drm/exynos: fix null pointer dereference issue

 drivers/gpu/drm/exynos/exynos_drm_drv.c |  214 ++++++++++---------------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h |   25 ++--
 2 files changed, 81 insertions(+), 158 deletions(-)

-- 
1.7.9.5
