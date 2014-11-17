From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v2 0/9] drm/exynos: modify LCD I80 interface display
Date: Mon, 17 Nov 2014 22:00:07 +0900
Message-ID: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35157 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750944AbaKQNAW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:22 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF6002WCPGKK410@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:20 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

Hi,

This series modifies LCD I80 interface display for Exynos DRM driver
to make it similar with Video(RGB) interface.
Some patches in v1 are applied already and these are modified as Inki's
comments.
And Joonyoung's patches are also included for merge convenience.

This is based on exynos-drm-next branch.

The previous patches,
v1: http://www.spinics.net/lists/dri-devel/msg69159.html

Changelog v2:
- Splits patches into single feature. (commented by Inki)

I welcome any comments.

Thank you.
Best regards YJ

Joonyoung Shim (2):
  drm/exynos: move triggering checking
  drm/exynos: use irq_flags instead of triggering

YoungJun Cho (7):
  drm/exynos: fimd: move shadow unprotection position
  drm/exynos: fimd: add fimd_enable_video_output() to cleanup
  drm/exynos: fimd: add fimd_enable_shadow_channel_path() to cleanup
  drm/exynos: fimd: modify I80 i/f irq relevant routine
  drm/exynos: fimd: add triggering unset routine in fimd_trigger()
  drm/exynos: dsi: move TE irq handler registration position
  drm/exynos: dsi: set TE GPIO IRQ status as IRQ_NOAUTOEN

 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |  19 ++---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 135 ++++++++++++++++++-------------
 2 files changed, 85 insertions(+), 69 deletions(-)

-- 
1.9.0
