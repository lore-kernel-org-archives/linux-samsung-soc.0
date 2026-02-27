Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BCC362154
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772168408; cv=none; b=uWpeLSJuaYG2E6+0KrBNLZnpEG7GsdaZlSF6t7MMBEQNDJW6omuRSmk1X5NhltJXreKru5F8kX5ZPoEPXRr9TbwX4Zgs87slUbdPPbRgY82RUlJ71VesDEyMoF4lGmu/oUjUXP34nZbKjXbmDe5jnty2KCtCT0DxvFlYWtevBu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772168408; c=relaxed/simple;
	bh=sBdF7+0u19ZP3gybl8MNQCA85kIrnAKsI6e62lko7KQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CKc2mDkUbTRtuXfm7VgGTAf0G6c8pv7Szbc6xkA54ybaq42U8Kx2li4QDnhnhHge3xPgbUNi+zZ4xyZXJiKI6qiFt05wEvSRp49jBjInpeqbFEgk6WB+JFtwepb92+b5/fSjqbiOCC50YmuSn6d0vqKqqskeJp2zfrOhfs8cnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dbo/Pm2d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dbo/Pm2d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82747396358so580802b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168406; x=1772773206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=Dbo/Pm2d664NpiZnwBkGplOx6gWSJ+aoAQouNS7va3kA5r/jiMGDGszNYeUItENnwR
         pvtIJ0EuOvXZwBsothd9V/LTsqmjfPLmumYnCGqGqPf528DcuVtfI4U6pCq5H2TFquKO
         Onkarz9Ew+TtPACbpzgtjc3SghlKUqxKUyh5vRtg5eT7EpPW9s663oavZ6JA1N22nuhF
         GUPrcWc+4LymvaeMt4M9d9rZN7VZd6JRX9Kv6nFlGhqaRgM4LGHtTp8xzWbgO6stdZez
         ktUD4A5TstYAFkT5QQCqdq20ltZUIBELkD30JFkmpDLNE1ayje3/lh0Qyrstfd+z0SLW
         HCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168406; x=1772773206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=p9LAAP+Z+lDS1MFznOE3iXxGN80mXaU2/ycSEi4T0ghRBEBFj3f3fA0fovs3V0PRPx
         nRTWjqxAKss7TtJh1zS5wKvojJBpw5QyCvSklD3Yt3KX7W/dkzrFkSIYJJCMHbt5NgSD
         NOR9wc0z45xyUBb7htd3gWykzTyIVfl/whCUULgkOxcl94RJKkQ6Z6167hVYeGfZAkQQ
         XZizThexFivqi/TRtfRU6tuMxYyhmug5fawWLoxXVCJW8fuj962E82iOTCOWLgf/qnaq
         9tqHtXrojZ8JRSNhO1HOJlkasTnUnkSi/GCTk4+MA2aK2WrF7y/i796UFRH0MvHmxgIi
         62bg==
X-Forwarded-Encrypted: i=1; AJvYcCXkE16Gv/VPnUX61Fh1NoNJKpmXOLAtDZP9Pb4e6J0DweDt7oxWnUDrPUAOxY0qamlMkJ2Xx/E7lLuciID8WzCw/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ866QXIal7UR+ihcWl2PvLRUAhObvjKN9WYjuZ7BIQey4IGY3
	IdNKvtFa5ngeYsgrGkxb41oNdqi7IMfUl0rxlPEFrd+GWoaMWABS6jxr
X-Gm-Gg: ATEYQzywvJV45ADhNiXbEMrL0w/jelwH7vKM1D2YygxTsefQ4qnmk2Hg9/1SFWDgbRZ
	avmkjyx047vRIat0ByswTkJI7RLmq4paLMvvZd4b8frRrF3qciBPvAz06D80wc8OTAfvbwycebe
	mikZIB96iXqHU2nzzf1gxBPzdqtuLV5ZYNI/JZorGiG5xFjB7RZGA3XspXeOLbGRxIEQ9IPVQ4R
	kx+g0M4FdvikP6TrF6YCf+MAffJcp93w4OFFKuWHvXWWytXCA5t00yCnYEHUz5sqaLb3UU59FpQ
	w4NSxDuNk5aNgEfYG1hDtPHjyizoF1UQIr3IMlxASGsNTaS7m7baRA76gt/vaCicuHVs2tInhm5
	3A6E98sqAVexSQzhKgE1zp7/OEjvPAqs6bPJfs6i73mOdKvMPsh3cponRevQJ81CTxjn7W3vMgx
	zAURT9ea+WYw6ONyctTjXhgdTHqweeXesc17Rg4pATziUcPC1TBw==
X-Received: by 2002:a05:6a00:7615:b0:827:2a46:685b with SMTP id d2e1a72fcca58-8274da07311mr962288b3a.46.1772168406150;
        Thu, 26 Feb 2026 21:00:06 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.21.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:00:05 -0800 (PST)
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
Subject: [PATCH 6.6.y 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 13:59:53 +0900
Message-Id: <20260227045953.165751-4-aha310510@gmail.com>
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

[ Upstream commit 52b330799e2d6f825ae2bb74662ec1b10eb954bb ]

Exynos Virtual Display driver performs memory alloc/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 43 +++++++++++++++++++-----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 576d79ebe9a8..b7eae2469b31 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,15 +186,17 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
 
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/* use fake edid data for test. */
 	if (!ctx->raw_edid)
 		ctx->raw_edid = (struct edid *)fake_edid_info;
@@ -202,14 +204,21 @@ static ssize_t vidi_store_connection(struct device *dev,
 	/* if raw_edid isn't same as fake data then it can't be tested. */
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -244,11 +253,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
@@ -271,20 +283,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = raw_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
 		 * only if raw edid data isn't same as fake data.
 		 */
+		mutex_lock(&ctx->lock);
 		if (ctx->raw_edid && ctx->raw_edid !=
 				(struct edid *)fake_edid_info) {
 			kfree(ctx->raw_edid);
 			ctx->raw_edid = NULL;
 		}
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -299,7 +318,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -321,22 +340,24 @@ static int vidi_get_modes(struct drm_connector *connector)
 	struct vidi_context *ctx = ctx_from_connector(connector);
 	struct edid *edid;
 	int edid_len;
-	int count;
+	int count = 0;
 
 	/*
 	 * the edid data comes from user side and it would be set
 	 * to ctx->raw_edid through specific ioctl.
 	 */
+
+	mutex_lock(&ctx->lock);
 	if (!ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return 0;
+		goto fail;
 	}
 
 	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
 	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
 	if (!edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
-		return 0;
+		goto fail;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
@@ -345,6 +366,8 @@ static int vidi_get_modes(struct drm_connector *connector)
 
 	kfree(edid);
 
+fail:
+	mutex_unlock(&ctx->lock);
 	return count;
 }
 
@@ -490,11 +513,15 @@ static int vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
 	}
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 
 	return 0;
--
