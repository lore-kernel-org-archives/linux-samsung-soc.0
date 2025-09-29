Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7E20ADF8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759120169; cv=none; b=pgth/Sk4QwKXTlqrFCY4PRB2uDLWPPrlgjvJNARdgH2XQa8hjb0IlV3Rfyww+wTX88LtwY6JHx8OmdDjyvIfsdEWmnkm4aW85wEMbH+YWRHPE2oSeWCVEK02i+ZaHZ9/jGxela4TcoqLmhnbbuc+FYrwFWQHqb5PbqfcqiyTFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759120169; c=relaxed/simple;
	bh=OvLdDTiYvksMV0SFUsHZ+qTPxY8hy9wo6dzSepf0uUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=fUejSJvFE5VCQvPcsuyLl/bVnfOPGZl8SUbKsETi7n9OkWZEgech5/xlYwrQHpIijEd5kqjVdGE7cM0oXe/eKrKnoq/XXEFe0/cnzXEGGk3v7Mqtfv8tOdc9r3fGiB2wCblAnJjrCktGr68R31N4uR7hrWfhJRDt+qVWLLenJd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LqKTPS89; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LqKTPS89"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250929042918epoutp02dae0b46861f50658f1f68c0a9cf9fc62~ppnbgcOrA2973729737epoutp02i
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250929042918epoutp02dae0b46861f50658f1f68c0a9cf9fc62~ppnbgcOrA2973729737epoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759120159;
	bh=6sXHbeK++urRgXFZ0q5BURM+QBMH1xJNpaG+x/fCF18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LqKTPS89TRCiFaXTZaUlQaYINomJBLLho1jnkGuv5dhMizXUKnXmSgTeC58TpgeFv
	 ELRtB+i2iW3eHXV+sp9sIC6gI7GmnhWzz7Fvsic8/u4WvjYIOVN3QPEYx+hfiAshrQ
	 KAT0IruBjF6DpPCg/+OUKWSQ2pliEtUV7fY7tL5o=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250929042918epcas2p48ba6d48b41c6fdd147cf6c6850617c73~ppnbAiqdy1362413624epcas2p4W;
	Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.205]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cZp9p0Y7Mz6B9mL; Mon, 29 Sep
	2025 04:29:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3~ppnaD-lQX0591205912epcas2p4u;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250929042917epsmtip1dc25e0c7a28d5a3a5ce6ffb1ebdba5be~ppnZ-VBh52522725227epsmtip1n;
	Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/exynos: Move mode_config setup from fb.c to drv.c
Date: Mon, 29 Sep 2025 13:31:10 +0900
Message-ID: <20250929043110.3631025-4-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3
References: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
	<CGME20250929042917epcas2p43d95408c9c43ff49ff6674136d7c64d3@epcas2p4.samsung.com>

Relocate exynos_drm_mode_config_init() and the mode_config funcs/helpers
from exynos_drm_fb.c to exynos_drm_drv.c, and invoke
drm_mode_config_init() from inside exynos_drm_mode_config_init().

Rationale: resolve the historical fb.c placement, align with common DRM
layering (mode_config is device-wide policy that belongs in the core
driver), and make initialization order explicit before creating KMS
objects and binding components.

No functional change intended.

Signed-off-by: Hoyoung Lee <hy_fifty.lee@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 47 ++++++++++++++++++++++---
 drivers/gpu/drm/exynos/exynos_drm_fb.c  | 34 ++----------------
 drivers/gpu/drm/exynos/exynos_drm_fb.h  |  7 ++--
 3 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 1aea71778ab1..6362cd417a4e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -233,6 +233,43 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
+static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
+	.fb_create = exynos_user_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+static int exynos_drm_mode_config_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+
+	/*
+	 * set max width and height as default value(4096x4096).
+	 * this value would be used to check framebuffer size limitation
+	 * at drm_mode_addfb().
+	 */
+	dev->mode_config.max_width = 4096;
+	dev->mode_config.max_height = 4096;
+
+	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
+	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
+
+	dev->mode_config.normalize_zpos = true;
+
+	return 0;
+}
+
 static int exynos_drm_bind(struct device *dev)
 {
 	struct exynos_drm_private *private;
@@ -257,9 +294,9 @@ static int exynos_drm_bind(struct device *dev)
 	dev_set_drvdata(dev, drm);
 	drm->dev_private = (void *)private;
 
-	drmm_mode_config_init(drm);
-
-	exynos_drm_mode_config_init(drm);
+	ret = exynos_drm_mode_config_init(drm);
+	if (ret)
+		goto err_free_private;
 
 	/* setup possible_clones. */
 	clone_mask = 0;
@@ -272,7 +309,7 @@ static int exynos_drm_bind(struct device *dev)
 	/* Try to bind all sub drivers. */
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		goto err_mode_config_cleanup;
+		goto err_free_private;
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret)
@@ -296,7 +333,7 @@ static int exynos_drm_bind(struct device *dev)
 	drm_kms_helper_poll_fini(drm);
 err_unbind_all:
 	component_unbind_all(drm->dev, drm);
-err_mode_config_cleanup:
+err_free_private:
 	exynos_drm_cleanup_dma(drm);
 	kfree(private);
 	dev_set_drvdata(dev, NULL);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ddd73e7f26a3..c118a079d308 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -8,8 +8,7 @@
  *	Seung-Woo Kim <sw0312.kim@samsung.com>
  */
 
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
+#include <drm/drm_modeset_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
@@ -93,7 +92,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
-static struct drm_framebuffer *
+struct drm_framebuffer *
 exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_format_info *info,
 		      const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -150,32 +149,3 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
 	exynos_gem = to_exynos_gem(fb->obj[index]);
 	return exynos_gem->dma_addr + fb->offsets[index];
 }
-
-static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
-};
-
-static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
-	.fb_create = exynos_user_fb_create,
-	.atomic_check = drm_atomic_helper_check,
-	.atomic_commit = drm_atomic_helper_commit,
-};
-
-void exynos_drm_mode_config_init(struct drm_device *dev)
-{
-	dev->mode_config.min_width = 0;
-	dev->mode_config.min_height = 0;
-
-	/*
-	 * set max width and height as default value(4096x4096).
-	 * this value would be used to check framebuffer size limitation
-	 * at drm_mode_addfb().
-	 */
-	dev->mode_config.max_width = 4096;
-	dev->mode_config.max_height = 4096;
-
-	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
-	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
-
-	dev->mode_config.normalize_zpos = true;
-}
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.h b/drivers/gpu/drm/exynos/exynos_drm_fb.h
index fdc6cb40cc9c..0c79ce5d4a8d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.h
@@ -19,8 +19,11 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
 			    struct exynos_drm_gem **exynos_gem,
 			    int count);
 
-dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
+struct drm_framebuffer *
+exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		      const struct drm_format_info *info,
+		      const struct drm_mode_fb_cmd2 *mode_cmd);
 
-void exynos_drm_mode_config_init(struct drm_device *dev);
+dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index);
 
 #endif
-- 
2.34.1

