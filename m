From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 3/3] drm/exynos: g2d: prevent integer overflow in set_cmdlist() ioctl
Date: Fri, 20 Jan 2017 17:02:52 +0100
Message-ID: <1484928172-16784-3-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1484928172-16784-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47216 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752602AbdATQDN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 11:03:13 -0500
In-Reply-To: <1484928172-16784-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

From: Joonyoung Shim <jy0922.shim@samsung.com>

The size computations done in the ioctl function use an integer.
If userspace submits a request with req->cmd_nr or req->cmd_buf_nr
set to INT_MAX, the integer computations overflow later, leading
to potential (kernel) memory corruption.

Prevent this issue by enforcing a limit on the number of submitted
commands, so that we have enough headroom later for the size
computations.

Note that this change has no impact on the currently available
users in userspace, like e.g. libdrm/exynos.

While at it, also make a comment about the size computation more
detailed.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 6962f6b1..f8737d43 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1193,6 +1193,16 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
 	if (!node)
 		return -ENOMEM;
 
+	/*
+	 * To avoid an integer overflow for the later size computations, we
+	 * enforce a maximum number of submitted commands here. This limit is
+	 * sufficient for all conceivable usage cases of the G2D.
+	 */
+	if (req->cmd_nr > G2D_CMDLIST_DATA_NUM || req->cmd_buf_nr > G2D_CMDLIST_DATA_NUM) {
+		dev_err(dev, "number of submitted G2D commands exceeds limit\n");
+		return -EINVAL;
+	}
+
 	node->event = NULL;
 
 	if (req->event_type != G2D_EVENT_NOT) {
@@ -1250,7 +1260,11 @@ int exynos_g2d_set_cmdlist_ioctl(struct drm_device *drm_dev, void *data,
 		cmdlist->data[cmdlist->last++] = G2D_INTEN_ACF;
 	}
 
-	/* Check size of cmdlist: last 2 is about G2D_BITBLT_START */
+	/*
+	 * Check the size of cmdlist. The 2 that is added last comes from
+	 * the implicit G2D_BITBLT_START that is appended once we have
+	 * checked all the submitted commands.
+	 */
 	size = cmdlist->last + req->cmd_nr * 2 + req->cmd_buf_nr * 2 + 2;
 	if (size > G2D_CMDLIST_DATA_NUM) {
 		dev_err(dev, "cmdlist size is too big\n");
-- 
2.7.3
