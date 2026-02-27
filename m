Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0401325494
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162790; cv=none; b=l1khyNEOWevqY/NBJ5n/eATQKsbqz5sMaRqFsvYysSCBmkl3F1foFKBGz7T5HaW5hCYlOudzz67SF/feguzGIGJdmnFEUmXsClyneWpBPzqFfTJFVwdmpDUKG+LJfYja8VBSrhRkDYPnkMkUNCTDTrlz+AxQMPlCJfeF89Vz/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162790; c=relaxed/simple;
	bh=Iqc2katXCByBtCVWsNCwBPkX2kF7j6RU8WUtDwRLKnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RH7e2EaCsPe5o4yhoPT5FPc8wLticUcNCyzSkd6cjFy1vl4Vc9gRAi45uGZ7MT+IGCsbZADXlpX5+Vx84BimMlmvGaVB07a8NXuraL16sOHRrGN3xZpj4yYWp+EKiPbBS3KpAQLatPxHdkdbGF6/u97iwmFeWJFkBzrVd0AK7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Xe63mp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Xe63mp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so805879a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 19:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162788; x=1772767588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l127qV+2+PHMxahmGck2ATeIukpig7iHOGTiow3YX0=;
        b=P4Xe63mpzxy6RzlSZI3Qn+K48uP37iLNhBz/vOPgwIFKEQid+KC+tGY3q69ZCE+Ljd
         0QjG9oILps4kH98Guaszx4u+1VBYYBQh0NMWE8W16H2sER9oIZYRxbNk7VpjYRDNKrBF
         pH1sRQyPmJKdpUi316cBg9SMLgrpxT5ZY7+mWIw2Hua0P1AMmlu4sShR52cKv0Zj/mvx
         GzSZXaMP4R9WI3ELpCP9rTj9MOf8zmM3qXUXuqOAo6ivMzeWxkiE4A1BQkuR3FowHLFw
         8u9YDJPeTAEz8MH0tnv6cCg9nQ8IRyZi62nryasYoL/LScBFY1uvFwe7yy9BS89C86O8
         vVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162788; x=1772767588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4l127qV+2+PHMxahmGck2ATeIukpig7iHOGTiow3YX0=;
        b=mGZoiIEy9VzykoiO3lo8Rlx/SwntNMeqL/1WPGqQMrTrR6BG7JZlLRADwa8Ws192hA
         bWS8Uj6pMqC1NnFCnxYWO7g3s5pPxZuUPf/Mz7Ctvi17PScyqybWLI/5nA/mD05QhQJv
         jX1RAlPNQCZum+c3S5pB+k38wzlCvElocurhX4/C4WVZohTZPEycwAI3JVOV+6ksJj73
         u/DwAUnqs4IuqRALemesepy9pvAdumDPTBJr0FBuY5LQkfe7JYy2I8xkr0/tV2jqXKgc
         wn3KIUrLPOdueFox6H3dtweJsnTBmWK4Rn41Zz2fYK2yGr8NXSF4tqOspF+onzuTnSEb
         5IUw==
X-Forwarded-Encrypted: i=1; AJvYcCV68dRv0m6pp+jtpCZumu90cqohyFxizfJXHP6/npokp1yGnHwL6PgL8vSNULyvTScaTeKPkQoVro/yyB2QSKb1Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNQRi4bvFuFrn7vatUFpt6C6R9JDysJpxfWMrSlQOge6ocQYqL
	80v7kgKEVCtnAuVEIyfIEddI8Wq+yTN/GxNoeerR3BBewpeTNvQxzux5
X-Gm-Gg: ATEYQzy5nEXLlqHR4kVXodD+M7cdV3ne7KueIPznW1DI05rbk3X5z1wxj3cpeY8VoTc
	1chEOW3yYtpkdS7x/tGh4UF89eUfNcvTVzMSWZJtkkp1CrURIFwL0iSFuyVv+zT6fi8NRQhy4YO
	nc6/TNC+F4gAIKF/bzp2Pwmu5lkghBGfBu4xYsLuCUnkbw+08bDhnCMVjyWsmCnOrrcos7FBHnM
	rhs8n82rqi8LK4+NfpE2yZ0dy7/gDrBpgJST4f2oI63+YHQ1y3wQPvrpKYobtd8DH2vNrJp1Cm/
	GCradH4fiECurzPBrvt76okwMOJ8i1L0HY1XABKFIL9u66E0cTvUSooVV/9qwJPG7Tu2Z2rJeW9
	gHw5U18g+/VdgvOhwUyEhucF34jDWfHWQKkAxpauVoQU4bLOYqbocqCgdAvWZvbeLkCVyvV0OTV
	OEVBmk/BASVJuagepsMnrlb/JFtuEohWejvVLvJPWVexDnYCjjIw==
X-Received: by 2002:a17:90b:1ccc:b0:340:be44:dd11 with SMTP id 98e67ed59e1d1-35965cec522mr1364382a91.27.1772162788098;
        Thu, 26 Feb 2026 19:26:28 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:27 -0800 (PST)
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
Subject: [PATCH 6.12.y 3/3] drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 12:26:15 +0900
Message-Id: <20260227032615.108139-4-aha310510@gmail.com>
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
Fixes: b73d12303ecf ("drm/exynos: added virtual display driver.")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 38 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1f9d8873a63a..151a1b43c20c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,29 +186,37 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
-
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/*
 	 * Use fake edid data for test. If raw_edid is set then it can't be
 	 * tested.
 	 */
 	if (ctx->raw_edid) {
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
@@ -243,11 +251,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
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
 		const struct drm_edid *drm_edid;
@@ -281,14 +292,21 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = drm_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/* with connection = 0, free raw_edid */
+		mutex_lock(&ctx->lock);
 		drm_edid_free(ctx->raw_edid);
 		ctx->raw_edid = NULL;
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -303,7 +321,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -326,11 +344,15 @@ static int vidi_get_modes(struct drm_connector *connector)
 	const struct drm_edid *drm_edid;
 	int count;
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid)
 		drm_edid = drm_edid_dup(ctx->raw_edid);
 	else
 		drm_edid = drm_edid_alloc(fake_edid_info, sizeof(fake_edid_info));
 
+	mutex_unlock(&ctx->lock);
+
 	if (!drm_edid)
 		return 0;
 
@@ -485,9 +507,13 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	drm_edid_free(ctx->raw_edid);
 	ctx->raw_edid = NULL;
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 }
 
--
