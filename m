From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 11/13] exynos/fimg2d: add exynos_bo_unmap()
Date: Sun, 22 Nov 2015 19:48:41 +0100
Message-ID: <1448218123-21292-12-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45820 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751870AbbKVSyY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 13:54:24 -0500
In-Reply-To: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, inki.dae@samsung.com, human.hwang@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This unmaps a previously mapped (via exynos_bo_map())
buffer object.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos-symbol-check |  1 +
 exynos/exynos_drm.c        | 20 ++++++++++++++++++++
 exynos/exynos_drmif.h      |  1 +
 3 files changed, 22 insertions(+)

diff --git a/exynos/exynos-symbol-check b/exynos/exynos-symbol-check
index 2bb7718..2e4ba56 100755
--- a/exynos/exynos-symbol-check
+++ b/exynos/exynos-symbol-check
@@ -17,6 +17,7 @@ exynos_bo_get_info
 exynos_bo_get_name
 exynos_bo_handle
 exynos_bo_map
+exynos_bo_unmap
 exynos_device_create
 exynos_device_destroy
 exynos_prime_fd_to_handle
diff --git a/exynos/exynos_drm.c b/exynos/exynos_drm.c
index 7a400ad..e086a00 100644
--- a/exynos/exynos_drm.c
+++ b/exynos/exynos_drm.c
@@ -309,6 +309,26 @@ void *exynos_bo_map(struct exynos_bo *bo)
 	return bo->vaddr;
 }
 
+int exynos_bo_unmap(struct exynos_bo *bo)
+{
+	int ret = 0;
+
+	if (!bo->vaddr)
+		goto out;
+
+	ret = munmap(bo->vaddr, bo->size);
+	if (ret) {
+		fprintf(stderr, "failed to unmap buffer [%s].\n",
+			strerror(errno));
+		goto out;
+	}
+
+	bo->vaddr = NULL;
+
+out:
+	return ret;
+}
+
 /*
  * Export gem object to dmabuf as file descriptor.
  *
diff --git a/exynos/exynos_drmif.h b/exynos/exynos_drmif.h
index 626e399..3b26ebf 100644
--- a/exynos/exynos_drmif.h
+++ b/exynos/exynos_drmif.h
@@ -91,6 +91,7 @@ struct exynos_bo * exynos_bo_from_name(struct exynos_device *dev, uint32_t name)
 int exynos_bo_get_name(struct exynos_bo *bo, uint32_t *name);
 uint32_t exynos_bo_handle(struct exynos_bo *bo);
 void * exynos_bo_map(struct exynos_bo *bo);
+int exynos_bo_unmap(struct exynos_bo *bo);
 int exynos_prime_handle_to_fd(struct exynos_device *dev, uint32_t handle,
 					int *fd);
 int exynos_prime_fd_to_handle(struct exynos_device *dev, int fd,
-- 
2.4.9
