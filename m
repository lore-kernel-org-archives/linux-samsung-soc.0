From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC] drm/exynos: abort commit when framebuffer is removed from plane
Date: Thu, 19 Jun 2014 20:43:29 +0530
Message-ID: <1403190809-8413-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23908 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756959AbaFSPOs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 11:14:48 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7F0000590MRX30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 20 Jun 2014 00:14:46 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

This situation arises when userspace remove the frambuffer object
and call setmode ioctl.

drm_mode_rmfb --> drm_plane_force_disable --> plane->crtc = NULL;
and
drm_mode_setcrtc --> exynos_plane_commit --> passes plane->crtc to
exynos_drm_crtc_plane_commit which is NULL.

This crashes the system.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
This works fine but I am not confident on the correctness of the
solution.

 drivers/gpu/drm/exynos/exynos_drm_crtc.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 95c9435..da4efe4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -165,6 +165,12 @@ static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
 		return -EPERM;
 	}
 
+	/* when framebuffer is removed, commit should not proceed. */
+	if(!plane->fb){
+		DRM_ERROR("framebuffer has been removed from plane.\n");
+		return -EFAULT;
+	}
+
 	crtc_w = crtc->primary->fb->width - x;
 	crtc_h = crtc->primary->fb->height - y;
 
-- 
1.7.9.5
