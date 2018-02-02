From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/2] drm/exynos/mixer: fixes for interlaced mode
Date: Fri, 02 Feb 2018 16:11:21 +0100
Message-ID: <20180202151123.31082-1-a.hajda@samsung.com>
References: <CGME20180202151126eucas1p2142bfb4a4376aea7763f40ce2630e349@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56971 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751567AbeBBPLa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 10:11:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Inki, Tobias,

This is reviewed/updated/tested Tobias's patch addressing page-faults
in Video Processor in interlaced mode. Plus preliminary patch fixing Mixer
interlaced mode.

Regards
Andrzej


Andrzej Hajda (1):
  drm/exynos/mixer: fix synchronization check in interlaced mode

Tobias Jakobi (1):
  drm/exynos: mixer: avoid Oops in vp_video_buffer()

 drivers/gpu/drm/exynos/exynos_mixer.c | 22 +++++++++++++++++-----
 drivers/gpu/drm/exynos/regs-mixer.h   |  1 +
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.16.1
