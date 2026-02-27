Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963273DA7D1
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 05:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772170411; cv=none; b=TvTdyL0CKutHCKjpSCRrTG3HTD466fjRAEItrhq2H9DP0o4rpFsFqnCuG8z+C2yTnlWV1hFAbHeHIdl8H0BJEYIrfdMCW5vst4wTfMQo3a86wfv+hDZuWJ6jc5Y4Dgd1OoicF80EsjoOBSbvJa7hMD2FJxEV3hrEFP/3DH7n/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772170411; c=relaxed/simple;
	bh=sBdF7+0u19ZP3gybl8MNQCA85kIrnAKsI6e62lko7KQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lvK0cQG07oze9wHPeLiuXGmm7C5V9MAwNitZQGPWgeVZegoheGDSkJyBY+iiu0WneEHxouf1+JfUBBF/HOSVmp2PyGpg1skfkuOHgZthb5e93WQpFWXMnTeYUD/huqT5YmcjPo+YTxYA2N0EFXYGxqmUgpBc2jcVJm2Iv5B97f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu3G09PD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu3G09PD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82742aa5a3eso677881b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 21:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170410; x=1772775210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=eu3G09PDfZM/CBVYSo37kRoGQWlPRsP2wJQ+2n77iIRIKoaIRqCdEfrSsbKZ5GFR7q
         188fJYw6BU4xOHz+C6a8jHt7EIKyQD4Oe6Z3Iu2GL+y1yko5dv/dFgojljI6IlwJsHqU
         8VJHvMTB1+vGu6E32DOhqkSs+SuUL2H30AkBYEhI8PzuCdKzeNNCEBulnJweM7VzQg9U
         bjkKQ9MA2lXhSFbM1SM1hcPuWE3Na+a9VAyqNMpjYU0WT7ryKNSc36C7IkFPAXNje3sh
         Xrjpwuwn7AHfqBsUc59XgVdy90vHEHxJpmOTmiSqBHWyA6iyum2enJOWImoVKvUQ/A7E
         skmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170410; x=1772775210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
        b=hAQHSIkOwvo4yVxsT0HR7s9kM5nGnNwH7FARfrMIHw2h6UG8zCeUYIZzE0gGmSI8ED
         33mZRQOeGGiabljBa12jmrwNNDeFi4KEA7BfqJsec7QN+LrF2q4KPaiqb2PdgvkgJU/r
         r2d3IkgDVvyAYt9OI141f3I3khSSa3MZ5xYRafaafAg/oogtjbiHieA+zimhiB8bY0Xb
         eaNepEWRVdx1bmndA6NxGfh9EJ4Nhw2jNL3qDHR0dSGnj4nUTyXi8LkXgoeE1wlEakWc
         9z5JRRJrL2YZvd4cJ90ysp/e17j1yd0qy29cyarOpO5Uu7TfYQwlh5Zx04Z2mhtKJdam
         cZQg==
X-Forwarded-Encrypted: i=1; AJvYcCVcz/fjwpMVV8KbtXXBBgdmQXleTPceZ1wx4FN8BP9Eb0yV4o55J4kpbXN7BO3ubKZQIifC98qBdyTFcOde9e7qvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sda89zDtJ/EiU/vASTiEqmMNs4yBUIceeLkS5Sf9RJAp3Khj
	N5pjaOAxjns7UpE8tlDomprIWiIYE5pHvNVbybKlp8CzN/9lXbJzFa09
X-Gm-Gg: ATEYQzzHJivcvMGUapxFVvO7a9Tx7CHUhPrLyYzU6uXVn1Q78OS7vPSnfLBf9eBkoba
	is1+/3+jBDwkmIbAFZD9fJPJ+bEFpmNkD8p6EMqYMI4W0sHLAi5MnsfBOyP18gznJ2DX5cW0AHM
	fB83QAOXh7NzUFrBByP+3w5oIOWaXxieyS7PmbrYz8Ie8sxTjLg5VKrnzq3rgoIC6BgWEXYuDtX
	7eraRyJ9OV0mZ2a8WDt/4993nCKBe/ghKBrhOAhN38rLRmr3v6pmCF5UKO7IOBDcI2M/+Vq4S5n
	fTKmTjhHpqELMKNwdQ5X4tW3lgxwQOtM2RX43DBdEkuUglw/r9/2J9w2qdBVXIM6pkfsyY94YzA
	J3M5ySxYz6vohofBPvTMiPWM1LiqSb75rePn3JZJxwK+1EW0NNsHpwGS6rhFcBuyA71ZjSddkOV
	Onn+c01AwULC6lNo10F+dNsZQigcvQr+xPeBp4THBZX7DPnze+Tw==
X-Received: by 2002:a05:6a00:4c84:b0:824:9451:c1e2 with SMTP id d2e1a72fcca58-8274da275b4mr1328637b3a.59.1772170409864;
        Thu, 26 Feb 2026 21:33:29 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:29 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 14:33:17 +0900
Message-Id: <20260227053317.426000-4-aha310510@gmail.com>
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
