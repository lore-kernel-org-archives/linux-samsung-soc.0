From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-fixes
Date: Mon, 16 Oct 2017 08:01:25 +0900
Message-ID: <1508108485-3402-1-git-send-email-inki.dae@samsung.com>
References: <CGME20171015230125epcas2p3a74e507c3d2627500f5179ab83117e33@epcas2p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13941 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751030AbdJOXB2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Oct 2017 19:01:28 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just two regression fixups to potential use-after-free and
   NULL pointer dereference issues in suspend/resume.

   Please kindly let me know if there is any problem.


Thanks,
Inki Dae


The following changes since commit a480f30846d19b50106b3243d9d48683d2966249:

  Merge tag 'drm-intel-fixes-2017-10-11' of git://anongit.freedesktop.org/drm/drm-intel into drm-fixes (2017-10-14 09:59:20 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v4.14-rc5

for you to fetch changes up to 238604ca0b708319e089e22545bcda39afb5faa8:

  drm/exynos: Clear drvdata after component unbind (2017-10-16 07:44:49 +0900)

----------------------------------------------------------------
- Fix potential use-after-free issue in suspend/resume
  by cleanning up drvdata at unbind.
- Fix potential NULL pointer dereference issue in suspend/resume
  by setting drm_dev after checking if drm_dev is null or not.

----------------------------------------------------------------
Marek Szyprowski (2):
      drm/exynos: Fix potential NULL pointer dereference in suspend/resume paths
      drm/exynos: Clear drvdata after component unbind

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
