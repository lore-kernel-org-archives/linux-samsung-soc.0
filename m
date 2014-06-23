From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5 v2] drm/exynos: fix for misc issues related to exynos mixer
Date: Mon, 23 Jun 2014 11:02:20 +0530
Message-ID: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42819 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751122AbaFWFdZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 01:33:25 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7L00KJSWRNDZD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jun 2014 14:33:23 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Fixes for various issues which are to Power On/Off sequence,
Layer update, waiting for vblank in exynos mixer driver.

v2: 1) Repalce mixer_enable_vblank with drm_vblank_get.

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
