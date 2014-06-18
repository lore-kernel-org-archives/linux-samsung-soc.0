From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] drm/exynos: fix for misc issues related to exynos mixer
Date: Wed, 18 Jun 2014 17:04:48 +0530
Message-ID: <1403091293-15058-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49042 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933986AbaFRLgr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 07:36:47 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7D0051W498QJ60@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Jun 2014 20:36:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Fixes for various issues which are to Power On/Off sequence,
Layer update, waiting for vblank in exynos mixer driver.

This series is based on exynos-drm-fixes branch in Inki dae's tree.

Rahul Sharma (5):
  drm/exynos: set power state variable after enabling clocks and power
  drm/exynos: stop mixer before gating clocks during poweroff
  drm/exynos: allow mulitple layer updates per vsync for mixer
  drm/exynos: soft reset mixer before reconfigure after power-on
  drm/exynos: enable vsync interrupt while waiting for vblank

 drivers/gpu/drm/exynos/exynos_mixer.c |   50 +++++++++++++++++++++++----------
 drivers/gpu/drm/exynos/regs-mixer.h   |    1 +
 2 files changed, 36 insertions(+), 15 deletions(-)

-- 
1.7.9.5
