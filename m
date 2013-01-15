From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 0/4] drm/exynos: add support for extra resolutions to exynos5
Date: Tue, 15 Jan 2013 08:11:04 -0500
Message-ID: <1358255468-14287-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52114 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753546Ab3AOMuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 07:50:18 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGO001W73NGBG10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:50:17 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGO00A5V3M1A810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 21:50:16 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com

This patch set adds support for more resolutions and refresh rates to Samsung
Exynos5 SoC series which contains hdmi transmitter (hdmi v1.4a compliant).

Given resolution will be supported or not, is decided by two factors:
1) Corresponding pixel clock is supported by hdmi PHY.
2) Mixer supports the display mode.

V4:
- Rebase on exynos-drm-fixes branch at tree:
http://git.kernel.org/?p=linux/kernel/git/daeinki/drm-exynos.git

V3:
- check_mode -> check_timing in patche description.
- Change type to u32 from unsigned int in mixer_check_timing.

V2:
- change mixer callback name to check_timing from check_mode
- callback parameter is changed to type "struct fb_videomode *" from "void *"
- organised the implementation of check_timing callback in mixer driver.

This patch series is based on branch "exynos-drm-fixes" at
http://git.kernel.org/?p=linux/kernel/git/daeinki/drm-exynos.git

Rahul Sharma (3):
  drm/exynos: add display-mode-check operation to exynos_mixer_ops
    struct
  drm/exynos: implement display-mode-check callback in mixer driver
  drm/exynos: mixer: set correct mode for range of resolutions

Sean Paul (1):
  drm/exynos: hdmi: support extra resolutions using drm_display_mode
    timings

 drivers/gpu/drm/exynos/exynos_drm_hdmi.c |   12 +
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h |    5 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 1035 +++++++++++-------------------
 drivers/gpu/drm/exynos/exynos_mixer.c    |   34 +-
 4 files changed, 426 insertions(+), 660 deletions(-)

-- 
1.8.0
