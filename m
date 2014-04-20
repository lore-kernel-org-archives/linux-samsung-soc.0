From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 0/3] drm/exynos: enable support for exynos5420 hdmi
Date: Sun, 20 Apr 2014 15:51:14 +0530
Message-ID: <1397989277-29602-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:17829 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755293AbaDTKWH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Apr 2014 06:22:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4B00ANKRGOUT30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 20 Apr 2014 19:22:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

V2:
1) Rebased on Tomasz Stanislawski at https://lkml.org/lkml/2014/4/8/226.

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
