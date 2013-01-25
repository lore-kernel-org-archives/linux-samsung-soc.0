From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 0/2] drm/exynos: add dt support to exynos4 mixer and hdmi
Date: Fri, 25 Jan 2013 05:55:44 -0500
Message-ID: <1359111346-12908-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57071 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753508Ab3AYKeR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 05:34:17 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MH600GZEG0QMXK0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:34:16 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MH600I57G0W88B0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 25 Jan 2013 19:34:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

This patch enables the DT based search to DRM Mixer and HDMI driver for
Samsung Exynos4 family soc.

This set is base on "exynos-drm-fixes" branch at
http://git.kernel.org/?p=linux/kernel/git/daeinki/drm-exynos.git

Rahul Sharma (2):
  drm/exynos: add support for dt based search to exynos4 hdmi
  drm/exynos: add support for dt based search to exynos4 mixer

 drivers/gpu/drm/exynos/exynos_ddc.c     | 2 ++
 drivers/gpu/drm/exynos/exynos_hdmi.c    | 6 ++++++
 drivers/gpu/drm/exynos/exynos_hdmiphy.c | 2 ++
 drivers/gpu/drm/exynos/exynos_mixer.c   | 3 +++
 4 files changed, 13 insertions(+)

-- 
1.8.0
