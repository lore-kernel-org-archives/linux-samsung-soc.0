From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/5] drm/exynos: enable support for exynos5420 hdmi
Date: Wed, 02 Apr 2014 22:43:41 +0530
Message-ID: <1396458826-3051-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52939 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932263AbaDBRO0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Apr 2014 13:14:26 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3E00JM3YK0Q6C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Apr 2014 02:14:25 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Adds apb mapped phy support for exynos5420 hdmi. Replace
dummy hdmiphy clock with regmap calls.

Based on Inki Dae's exynos-drm-next branch.

Rahul Sharma (5):
  drm/exynos: remove dummy hdmiphy clock from hdmi driver
  drm/exynos: use regmap interface to set hdmiphy control bit in pmu
  drm/exynos: remove unnecessary read for phy configuration values
  drm/exynos: add support for apb mapped phys in hdmi driver
  drm/exynos: enable support for exynos5420 hdmi device

 .../devicetree/bindings/video/exynos_hdmi.txt      |    3 +
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  342 ++++++++++++++++----
 drivers/gpu/drm/exynos/regs-hdmi.h                 |   11 +
 3 files changed, 285 insertions(+), 71 deletions(-)

-- 
1.7.9.5
