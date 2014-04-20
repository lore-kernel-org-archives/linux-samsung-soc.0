From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 0/3] drm/exynos: enable support for exynos5420 hdmi
Date: Sun, 20 Apr 2014 15:53:45 +0530
Message-ID: <1397989425-29641-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26672 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754905AbaDTKYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:24:39 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B0050ZRL2GZ40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:24:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

V2:
1) Rebased on Tomasz Stanislawski's Simple phy driver patches
at https://lkml.org/lkml/2014/4/8/226.

Adds apb mapped phy support for exynos5420 hdmi. Replace
dummy hdmiphy clock with regmap calls.

Based on Inki Dae's exynos-drm-next branch.

Rahul Sharma (3):
  drm/exynos: remove unnecessary read for phy configuration values
  drm/exynos: add support for apb mapped phys in hdmi driver
  drm/exynos: enable support for exynos5420 hdmi device

 .../devicetree/bindings/video/exynos_hdmi.txt      |    1 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  317 ++++++++++++++++----
 drivers/gpu/drm/exynos/regs-hdmi.h                 |    7 +
 3 files changed, 262 insertions(+), 63 deletions(-)

-- 
1.7.9.5
