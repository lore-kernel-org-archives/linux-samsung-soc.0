Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03BC36212A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772168402; cv=none; b=pH+7zyJ42mKSMPTH+QDam/Cke5qV1NuWRXRRtpDsP+nCwbNrW50VFYzIoQO/bSeYCj0F7f3/oigyAfPBrcSw0El8tqWe5ARV6HaSQqhZ4QpNl/PqRugD899R9Kn5C3dogkn+/cQl9cPKEWkQ7iF3oI77dqoeVBhrp8dVOS2EPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772168402; c=relaxed/simple;
	bh=b9b22Ozhvo19VJujzVT1horPbr1WA97i8oWgfeEATgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmwDJ1Cp2qP73tMo6Ax3XOh90xMlififzMAP8lHLdJ9w2oLSJOR/cDQdik6gN3+VtiyXUKCO9JBoFZNW8ImQ+zS7xa+PzLAYFM56eQE6X3/+MsPWb33I7R82xGwkZpTsuoYytRS633smUlybQr8xpggbEzjGhUikh9EHG2LNpEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdz/Dk03; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdz/Dk03"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-823c56765fdso930190b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168401; x=1772773201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=bdz/Dk03AQjRFAMl+2+AwTRbK1nMimX9u5TZQ3CCVvakGeqsImXEHIv1IAabOkG8Gl
         KokNMRmPpI3aP8RsdJtrDUzVYVnLE0gMYY84/8MkOQMz21vBSlBobTgW8Hc46IvS7dJE
         QR9kfsMoyyexTdWTSHzJDAKc89Ze5nVPIXgsYA9gA0yqcfPlkznSPxfWamdivXu/Wd4F
         ZFxZiuqb0iDkUtAClbY5OEusY8dFGcABkYZMxuZN67XTcLu3TdrRsjeAW7Z+PrTHVvh/
         s8SDxVGyyJFr6XBwU4mkagLQliGcKIv91mERLilTc43ABq+RjiIpYCd5LU2vDcX8boCf
         aPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168401; x=1772773201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWzBer8K/lUNOlKz33ehPBmEnMKwxXodb/hUWZrwOGc=;
        b=tdHbBR9K1wxBORXld3kbSTNgZ7T1mjsThY1T1WapWqtCj1QvdP7dGkRHUriN6na9QR
         EpjeWzGR0Bejj7lfNEZsy6Xx1wnM5IE6jlX7ZioBilc8ZoJ4aH78HqzCO1bD9p0gmaf+
         WSoqkV6E7b21XEcDR5BjaQMil9vKNxSLBgkpIY0rw65UCnQtStM+fIA/4js4YPmZgL2A
         s0+a3QhOorcCH3tLSyv/iQzJlyf6D+D0Cgte1ikCfxKF4KrI6Q50VHET59ywA7Stq4F4
         JXTAGacfiIEdBcbGszmUKu+8P1I194A6CVM6rZbNdSd+0RPD7xCjsoCe1TZPdWd0SWQT
         xnuA==
X-Forwarded-Encrypted: i=1; AJvYcCXe7RKxioqwp6vS4RQ6kkWXrqP0Sj1fAPhpfRVdLIrvt3Up279IyaFg+DRVDotGkUq7yvP889Lkd6EwyQD67vUH8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwubjyuzfD8WATsYctKZQAFK/VbJ6ZbOqCnudzoQFSWEccWJT3y
	yQ4b6s7z5sOVB1DRkAfAuXuMfDgnAD1M1WMIpBYm4fj3gEgE2fIgYvZn
X-Gm-Gg: ATEYQzxMVDFFMHcbpQMkQbKyP/raHRYXsKh4BiVeUHD+x08S5LUsxtedobVjcqGwWFU
	MrFyAEmCiNabY+BfvTRjhDqOyH1f1dP2JmxP8R7LracX0ozqu3GNQI4J/1jEMrDRb3Yui54TAcZ
	J/wSL/CdN80EzfS8XVrQnnSP8ty25kXrKDHQ+UjzE+uP7Y9gjh6l7jY7fH/g2VKsJAZjnCTpupA
	e40tlfkpzGCnOB23PV5/C87etwKGm61m0Y2o/5fkpey6xmU2Q7mLwiHrPoEpXrl0lZYnrZONuVf
	TdUkhjHD0HjJ/zM6tf7lgnrkknnEorz4NRBrMyMTgFovTQ+RHVg6DKbDk0zL43IW3QFdvUSS25D
	EuMQsd1iKu1JLAhCng9dEo2UiuMEEW+wCpSizR+/V0ZP78CrIpmK9n9EcUYQgXaANjZA0Ma768a
	TZI3fGtDYk+QusXCyR7yjUp7vZsEY6fm32C3tRejzw3PmeWCTI1A==
X-Received: by 2002:a05:6a00:9518:b0:823:30a1:d5ba with SMTP id d2e1a72fcca58-8274da04bfbmr1455329b3a.51.1772168401020;
        Thu, 26 Feb 2026 21:00:01 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.20.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:00:00 -0800 (PST)
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
Subject: [PATCH 6.6.y 1/3] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 27 Feb 2026 13:59:51 +0900
Message-Id: <20260227045953.165751-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227045953.165751-1-aha310510@gmail.com>
References: <20260227045953.165751-1-aha310510@gmail.com>
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
