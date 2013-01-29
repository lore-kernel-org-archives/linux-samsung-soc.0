From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 0/1] Adds display-timing node parsing to exynos drm fimd
Date: Tue, 29 Jan 2013 03:12:25 -0500
Message-ID: <1359447146-23359-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19829 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753045Ab3A2HvI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 02:51:08 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHD00B6PN3DYMT0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 16:51:07 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHD00DY4N4VWE70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 16:51:06 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, vikas.sajjan@linaro.org, linux-samsung-soc@vger.kernel.org, s.trumtrar@pengutronix.de

This patch adds display-timing node parsing to drm fimd, this depends on
the display helper patchset at
http://lists.freedesktop.org/archives/dri-devel/2013-January/033998.html

Patch is based on branch "exynos-drm-next" at
http://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/

It is tested on Exynos5250 and Exynos4412 board by applying dependent patches available at
http://lists.freedesktop.org/archives/dri-devel/2013-January/033998.html

Leela Krishna Amudala (1):
  video: drm: exynos: Adds display-timing node parsing using video
    helper function

 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

-- 
1.8.0
