Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696A3242D7
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Feb 2026 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772162781; cv=none; b=QSZX78os85mrtGP4w3i0UoR4iSiFZr9EvHmXGP3L58aioSnRDvbDYWzgLJZAMLOwp2FTxrtQ3bBc3kUhjVINo/YnV9Jy/OrBwjVTlklIo9DlnGZwIUxynROihVId20nFtv6qMGOYytTjk8N8LwAXTThBv91zYoLB2zyAq1+Fx1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772162781; c=relaxed/simple;
	bh=QWLWSQDE2DlrRwx+dqEKdl3/Tl9WTFbrGA0f4dFKP/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oNgI7KIEIWbo2o4DCTlA/iTleGL+qC2qs0OkohZZQnoK8FeIQS5Z1UFBZu/UBrJHAxgwWJRfbpKYtv3qcWuZ7HWpPGq1GHSDgg74+7JMCNiCeMR3YNmcQHAiwgJLAZpL8h2PylNtgc4bFQb4Q9i9mJ5Cwq7soT/d5MjGEMkB8PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RePI658p; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RePI658p"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so1376849a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Feb 2026 19:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162779; x=1772767579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=;
        b=RePI658pxkXlB5qI6MyYp7qj0wNj2DbXsTdLwWj55e+jT/bVK201o9wnn6a9Y8DTjn
         WwIBS/WePlXl/gClEw+set8M++pAoIACZVv1fzZdm6o+ARmEGrvFjLUQk6rUPfAzTsas
         YOUuQ6Z/o741fuos20dYlZ3HJLmNMgRwRNNcnLJfr/AMMUNpqYQUlXyG9fgJSbPFAsHb
         ljP/OAWsz0tu5bkjDRQDY00KO9pSezplKYnL8cL/Vj2A1vj5LsUNdFhMPl6F8OGyoeI2
         iBFqpF0722rskBR7pdwWydUJgzXnJ7CeoZfkwv5i6kE68SCyEN5L0Da0HLdco3ihot7X
         XA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162779; x=1772767579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lm2AcOtnsuA4yjZovdWg5px8aIMhZ3rKhw+QF/SygYI=;
        b=nx8mmxupwoNn0nzMVt8qhLFFzSYCOOuowmhmGu3bmkQFg96VZb+wpxCWECqM2fV1AI
         aa5+95f5+D4wzI2pgsZ3YV8ZJuD2681vIyMZc3d46j0BC4gUsdvd211oPMgNI0iDeELM
         qEAwhYZCV+E9XWgQFPcaZ7gdwqxltqx8DrEQFkbVQOOQIzIwNCyhlpRFinzneqVm0MjZ
         Ftpl16lC1TM6Slk4QxtnY7d3YZPJNbvisDdM5WIIYIoeBTpT6N6ir+m6zD2fvqoZuUBd
         Wf18f8V+qZEC4GrO9IoqduFalKr16BxIEN44QRj4MlEazkM6L9/hKA7xZIA8cYiSKd88
         ch6g==
X-Forwarded-Encrypted: i=1; AJvYcCVQpiVXdwGztv+iF1QDZ7NicUSdhksP8HoyZlOghU7Kn/MCNBeoUx36QRsRPYqS1lx8jh//tZplYrSuxaBdegvGpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC0IYv68PeAgYv/hshn8OAzgCZmzo+rk02GKyiCodJoC+UFNsm
	BmfdDkQsfyFeP2O4T0+K6Mw5gaqW/L6ANIqB6Y1NX8AeTD92okpLbCAP
X-Gm-Gg: ATEYQzyHiv+gSI0YEJKFC7UuZTqMipl+0UQRfSq0FKbgew6mTXoR/91YRXzIkikDMzA
	zMr6rY6ivY2c3ycCtY/zmp0HyWgj0HO5lw5vx7HVS70Zor+HIG4L+u+mOC9tE/3Oa7f//f4B6Fr
	oTo+ij46oXd8NJ6KA43WWLG4KfoHZZAxoH05HkfK713D/Wn6iYuAd7M2BqzHE/SoswNNm5Fczo7
	mS3xtmaRe6dcy9jcLO5YxjpNGsepX6KxO+KAH7ZxQqrCG+T8yARPHChrul9uzlEm6ZjihYv4net
	u19irwjlrfIi7/uR3O+bwJZcfA40B7jlgIhQEtlbBxtnG6ClnBhMOvlYR3Oh8J6S3jenFqhdke6
	TdNHfkcqtb206OSU998v7lC+QWyT99uorYYClfS+1EwtQMXDibSspq4Eowd6xtU1SG+f/WFhi1o
	lC9uZ5F5zgcXG1d5RKuNq+3ENE+ZUFBSqTs6MWVUUhH4waGZAPUA==
X-Received: by 2002:a17:90b:1d4e:b0:354:999f:1b27 with SMTP id 98e67ed59e1d1-35965ce1427mr1089567a91.31.1772162779536;
        Thu, 26 Feb 2026 19:26:19 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:19 -0800 (PST)
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
Subject: [PATCH 6.12.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 12:26:12 +0900
Message-Id: <20260227032615.108139-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This backport patch is for 6.12.y only and fixes a bug in the
Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)
