Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E383325498
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162784; cv=none; b=GQIK9nUn1IpZFC0JefNgcVbKqaK3Ta9bonffYGN6yCch3os+EzuRMM81MgK7HUOkstm6Uj6ezdCaC9ytZvh9Wl86r4FN6uX50rLR84gHFbx1b+DvuMiaUCNpvLH/SjzVd1GRo7DmBbU4Sb9aCvVOfZEO0UBW8VN6cxGJVidL/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162784; c=relaxed/simple;
	bh=b9b22Ozhvo19VJujzVT1horPbr1WA97i8oWgfeEATgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q09bRh/0T/1ePjC/48rG/w6FO6oBeOleur2G9PNE4hbHCOrqStStE5b4n8msWcK+0bXWnMRwDoz16E2Mw9JJfVs/9NBsu6tm+iC+t977wWlgE+jnKIrjOaTkOVrHvMKa6ZR7L+WisfFGe9UBkld0kTkYh5o6B1Xc7BT1n7Y6r50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajYGAz0I; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajYGAz0I"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358ed67cd4bso584810a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 19:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162783; x=1772767583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=ajYGAz0I3qhT2rhanUISCDGW/UeEO7QHfCqzjfJzi6o8WVSrI1I2fk3XyHEHZklCj2
         tjgFU5SBGVTIB1wiweG0XpdK6dTgd66RH8QietSfG8qsna+R4RaWrwL5fWnTdRRQc3wq
         0k5kLGYhw+KKY6xg1LaT0mvKuwjhLMn51xlpifxpHaO2yPr8cJHgOqlFmfdgkiCHPPlG
         BmdhE2TPIPZ0T8n/A44uIsjYoxqg/G+ADAiX37dlFY1U3i+Bq4vu15mYQKB/jzRF+i8g
         yRQeHCF3LzJL86hZiydqdz/LnNeTH8pne9lGv2fH6oN6jBuqfhVyGahKITyFodpP7iye
         jYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162783; x=1772767583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=AtGdgJPpyMhy8f2rutXCE8trd6y+aCSt0PGjEI24DWJH0MkrDtRJp7/ev+J1VIrXDv
         qWQoy8e7jBugG37P+xL8yT1ABWMuo9cgtgzmsQEIIBiwtLdIBYni65Siy6v3wCjUFtRL
         wY2wDi8GqHYpcfBz7/cCVMEUTJ5RdZ35E54L8xRb4Sck40Vbl39eOemrGUrfNwUr3+bI
         5QWNkGDrHRyHLBkd5P1Y2VuezJ3Ur4VExJgl8PcAf50nnW+6Ylv+UOLeayDrYmgVyGkj
         ftDae9W1+3BeDG3weDPTE/PDT8JRapBfVWn3bhjpG67MHf/L7Z0XR927l0ewsYp5Ryly
         wnaw==
X-Forwarded-Encrypted: i=1; AJvYcCWF2jDupd14qN5TBzN15Op6Cio+GcOInvy282F7jMtOI2zmZf5CKaR6GIXBLawqAt43eD45zIcxymg4dNr8eKeF3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxurwcQ6a42wMLAF4bhtNEsVi/mYL0Uu2DrXmx9xW6wnpWykJzD
	7Q6Y2k56I5MXYemsEQibZXnOp33wJpv1I2suFPBjtXjM53TRrohoQou/
X-Gm-Gg: ATEYQzy6XYq/FYQ/FVscQlSljpgNtu+Nhg94Z8EaIKb9k+cX/sirlgjICYD++wky+bG
	yckvE8nFwtrNRqBaaLLG68Ew0SyNMurwhUgWb3cghbhAGdIODIu5Of4ERyc5Y298+4EbG6f/NnG
	FgH8DrcKJ2xSE9kCsXZNUcZDqlR9mesvPPCTyzMk737IzsMPFe4jCN3cN++wDKS2kxMUqhkVOXF
	b3nCX+AdorsTddK+B58ta2BOyg8k7kj1X4U5ICHYMa2vsnE7b19IRSs+AVQExY5XczUBD7Xs+Hw
	A8vvBGYtsK0Pi8HMPmoWZ10j3jtuGcFQk4D3vukpej7881yqFE8WzYbYC26nE1KJQgUVdEDlvf7
	5NZmjVl5vzYZAiFb7QL7TfhncEHdtbRG7OTqKROCsoaP+x8zc8NSYgNpVbwDyGSwAzZsv8guOS6
	t5mpkdRR2upg14h2Wg7dOPsASANbrmCfgJ3L1XZmT13Mnnyu6aIA==
X-Received: by 2002:a17:90a:e7cf:b0:34f:6312:f225 with SMTP id 98e67ed59e1d1-359388c4ea3mr4132576a91.14.1772162782843;
        Thu, 26 Feb 2026 19:26:22 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:22 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 12:26:13 +0900
Message-Id: <20260227032615.108139-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227032615.108139-1-aha310510@gmail.com>
References: <20260227032615.108139-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ Upstream commit d3968a0d85b211e197f2f4f06268a7031079e0d0 ]

vidi_connection_ioctl() retrieves the driver_data from drm_dev->dev to
obtain a struct vidi_context pointer. However, drm_dev->dev is the
exynos-drm master device, and the driver_data contained therein is not
the vidi component device, but a completely different device.

This can lead to various bugs, ranging from null pointer dereferences and
garbage value accesses to, in unlucky cases, out-of-bounds errors,
use-after-free errors, and more.

To resolve this issue, we need to store/delete the vidi device pointer in
exynos_drm_private->vidi_dev during bind/unbind, and then read this
exynos_drm_private->vidi_dev within ioctl() to obtain the correct
struct vidi_context pointer.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 23646e55f142..06c29ff2aac0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *vidi_dev;
 	void *mapping;
 
 	/* for atomic commit */
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 6de0cced6c9d..b31eefb3a8b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -223,9 +223,14 @@ ATTRIBUTE_GROUPS(vidi);
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = priv ? priv->vidi_dev : NULL;
+	struct vidi_context *ctx = dev ? dev_get_drvdata(dev) : NULL;
 	struct drm_exynos_vidi_connection *vidi = data;
 
+	if (!ctx)
+		return -ENODEV;
+
 	if (!vidi) {
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "user data for vidi is null.\n");
@@ -374,6 +379,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -381,6 +387,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -426,8 +434,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	del_timer_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--
