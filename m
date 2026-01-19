Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE75033D50A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811167; cv=none; b=Pjhpq89zuJ4kf20qRoBv3b719T0KVzNxNTMsjQKCVJt6ZKagvSBkaoYYCMuhDdD9WHzFH+MGDoKC+cvdimumSrSdDDbthEWuULkBqeYyyIQM7kOgEhKckKqfQHaU79ElnGj50xduC7EL8uPeZkIakf7R3sGtCTxfMU1xexRIwak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811167; c=relaxed/simple;
	bh=LFTtV6r3Kv8hlUjLpPyuwQgn0EJVqqRO2UBgklloSc0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AW79JaZHlh2UhxjzaKYOZQJzIFw0SM+b7pTSHxFfW+nCUfpe43wnJ8Tt0J6oqWTqTncY+fERtkKgOUiJubKmc4gG+LoVs9oW3t1K6URcTsMl4ubhetzUb+B4K7PKfFhL/oY5c8tcUMPCgxkoz4wGLpv5Sid6cdDmi89i7DydCOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbNAL+h+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbNAL+h+"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f1bc40b35so41522195ad.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 00:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811165; x=1769415965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
        b=UbNAL+h+UFXueXYCGrZIrrzmJZ8fz6iPkt23ighCLd19xqfGWOKIQb3JmNMAB3MjI1
         Ckd417D1WStI4SCrES0/ytGatRoI2OwlnehixGKAMHah11rFDtBtmpVxJ+8b6W0aYvTZ
         Dj2aEi6oDw+mGR838m8X7eyKOzvtks0pln3VH2tjLehZQhLpCpeyVIby48WTM8TbZYwE
         ZO+KHnCCgeCFpDz1QmXPrwETdGX1wW9+4BhF+SaZ/R/01oA/WDn587YKImnBhY1SAGk9
         mO4NLPxLU/+NI5Y3DZx98Ave7zaKGJZRRU8/bPnmzq/xOroQCTb3KP/AeVjQbtv2ITAn
         zpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811165; x=1769415965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C1peIzucQT9u+8mHdz0lvrHZdBPLJn2LftndnROMFbg=;
        b=NGUb6n464CMvvAgDwXeY63c2FxKeZVq9xZzvBakiXq8l4CXBsc2ZlU2CUbcqA6UD3/
         uh95tvvLZVK5sLfYQHRxKe26iiCjOJhDLc1lTa8YlOoBDBz1zy+sFQxF7mGUOHxTS5rg
         3dEqLTiI+X1es2eDx+/H3GpcZqp2+YcnM/o0dHROiDi40677MAJMzgM4eNA3RItICQld
         8KUL/J5rm70BbDxFCB9DkZqTj/CK9gOq06+esFCfbMEmGoRCSuj2o0PC5iWxxxBcbnpV
         +tRobbakoIH7uVH2cUcICsfUkae59Rl5duK1BZSt8iTq7O2AaGLjzzWD3IpBYfcSwHAU
         9LZw==
X-Forwarded-Encrypted: i=1; AJvYcCWDsX51YsWm2CAVRnCK5rQVhdIE3iGc/pf3gNnhqDZnJAnPSETJJ00b88rJS1PAKxKbGEkx8ru5Pe9w8uXtp+LHrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGIEycuILkzZTt2huFLta2g63n/jiOYmAODVjqUZ0cE6E6hgu4
	agQKENcsLZucifA6hwlrDBuVtohjMc6KJr+4vs7SmkC55j+9VMYXlmF5
X-Gm-Gg: AZuq6aJIEiqXzZBBEydB/l1VJTpgXfAjU9p2i9H/S65n7dXhDD2C2MHd+WIvA5KEPEd
	EHWwL+NVBDWg1Fr7wL0BhlJzNxFGJTSOL9+YttJ8cUQfFmLHmPTrEswHFMJOa5CVmpk+pAoLbg/
	ZxsFxQf3cwOx9qS9KbOPKzC+TGu2CimEipwfymwKG7SRAZWkP+AR9AB2+6n/xQGFuid7B3J29at
	iO+zc/N/7TbYI4sTY1mV2bjEFWlqjhcRIM3Qf5Toh8WRYKs/KsxAvmfP1Qq3uYE0IkT3dHY6odB
	jjMFT2DjURu+s6QS10Qj3m5zX3UM0IvtU7Uy9LRmJHee+b0913m6g3IMu0niPteFKl8iWFjcRjt
	u3DdzIeP++mQDgEs5PoBIhzW1pIKQOhglG/ycJuJFy3z1Ie5rlrmyVpORLfY+oiO/tMSBoKhkBc
	9KCjP9und1mzSYCfr1Ozsd/xMOa+BxA3oIpaC8kg==
X-Received: by 2002:a17:903:1ae4:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a7175cc0f1mr100262275ad.28.1768811165155;
        Mon, 19 Jan 2026 00:26:05 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:26:04 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 1/3 RESEND] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Mon, 19 Jan 2026 17:25:51 +0900
Message-Id: <20260119082553.195181-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index e094b8bbc0f1..1fe297d512e7 100644
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
@@ -371,6 +376,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -378,6 +384,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -423,8 +431,12 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	timer_delete_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {
--
