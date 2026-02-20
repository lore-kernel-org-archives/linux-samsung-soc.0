Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0662E2DAFA4
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Feb 2026 03:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771558561; cv=none; b=TXj8PmoEOSinoYaaeTEoyUuIE7QdVhsiGjxnOtpKAie1JTom9anYAn0tSG9VgIXpET2pY5woeLi1GJnf0reomCqwAeDIlHwAfSEE0qsOacLWQh+tGcxuIHNlRwebN6lKGciqlOFv4zKgaFI8dLnJWnBYHTjAG/ZcCNSfr2dT5DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771558561; c=relaxed/simple;
	bh=QzO8lKBkDOc2XZfOK961CgRLNkgKWjz8O0lEWEyHBzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T6Uo7RkucSHTRsG/0XOaVf2gjIiyvBgFPqlBkM7s3ewQDgXU5O+ShTt7Wxp8nM5WS/+vHbKIk+BLG5Q9Ke9t0xbUJAVDRrxWKXJwibE5+2+HVfzUjxrjV9ebMv2JnhscfIPWXe0fOtgGfLnaZ2ln7XIQ5u881Hh7fBveXDcs6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnq+F5yo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnq+F5yo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab232cc803so8186665ad.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Feb 2026 19:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558559; x=1772163359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=;
        b=Fnq+F5yoMOgLQloS4rRYni9ja+4w3cxeD+hUBRXQwKWHXVCyz1bvbLVXHJ8D/04vbo
         fP0KB8ImOGs9O1UUR1sRjPeHm1CHMHdcrnPHUBIvJ2fIsxyZdHQMlo4+zhtDzeySktrU
         pCUS1e0oI+RLPlDNmNX8Rfw7zmB8fc8amhAeTFxU5SR+t1Zb27N3UQZugonFPXNiBFsP
         uKiRYouL2QgPGoDYV9uzS9e+fDeZmKjYZOt5OsVh3iVRu/RS3qQTe+cal8DZd6hcLa+2
         B4XlU+gYMLwLrglM08ZbCDyWnGmXB56Peo01kumU/RevmsUPjiYRcU5fW3sbB6WWlcHa
         uo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558559; x=1772163359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nt6vgi/ugK6ilulMXdoJ0iyfQKJZUeMQJfjUYZUE7BU=;
        b=e0BCIoNOqvVvROSPoqAwkAqT+mzN8xNF2cdQatxnpWrbT7v09fAAVu1GKL8c4wtymo
         wq40VfqMmUHOdGXWd0VrKi++g7CwzsWCAMiwYdN3SRbqVBMF2bN1/HK/12kg88pjXEOL
         W+YjcqgPIVpBm/ivbB5e4WsHPLzWc6kq3wKWbhFIhw/gIMaQHhPZVH7tu9NNSvMKxIQo
         4W0Grbu+F3tclPfwHTSnvbWES2L3EH8aJuXOy1Stttq5jn6chDhKbe6KBmtP6vC5EcIb
         3aLE1Dh69y4q/e5banpdwOBZfr/TQzHNPZHxvAC2gTTtS7fve2kAAwGS3COUOgBGWGy3
         fnKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJnydzKmwZ3bDHwS3E/zte6sci4KyHid+71geDOBP6yMMF3ZHkgts87TpQo43d4TROq9uosG7louaIGe0izjgx6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqi5UXXbZTATbVSkfhfqArBV32Qt70e2+OuACYcm24DFstU8F
	pdlH9yi1JkasZjGfR7yBceSHH8h9rDy1ilmhUcgqBquPIb09KUS6uB8k
X-Gm-Gg: AZuq6aLh9/PTc07JEWcoq2D4bukhFTu15NPDJp2hR4H//N57Ucn19Z1t3XD1R1oeM+z
	HRlD1VRUXJgErF8xiddED8DYn9dFADaQk5S5IcpHGzng1YDYum4E6kwoR/TQANum6mUk/PFScne
	EFuc/YWN8/O9w6JdtVVfL68CR2TMi3W0d8IjhLO2GJEpPKyZqxWsfD4QOLRqXkmJJ9adVGTHRu4
	vDbg07TTwKNLfaOiHzjiDu2VnQ35ThrxMGEviDfBG7dB9lmG/9AUTVeg6WDYjW4QVAX7aGGDbAp
	esXHubQFO84xyQOl99BpCQESChXEdkBk6MwG1kS3i+e1aIZb1AIYKSLeUbNhhUtpFLPhLLfb0R4
	m7ETYEkewxYqWOMW2/m/t3Zq9ZceProS9Ub0JqoLw4tyDWTHMOUw9D2mrkC1gkIcYHjvVwv0C7j
	gS1LdnxRJtPwIOOaRtUveAMrOo4obC8tmIaRaQ5iTcfKiUlGAkig==
X-Received: by 2002:a17:903:1aa7:b0:2aa:e23c:2697 with SMTP id d9443c01a7336-2ad175b1491mr182585685ad.57.1771558558897;
        Thu, 19 Feb 2026 19:35:58 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 19:35:58 -0800 (PST)
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
Subject: [PATCH 6.19.y 6.18.y 1/2] drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
Date: Fri, 20 Feb 2026 12:35:49 +0900
Message-Id: <20260220033550.124346-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220033550.124346-1-aha310510@gmail.com>
References: <20260220033550.124346-1-aha310510@gmail.com>
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
