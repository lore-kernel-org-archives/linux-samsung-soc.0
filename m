Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478C347517
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517463; cv=none; b=pVYtPWMYAWVmgzj1v2M+WsjJccAQnKOTC1LO/dgo4JwcMx7YRQRlU9ePDh3/kzEmP90U7axfQtBaP4gtxbHcNZZKF5Rqxcqw80bQMCdbfvEGpoHkwaANBFvY0R2M1Y7ULGz/IepFRvvD4LnNRJqQTtIky+BEqzv+bK4mO2ljDsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517463; c=relaxed/simple;
	bh=1HwJcgqbQtJaHyijuPgBBJGbFqao1zPIMX+6+xtqMYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBHVg7TZyzM4nlBcUE6Bd8aZF9AJ5y4nwTm1m0lzIyZFIWnbqXjI7vRVKEpf/4f5dV9c2J3ehSJvllk1S+tC7znbu8YC5Zml5syyX+asHj1czu+q5qhRpkEDsYUVAq5RwJ+7Z4OQnSLu1GUrQ8LnEpv2Vi5jM8XC+mlSa0WlWAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=efeRDYH1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="efeRDYH1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82c68339cf0so1239694b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774517459; x=1775122259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhfnsBmjL6PTqSJ6d1w99Feh6f2YhYZjbZMXjyNjc+Q=;
        b=efeRDYH1iKaL55Gn31qtyqsYciER1So583iyEkbicGK/2qvIPEDQR4CnmX8lUvxswb
         +n2YIF3xWxwJ9HZbdvsTQS3OapLOW2J8Lc7y2eE4cahOgrwJYWM/wmS1wblEPWrnyB5j
         7Zy8DZDeJGiyirwCEIQkxmrelLFp8nInzGw8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517459; x=1775122259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhfnsBmjL6PTqSJ6d1w99Feh6f2YhYZjbZMXjyNjc+Q=;
        b=Ij3WAh0uPJ+9qq/F9zxEliBStcwh7Z4i90Ue8NZFmnbkT1v8vvI4o68gR++AMLdFYA
         wBhlm0VwhsTU5eA7DSgUGsw1/P3ny8fZAaBFtAPnLs1Xv5gRseipRk2SdrWoJ/YfYyQK
         lnvawjkTNRxkhqYlHTJd11oqKfOuQ6ESQF9gbaFkEodcOV/IMje4sWezTH2yZ06rRNfM
         3rPRgMO6cPeb/cwXpZrBFk0TErIz2g91UM/smSVEm36m2zTe+NbkAcPIEJG5aZhBdjVX
         ZN2nUPSHFXgwudrjISYEqr/WDNFNVLr7DozAk+cSGwUexMMSuWd1uN7LfDRXoRgN982V
         6eEw==
X-Forwarded-Encrypted: i=1; AJvYcCXfRdyMNLwVAAPQW8mdsr/U0qUac9tSjo1mvhfUYmde84CCGvUiKkKGJpnURNXu0JN4wDAGICnLOl/7cOoYtP3d8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Ah2Wms2ipb8IDFNoIA/S9ZyRuf5yBmpF9Dd2Y3XEbkf7T1jN
	nvNw8yk+6uMaJdO9wAL/IQYdO3ExUOi3HaS/fsqSUSdCFAllYUIKcSWRoChQ+Ous8A==
X-Gm-Gg: ATEYQzzHaRjMSAi7pYTFqRZY/ZBF3I9zcSfcs5qwEiMalafM+nF/kucnHHs8NtuNI8E
	la+p6VOl0L0ampnaUKmmWFcpB/P0/BFVXuhx3PRf7s+ZxsRa74byhH72AnqApKhuEEYZG/MiRbP
	3Je5TL3NejJbjNA1UXexzITcTuIG5K+b9++MmzNzPJr8zBoNoNapuJ/uWvY2iZ6AnjO0LeSDdXQ
	GaOirOWP7sFYVGi1+oM4wiDkazKTysLogqxdM3n0OM3X46AEP2ADuVPuq5fYpwrp8+So5a7eVlv
	eHvThu2HX6tSi2Dba5zoBsmZLDg2ldOTNZnkEx+jD0r1URXN/kuegWbE2Dk3WXfUM1aw2/GU+tc
	2nSfTgNR8ae9axId6+elsGSuv3gfqX8i83lfRu70nkEZj5OvBd83GJ30xy12O4Z8Rr9nyZzEWIg
	FxM1cxLVyvvrexF4FBbwt1YVqQio76HpmaqF6Xju6lsNd4B4EN7RFz7Fo3eM/gRTvX4mOyypmCi
	mJvK3eK
X-Received: by 2002:a05:6a00:2d99:b0:81f:ac1c:709e with SMTP id d2e1a72fcca58-82c86a1e9f4mr970524b3a.31.1774517459022;
        Thu, 26 Mar 2026 02:30:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e1502sm2130970b3a.5.2026.03.26.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:30:58 -0700 (PDT)
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
Subject: [PATCH] drm/exynos/dma: Drop iommu_dma_init_domain() stub
Date: Thu, 26 Mar 2026 17:30:38 +0800
Message-ID: <20260326093039.1152770-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1feda5eb77fc ("drm/exynos: Use selected dma_dev default iommu
domain instead of a fake one") removed the code around creating a
custom IOMMU domain, but forgot to remove the stub.

Remove the iommu_dma_init_domain() stub as the function is no longer
referenced, and was also made private to the IOMMU DMA code.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 6a6761935224..ccc6b852ee7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -23,10 +23,6 @@
 #define to_dma_iommu_mapping(dev) NULL
 #endif
 
-#if !defined(CONFIG_IOMMU_DMA)
-#define iommu_dma_init_domain(...) ({ -EINVAL; })
-#endif
-
 #define EXYNOS_DEV_ADDR_START	0x20000000
 #define EXYNOS_DEV_ADDR_SIZE	0x40000000
 
-- 
2.53.0.1018.g2bb0e51243-goog

