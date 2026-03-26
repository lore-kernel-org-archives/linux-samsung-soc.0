Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADA036DA06
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518202; cv=none; b=aheAJzhzP5SadyRqNa6tKlhiitINxJ0VvjplIVGvhnrYrCp2PS/xv+saFeaKUJFcJaGDm4iB45ESbGCqGrZuPNnny38/8MDQjeYBrf1GrnUSbT8YjPA2bu5Z9P0kDuVr5XEQcJFu3B3wqgmruldSXZQRv6Sai9vrD0/Z64aNRVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518202; c=relaxed/simple;
	bh=YPVQeK/LuVOZuty8xE05aTibITNefqVN2pKG9CkHKds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMW/Fo/i7P52MIsFBMnvARJ4JMRL6Uiru2hvXR0UsEzyxE/OvB/2wbE+NzXodwRBjJCk8XF11n28RrHco9vBlsr4ekGkY1shbUhXb3x7bim5m47uPl1I0W5bhegL6CH1RMNA+N2AYOb2bjwAmorxwKYKaucsYkpmizyqZdtfykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nXoLgAQk; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nXoLgAQk"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c73c990a96dso416359a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518200; x=1775123000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKCyFU3ic+mjTuSY0uUxaZ2dkgAoaG2cSvjjvcWGNkc=;
        b=nXoLgAQkvhMEEqEZY4KCWklUf6Uoc23UZjZj9LBnTVVE4xjz4r3pw/wYvJA6suOWb+
         XG/BCO14py8lM5nJSD9BGHwmNT8u9OfB0WZiqo/o1eb/C+23s2Z8jVA+g3rNCZD9dar9
         ofmoejDZlB9Xg7pi8WXdJW2TEK3/a8ss9F2Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518200; x=1775123000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKCyFU3ic+mjTuSY0uUxaZ2dkgAoaG2cSvjjvcWGNkc=;
        b=K1yLjiWvovrpz4sQuBgP8dcydvOSyMYbeoRn0FZ88ymgiJnRBh5jGUtNvym2wNMgcZ
         UVg/mQdjcWXvkbgfz53JBf7KDgQ/KirBvNwKJJK5jfxR0KzfyMe1T8tdE2JCCkPCgIwe
         vim5TOIU+3+KE9i4C534TL5tEG5d85HleD9nulnfebJjWxrx9jMO8L7QtbTAKNfh7v5F
         mrtU0XD24h+XTtWGaxHVwyftHWkw1wSy9tJ1VgXwZTBr2PqZtSgbREl5doNIA0gzCNNZ
         IhYm27KchZIgF0zcmdWitgcZxGEvVVe1A0FMI38SlAETuRxfdZUV0qWJqBHcuoDjGyh/
         PATg==
X-Forwarded-Encrypted: i=1; AJvYcCVNEpEfP/BfFWOLTr4KMc/YfUKSu6V4kV3uRrR28L+WYE4JQ5qk5LpxIaAI5nPid6f4SlSIXVO9JQzjxBJLc96Vww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2ozIEzI1rtlUrfjxQkJNO3nvsaxRhrEmB1OuOn6R2209mtz0
	yyy9aW6DwAM2EC0z5QJXktZ6mdX1c6JQniBV+KtdV3GapLNWLLkfTjTPIeqjlgNiAPc4KSsK7QJ
	eKZE=
X-Gm-Gg: ATEYQzzbnpr7U0frZYWqAv3fn8x4WjtgJ/y7Odu+03kk3eJkOjIsYNRQsGtdV9W094E
	O9Z/xsS8ayCnqEy4K3tK7p4FpIIieQi7zxpAXClfgQHKVZJj4SpVAk2KOy+5Mqd/EcYtAXYOUcZ
	B6bvODT4oTAXXI4BipJ656RpPs/EumvGnw6vUoPQ8zMVWDLEQNNarbaxIuVCRo0LJcyAlXEfLFF
	9CZaf7wm6O4lXiCb7spql5BDJ5v4yUpAvDKtRwH3mMqviEDHuMqQjcW7X8x3SEKN6hsNOKl0xQF
	stZzS9XhhrV6ooMbyoDcJrjMXEWV2vwM1b9OPrvxW9bqg0+AomMAeSS8surGeo3MS+y6IxcxAlI
	9Ata7UttItZXWgIc03+KBZ4VXq/revIXeuFhve5PcBxhTHdSb1xxfn4gMgOXueC0Q6ADqFOnZP6
	3mPTuVFVmap5j29+jscq0kaWFbvFOdst+tarL2mTiKu7xyoHVze5i7jA2G2q9yB7pa+nQ3QcXz/
	liLcHGCSaxhNDxX7+A=
X-Received: by 2002:a05:6a20:7491:b0:398:9379:d056 with SMTP id adf61e73a8af0-39c4abeac6amr7815749637.16.1774518200463;
        Thu, 26 Mar 2026 02:43:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/exynos: Internalize exynos_drm_gem_free_object()
Date: Thu, 26 Mar 2026 17:43:03 +0800
Message-ID: <20260326094308.1161335-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
References: <20260326094308.1161335-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

exynos_drm_gem_free_object() is only provided as a callback for GEM
objects. It does not need to be exposed to the rest of the driver.

Move it above where it is used and internalize it to just the GEM
functions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 69ef6cda1ce9..59fd736a1fb9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -133,6 +133,11 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 	kfree(exynos_gem);
 }
 
+static void exynos_drm_gem_free_object(struct drm_gem_object *obj)
+{
+	exynos_drm_gem_destroy(to_exynos_gem(obj));
+}
+
 static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
@@ -318,11 +323,6 @@ int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-void exynos_drm_gem_free_object(struct drm_gem_object *obj)
-{
-	exynos_drm_gem_destroy(to_exynos_gem(obj));
-}
-
 int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *dev,
 			       struct drm_mode_create_dumb *args)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 79d7e1a87419..8b5bd20ae8c1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -88,9 +88,6 @@ static inline void exynos_drm_gem_put(struct exynos_drm_gem *exynos_gem)
 int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
 
-/* free gem object. */
-void exynos_drm_gem_free_object(struct drm_gem_object *obj);
-
 /* create memory region for drm framebuffer. */
 int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *dev,
-- 
2.53.0.1018.g2bb0e51243-goog

