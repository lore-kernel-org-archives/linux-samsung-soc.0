Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC2E3D9049
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170407; cv=none; b=auR3wyhDyqvUw23oWYi+mPEu3oZ72L0Kug6ux7nsJ8lIGf90cGGJGa08rgDj/x1M4VPQw9qf8GCLy9L/vszeLN4vQObrdFSCzNqmZkCkFAawlUhNJf+iSdpzehdlGZ45/tHtfzl/Cl6+d5HfHK8Dwhse7mFhRwagFrz4qM+8y20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170407; c=relaxed/simple;
	bh=b9b22Ozhvo19VJujzVT1horPbr1WA97i8oWgfeEATgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fe6Z+9CIhekhUA8R1gj1NZ2OIeQqhbYoXP2+sr8A7MYS38PmpLMGKzs2Eh9F8JEHH14JG17Xc3IGGUDH1/edOqW/XqYOagwws/mLhxwii9vcepBP8dZ+ndfBgXHmh65+iwI72CiYM1NCCY+Koura9ZumxtqyGueby8Hg+j3G19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo3uANIK; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo3uANIK"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823c56765fdso942588b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170404; x=1772775204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=jo3uANIKQqy4fRyqLKWxjo/tW4WyzQo0WjSg5vfDfuQrKOOnUJzS4cSv0cAgh2/oRr
         O/5yed+Gwt8Vto3PJfHuCYd0lkHR1eqFVRYt2nG8VC+YHaqV0SVRkR3UVKIDa7fDWDF7
         7vcxah+vuuuji5ENOl2H6O9Yf7ZBuomshJkuxj1aUX0CU1vMUEcoQ1J5jaP4hEXQt+uK
         eSJefHQS6LBQ7GhRu0McxTAblNFnJM+afRqssQqrSUdpHd03++0m1rgu32qbhxRLEcs8
         n6BopYEfse4+Nuw71VVrJgksuoeDZ1kGBDcK3RXPRp/oSiQHr4KVgfnSWLOGoz6MpYLJ
         7CBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170404; x=1772775204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=Wgqw28A4CIKObeJlE9h9jrddGPOYtrRr8d3aRRHpChXYinbWp/3159hhCTjzYzh6/B
         MzSoqYXdx3L4IIQo+OEVDBwm7i5UJxs2prWLDts8+35emp4yWgZd+BEZpGfKz7fj1iZq
         CixLrZUOq3eGR4YyBlOD8kkFP+4x2TcZjjrfBgpkK1APbBzB2UUu49rtMI9/G1pX4Mz9
         XTdgZy77txUP0WXhoXYpl2XMvM5Rt2NNSW6+iGI354h+EM9GUjHQq8x1HL9Av8DEPsh8
         umV5gdlQodwbs57KODYGFh53CeJovG6dVVOu8l8vvDIRdpTtL0OOeTrCzHDiTE22gVXi
         AB3g==
X-Forwarded-Encrypted: i=1; AJvYcCWyNxmYYN+zAYyXJAAkp5pk5WBffYDIxh41elB953U/G0Yub6rq/DIHg33txdoz9PbMMNt+2nTkmXlvu3wtiop9pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLf+v6QTXW4BPR0yPhk+RMRNlW8ZsQFk/Z5pWagAS1v5P3aTQe
	0Al0N9OlLOUlyigcYmdXPhoKzzQdRuudZw3g5vdjKWMTgwSuKLM8JgK5
X-Gm-Gg: ATEYQzyWsfiQvvrF4OqYXmfC2b+2jucc7RZ+h1I2wZbdeCVCbbWlr4nd/ywT5aqKuDF
	qN80WY+8VU9lKZl0wSdIxMA5pAgu23B0p0bqJJdvZD8yCu2nVFlp3VoVd9SM3Gn3CiuPaadsQzy
	XdNVuMZBGGF8dPPSRZB8HbuyIoChz2ApCErtXtQvNk0gZRNEF7KzecunKy6SVRmF2HCOEBSOzzl
	XbQJxORrzysz/zdAsLpBT/fA0bUS7NBzL5/m6nNkB0KoTdsv6G6pLagTcus9XligSLtAD/mNqUc
	Vt+4rHpXViQiELZdM3Mi7NqOk6bTgECiBSu9CadLvKVLY80vCh7zGKI9UGpHCQEnHvJCGpVFsaC
	fbQLHR4swIGKBT+siWJJUOEbj2Cv38F8TqCEdUCqMgvvEz2pJEXRjQH5XQBDLZ4UgvSlOluuR1c
	M4UFNhxzTimne4cuHLbSic5i+oPpn4km/QIwyLbbwFdvmTSPXEOw==
X-Received: by 2002:a05:6a00:2d11:b0:824:16ae:9ec4 with SMTP id d2e1a72fcca58-8274da248famr1742089b3a.63.1772170404587;
        Thu, 26 Feb 2026 21:33:24 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:24 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 14:33:15 +0900
Message-Id: <20260227053317.426000-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
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
