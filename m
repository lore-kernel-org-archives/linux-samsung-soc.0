Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613BC3624C0
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Feb 2026 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770031965; cv=none; b=FG8IqWHW5HSNvrlrRXS4KyOCOMKin6ItHxEcWpaw06FpQ07tek6sh5FPhr29DD1hMGHN8oezhCNNDfi2lNrRKRaqLvRXpSYb/3UYJrF5P7GbP2UruqHK4GC9UiKGZCmGinPe1CpNqBihC38p+uQJjHy5KvJaXtjq9ZFvnpIfKw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770031965; c=relaxed/simple;
	bh=mXXZ/E8iu1icugw56rUDGM02NHGVORn+CKASFjCuOLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=REsxkLPbvsg83x/HGJvjKZqBswMick6mo0AlVZL5xX1fHMo4BQgOGggaeRkd4CKmRrDH8fMeynX1l1ItgAtm0cMBRrTn95nerkK4G2qYqI1x38AG4gb1vs0gWkt+l5Y/VRFR8t07XwNlzyQaw54GvKetTqaraNlN2Det1r+uC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPStKWyw; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPStKWyw"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so3612418b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Feb 2026 03:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031963; x=1770636763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=;
        b=IPStKWywAd6GT7botAZvDrXyxJCBVghn0tlVaWymWaC635+BE6dDjH23Xbedw9QZS1
         Dh71ebqcBQ7FypNOvHyUqWsXK88qRcoR58U6uy04Gj+VXDApviCTnK1tj2tAOJNYpSLn
         Y4aWinaL5TXxc16XGeS+MOixpdH4J/TOakjFYYfNRaiOwfebjEwFkSct9m8J+FhgnGsK
         TeTFljB7FpqMA2MLuZK1kR5DsUv/Sxrmzhp/mV95EYt8Cprv3wIcIxERhlEyu3KGC5wU
         V+Dctyr+w349wsX5KUGJQyj2XZlZjpb0wM+oopwIAdB/NO+59IozAh3OHvsRvSD9u7yZ
         R0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031963; x=1770636763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+souS7YaNTH8HrRQ+fNkEhlVU7efydlW/fF0+nylSc=;
        b=RjobU+QHjTIfb5b16P3aFz87DiIoS3DCLFhAB0gv+rs3H1/KQKFuopaV4hnsz1LS1L
         F2yJYt62qz0fUB+oRQMhwuK8PQryZ0AOVH8BbZQMdoxNAMng0B45Yl90/wka3tCaelCt
         NJUAJoay0a1ptaeOd+hxg1jM93YipO6F1Zi9DLCUkYN4Py5thvvu1aZyM5PFiwhAjJjB
         fI7vRJMHjQCULo38WdvrK6eU60zSjH8KEXXNQg0j3BBq8XMqo5/Bwn3qKTk3PUX9wyD0
         jbcVuL8Eb6TPVXAhP0IggtpHYfVJvXMJ6txpNzfpD8eyWmm829sYxKpvWfuH9JBt11lI
         gyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7IRMfxM26sHvmLvvTw2Z0kV3dv9uphc/XTUC/9FbRWGttlgRw6EKu9JW0+8ZJdhbYwFtJIhpJkH4qN99sOYiagw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxjE3IwTof2UZCnUTDrNSvHWdWHgw0C/4y40fB2rIoGohKyPu
	TUOiOeiREElO4aXPBrTOoZTQz5DVS898oSIDzTUQKbLoknoY6gZCunzF
X-Gm-Gg: AZuq6aLrhP/EuU3VNvTC/BK4ez+gkKRnXuWFs5wCdc/JSN7Q72YnaQf/RQvl1I0n2bQ
	Zflxe1RwpQlWk+YriZufQi1auHSuBfSKvSRzv/MntmW44r3gRc/X1mINzb6T3ZSXI6xHslvGFbL
	26vvy/Y2u2QO1tXX0a1TYGtLNzq6YXb22yfMV4bnzuHN6mbtXeIk8cEAgFMtXvdA2z4EsyskYt9
	DhGLU+UiGdJG7U4V++RE0KBLr/XW9Qb7uo+DxaFRU0IH9/g+3fPrDp6aIUbgu7d/iQ5dGFZc5jM
	vESljxvjfdmVhbBBUufL7tBsAn8pmZCoiQtVPpgbHyEA2wL1ix7tHKXGaiTpUm/rnwJp9eimNn6
	ISqF65ir/VA/l9OIon792ZcjXpJudfzmm795jVsMkV29wcorpHv/Sd5mDh/91xLmE1tm9L9i0Rp
	jQaFsw1ByQYloksdJrcsp0A2rdZ+5aMiTubIBUsw==
X-Received: by 2002:a05:6a21:7804:b0:393:8fc:5284 with SMTP id adf61e73a8af0-39308fc8453mr4806502637.70.1770031963552;
        Mon, 02 Feb 2026 03:32:43 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:43 -0800 (PST)
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
Subject: [PATCH 1/3 v2] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Mon,  2 Feb 2026 20:32:32 +0900
Message-Id: <20260202113234.183393-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
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
Fixes: cf67cc9a29ac ("drm/exynos: remove struct exynos_drm_display")
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
