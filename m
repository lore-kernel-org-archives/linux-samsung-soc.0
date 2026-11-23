Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418998;
	b=0NvHLeIK6OLOVGb7Ppn7g2kamM1qyLpsqO0SHSohSGj9jRRbqKeL0QJpC4VxJkc6AUW0
	 xEzJvDOZb+uAvfT0lj0O3YbQIqFzqJZ2+n22UMuBNhqOGEUwbbJC8uBdywb6yuVYBXPJK
	 6tEK/n9DQY5lUWD/KuKjG/HHOIg1AhESOs9UGF43w94eIulfTxImTVuBPPrhXMTqs25RL
	 UCbOYDrmCZOrFy8cmcQT3APqzquC699qVryVbyVI2V61ZmXIfjvz88wPmYgcwUJCfr2ln
	 pyBqha4wvzja1T20D82T0fgTc008vEIybkrWNZizKWwH+GUWBqDnVUr3xH3J/pSow6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
	b=c9WmhwroRsIXYR5E5rKkqP0PgyIdAuIYOIzgplKvyyg08wA8Hwd8CCpskwjD+Xgn/1/o
	 YCx2SQR84y0jgdGENMrd+dg7+5l0HNp/Mr07BShfQe+6UmThtsrvXOajmoFKI6FgiJrOZ
	 M29ubtIUyfHbIWfjsy4DkmOHGf0bB1pqMroy/5KblNbiflUG1V2cHit8YMnxUWRxCWSEP
	 DvS/wBQI1z+V4BfwK+o4mSb8t2t4dg9cB6/rQ9LWHxHXrmD3KAoRsTaGWGHclSxVRnLdG
	 6s35BCH6Gnh2V5AAWlSp0Dmv3gIBZE3KB3awCRoowe0UdnPabsu/kXZrI7E6yH8A6wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WL4kP6bM;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F5C606A31E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7F5C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WL4kP6bM
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04fab527eso20685545ad.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Nov 2026 23:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795418997; x=1796023797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
        b=WL4kP6bM2raCQljHU/wXFMSLVTBfGCh04rRukYmX4M2OUmGUw66pqbEdwgY5RX9YIs
         z+I57ja0QCaZ+QirZilREJEWN5Ed1YEGZp33Rmsb35AEzvXDAUr3/9aiAFMdXSrvREnH
         1GcZchA0DLN2j1/FS2Bd6AgIBqsPUC4eX+ryw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418997; x=1796023797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//n+yXTTWwOoj53xnhWaCufs+Tzw/vagwNxTFu40FWk=;
        b=CSmsXEyQ34672DcOGDTy9LOW9O7ZL2YtU9mWkhhua5S3huGcV9WgL+IHKdg8M1d/Ap
         0GtFCuypwLGD9/GmojBA/ZbJI6qm/XdjOJjTAuQHXx4YUcScBK3gmDG8LJVLsf0I6s33
         E/8dI6FG+SyFGxR4B+HMDqTOIFygiGMq6Vo7Fjwsz71CarFODwPLuHPijsm0w63fIWyr
         nOwIudwHnzR37UXyHQ7hsq/NwjwuYNsw/ZqJkcVBEnWyOoZmsu9JfrdvgETZTnAdnFvc
         8Pg+8xEhIByU/dAOOywe+qtIRQUHFzwlWUOYH0IvL/4OBPQLGKtqN3xL1aF0RBgm0Za3
         VPDw==
X-Forwarded-Encrypted: i=1; AL+hErFrgF5/F+K5q8bfrPqKD+W1XzbmmmPIuAX4JqzlcIjvurSnnK5bd93ESrvWA2MLILPu/Lm/sXy94wj+fCtxsVI+Jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/WuXy1COzZpY1AFAKe+5MnDPBqyCmYGt1dR+UHV+fTUiK55AA2
	yaJ+7xkcca2TGb4tYKnB3X3lHqOinPrpsqvlS+JPyjg5JmAAgdYV9vGGZUOXaFTE1w==
X-Gm-Gg: AZFdTZfJI7hTjAWWnbOYsJli/wzDVqWwZfDk23TFqoA6SNVroS+BgAixesx4QmhGzjh
	C+z6usqfgvdzklRnI1AlBRnSIKWAhDkrXs0ZkPNEVAk2ZnL3QwGHJyxuFx4xwBX+aWzfBln+Lmt
	Vb/9+e5BYJlA5PU2t7mt9i7hNhMILCoCVyQ/MIMzbzP5WTU0ep2DrtH0hU7Pe8Or35qCLNIsHcK
	Tyx12jdvINXRLmI3aeP7vCpIku1WPenR/vYbPUeQyyyx7pWOmEpiXAZvoB7Eaf1RnTZ+Ucd+3R7
	YQVHkiXq+Kr+tKLD42poEsDWryY6EO65pB/IvAkOTXu2Z8DXSkVNyhd8flSjmdnocxRx8GjwNu6
	rkFRMB2qhuROUEV4/gikRVGyXE8gYsdoG/uK9l5K03DDbdMZPuHeuJPDz07RCmRCOKZcqDpJKNz
	bNjNA1Z64n6/JiloUlCVihqEl+Ra2Z7nAGJsnd2gDD7R7NDseREALr78jdWcxk06WigYWsX/0f8
	5sFM1u1KS8rrnW64zaDzDMNsWwVLWJqKm1/R2v7hGlAH4Ng4HpnqvfoI1V7qzwtF79TeM+xzjQj
	SuEF7PZCBkQ0+YMFyIH8tdP0tZAMxBEmRurvo2tx8aJyF99UvPPI3jEW76PO7w==
X-Received: by 2002:a17:90b:4b:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b41c9ba0e4mr9010636a91.64.1795418996993;
        Sun, 22 Nov 2026 23:29:56 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:ceb5:5e59:832f:d16b])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b41adcafe0sm17780221a91.16.2026.11.22.23.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:29:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH RESEND] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
Date: Mon, 23 Nov 2026 15:29:50 +0800
Message-ID: <20261123072951.2239442-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent size_t format string fix for exynos DRM driver left the "0x"
prefix in front of "%pad" format around. Since the pointer format output
already provides "0x" prefix, this ends up adding an extra prefix.

Drop the redundant "0x" prefix".

Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 0208c9259572..acb8def747de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
 			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
-- 
2.56.1.831.g720f3f5937-goog

