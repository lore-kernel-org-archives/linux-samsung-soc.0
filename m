From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 16 Jan 2017 18:03:14 +0900
Message-ID: <1484557394-17649-1-git-send-email-inki.dae@samsung.com>
References: <CGME20170116090314epcas1p3be0bda8ccc11f3be5475bb405a24a246@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59446 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbdAPJDR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 04:03:17 -0500
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJV00D587TFUW20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Jan 2017 18:03:15 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just regression fixups to resolve page fault issue of DECON device.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 9afe69d5a9495f8b023017e4c328fa717e00f092:

  Merge tag 'drm-misc-fixes-2017-01-09' of git://anongit.freedesktop.org/git/drm-misc into drm-fixes (2017-01-10 08:18:53 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos exynos-drm-fixes

for you to fetch changes up to 821b40b79db7dedbfe15ab330dfd181e661a533f:

  drm/exynos/decon5433: set STANDALONE_UPDATE_F also if planes are disabled (2017-01-13 18:22:51 +0900)

----------------------------------------------------------------
Andrzej Hajda (2):
      drm/exynos/decon5433: update shadow registers iff there are active windows
      drm/exynos/decon5433: set STANDALONE_UPDATE_F also if planes are disabled

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
