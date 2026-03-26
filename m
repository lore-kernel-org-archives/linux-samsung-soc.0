Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A949378D96
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518210; cv=none; b=DVab5AkqjBernKSF7aHuMMvgBzllX1QjX7ISHod0RMt9VkRXAUjzpj6M8AdtT032AyY/xL4XWSEo461C5TfuOGW6lvwvU14tIXVYhZ2tc0zED0qk8EFX3eWJ4PVzvrMJGsH4MvWNYupKQWkysSFoQsomgmqaCMctnmm5/2DzacM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518210; c=relaxed/simple;
	bh=1EWUza6jH80CPiuMwuS42qOsaWv6H56GLW3bXTMETUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPHtso0GlV1+0uOPO2kvmTDPodOr9cWcckYHZUCqCiZzR/Yh0DDCZG1Qu7a0QonlHmVXAGvymphWH7rxR9iBljS9/J3cFY0XkxgSPRKe8BOumyjjNl6rwqQf9U9t/anUn7h0yCjTPdCJM37kyawulX9gibAGt39EmRMi5iARtxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bnKSYDym; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bnKSYDym"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso509904a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518208; x=1775123008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCaasFgG3bKwmDmNR0xzReU3+wYjKSaL6CIO2mNwHyw=;
        b=bnKSYDym0Pb/xaZb6QKMzkRNa4qAzZ70jMtkKwB12OWlQHtmeiyTFhhRO2TKwU2szx
         8Hrx+YccA8Pq0xgAsR3AJFva3QWhHQG3YRiseA8IBQDRyxgEJlV+Fwo74kzF0mK8oKF4
         8gPduysfANUkNyXUBq0dum0uDc7jTK6iK8A8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518208; x=1775123008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nCaasFgG3bKwmDmNR0xzReU3+wYjKSaL6CIO2mNwHyw=;
        b=a2iAG8uFmJrvyv7/LC3nRl0TL9lMZUPsWn5ypqdzSDCFD2uh77hFom9wfc8BeDz/rp
         Tgw2U6QuXiw8gI6KR+SXeoS0EOmBq/RJVPQSLRtta/dqWGYGK4q/gcVhqwXASbSs8vxc
         Nvz0SDiDyVcghG3baGutYV+2afW8ShrmZguY6D3wQqjFSPRwkr9rq76Q8zya/m4LFpM+
         2b2MqjYorfSmIp9DbkQ2g8UgkhkzTcO9Ii4E3rXEqCvFNynHOvO9mLh+NcO0q/Yp91pm
         PWlRcLvQTJ12xAikJtPvR5C4WrIBfrdAl3qYeqNCd6lPLb4snHYJ+1CMaBD6mw6eISA6
         PD7g==
X-Forwarded-Encrypted: i=1; AJvYcCVpqNPBVHa6DQ1vx9MX6Fu62GQPKSvrzaoFguMU26ByaK6pT00hKQt8g074VmTWSLHWTCHjUcOiV3zn7yXYs81mWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvwqfuwVOSYwQtHgwARi65ku19G9lWB+I30yz6FghBuR9U+SnJ
	BWy0WpULqahc9VzadWO405wZgkulQVCIgDOq0p85r6lmSRASb9I01+mzH/ropRuZpw==
X-Gm-Gg: ATEYQzw2+eWyZOSuOvWamOdUFRGhwu1oAwypm2IVQ3kmCfp9TW2c4DnXD2so2sTosjE
	bEl6DervCdr8OgYNG/ybylt0DhpwHddnPLjKYO91TmXRrjtccuPh2HrdH5+dm6bFj9Eiua0MqBf
	UKGQYztnNah8+gKLmXZiDaiMaLwz29QZtvZWQII+XAfdrNhby+DL3zAfN2Wa4AzKegxT0KuJ2W2
	XbZD7/PML1CF8/sigPsSSZoHDLFPgmB3zrv96NppA2QDqMqud4CWmUFVwiLGFRDvWwCib5kCwzB
	T0PFh5AbyYhaHnjf5HJ6/yamUmZ/CJ/2b3qm1WIHUQ123Nk7asRBjwWGCa/CGprFsaQrxC4JXjc
	UZoY8O+I7eaDd84Tlz0F7SDx4SVgUvZV7D/jUZDi9W6CLjwUgcdFz0ZOz7W1f8bG4QtKcqxXbPs
	rDs2mZO3eGYH613zz93M4QhseAke+C5tWKA+QNp6N1wgLixioYPCl70TsN/LoXG99AThJM73Iaf
	6Nz5Ixm
X-Received: by 2002:a17:90b:4fc4:b0:355:35b0:8b78 with SMTP id 98e67ed59e1d1-35c0ddd9d68mr5978607a91.27.1774518208424;
        Thu, 26 Mar 2026 02:43:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:28 -0700 (PDT)
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
Subject: [PATCH 4/4] drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES
Date: Thu, 26 Mar 2026 17:43:06 +0800
Message-ID: <20260326094308.1161335-5-wenst@chromium.org>
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

MAX_FB_BUFFER refers to the maximum number of buffer planes for a
framebuffer. This is the same as DRM_FORMAT_MAX_PLANES, which denotes
the maximum number of planes.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h | 1 -
 drivers/gpu/drm/exynos/exynos_drm_fb.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_ipp.h | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 1ab7195d09ae..b126cd129944 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -19,7 +19,6 @@
 
 #define MAX_CRTC	3
 #define MAX_PLANE	5
-#define MAX_FB_BUFFER	4
 
 #define DEFAULT_WIN	0
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index 125b87adfdc4..93f387b12126 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -99,7 +99,7 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		      const struct drm_format_info *info,
 		      const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
+	struct exynos_drm_gem *exynos_gem[DRM_FORMAT_MAX_PLANES];
 	struct drm_framebuffer *fb;
 	int i;
 	int ret;
@@ -145,7 +145,7 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
 {
 	struct exynos_drm_gem *exynos_gem;
 
-	if (WARN_ON_ONCE(index >= MAX_FB_BUFFER))
+	if (WARN_ON_ONCE(index >= DRM_FORMAT_MAX_PLANES))
 		return 0;
 
 	exynos_gem = to_exynos_gem(fb->obj[index]);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.h b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
index 67a0805ee009..2842c8af0b7c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.h
@@ -70,9 +70,9 @@ struct exynos_drm_ipp_buffer {
 	struct drm_exynos_ipp_task_buffer buf;
 	struct drm_exynos_ipp_task_rect rect;
 
-	struct exynos_drm_gem *exynos_gem[MAX_FB_BUFFER];
+	struct exynos_drm_gem *exynos_gem[DRM_FORMAT_MAX_PLANES];
 	const struct drm_format_info *format;
-	dma_addr_t dma_addr[MAX_FB_BUFFER];
+	dma_addr_t dma_addr[DRM_FORMAT_MAX_PLANES];
 };
 
 /**
-- 
2.53.0.1018.g2bb0e51243-goog

