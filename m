Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C533C1BE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518200; cv=none; b=BWN216Qhvi9WG+0u1BKe1wa4+L1aCPTFn7Od+qyIR+ixiTRDGWGidcZSiV2oj2ocUEiJVB7Z4npwPhHyiFQpEkJxgrc9edl2w4BsMTHffYokdF7x5X9fVffOmTg2/08D4hIynFfGP6ZwBROM6ENHhHcYpkOma6GcmaWKswdZ6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518200; c=relaxed/simple;
	bh=uiX3wI5JNLaToWW36Fbp2hVD4hXO6OJcZpqYXl8hDBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+XRtWzwoD19zbSOUMIJo+dcQJkiF14XZff+Iad4D+jJgvIHxmUezRX9W+JZu5RynSR2saO17+uxmiTJfuWOM8oAvjDxPM+oyIISt0H2cdh1pZu0GMcZNyLhXYwWfF123qVOW+YvrLw/DKrzankBggPse5JZE9hwl5iUIW0YfMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RczODLUQ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RczODLUQ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c766a95a72dso586803a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518198; x=1775122998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lf5f+G0S/Ym9PSzIEzaYi3iHD/hBsSPQKrLmQgNjdI=;
        b=RczODLUQg20kOVNGB/vzSlGhfj0FtOQ0HekaUL2HH1Vs3f97pgLSaHrYCR6svHdu9b
         eugvmLolfo1ae4iqKe7NfKAhLZL9OnJ56mLi2CYRdh3stWNl2WQ4NEPfBlrtV3VGUj8k
         mFg56PA1spB+NqwhsqCR3q609qaZ6sSy5md2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518198; x=1775122998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lf5f+G0S/Ym9PSzIEzaYi3iHD/hBsSPQKrLmQgNjdI=;
        b=WkzkQCo/QLkJnEurDjnOm5HJLJKPIvkmG6jnih/zbxGMzbpHM5mq/sAfiMk3Jt551g
         0ortISXy0r9Jk7N0kAaxOXeMgJNT736ImurYMpBWiTpAOyvDrEtTLMYrStSoaDv3x8tP
         F33CHgC5c+WoGZZj8ep2eEhF1mriqiyvjQFP1e+MRUfy1Z3i7XMAQ8ur/v6DoszqJcv1
         75Y8dqnnQhLNvBS+RYDHOZa/bzRk+A/tLBEcoccwdIPllZwGcqNKr5sO3h8rWsESqX+/
         qrqdvYv6ZOnt2qSpn5mvxkPz+M+WhKxEwJB0Aj2f2eCx/yoU0z/h9IiZmCaWjAd10y24
         r4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXLu0h/pHYyJsqLzGKsUY6+PdAVX05WwzXzT6LFk+w6T4qWpuy6nOUJUkOanu8F6YImLvqqUKvsF53vf35LJ5gKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze506qbpBli3A/x4R5iL9Yz5roQdKqZEQmy3nZOFAXTb58sxvD
	9Vb9shQWeC1SXDot4o8IwFm0PuG1E+eUrLoxic0YeBUxnbcdh8C0lVVKuI8TsaUXpw==
X-Gm-Gg: ATEYQzzRlu2x30cLYCiekQQ6eJHNaeNNCAg20DtLIXA3yv1tF9GPdgEk+6nkX9n8YrC
	QJAk073s5L8nxQunMyzdRFskRs4z3wLjs5qwMo6SFf2MaBkLKpc9KtzLlIzpoRoBViMOXSwvswr
	cp2ZnTfBqjBRXX9c7SuZfowPpgGLWPgg09TWu4Q4XKN6bdqYPSYqfAi9l5R2lTNVRlLg4cMx9S9
	UmlVS0Qsrx7wUQQMIFPNd/kGw1a7FUyrV2PDZbHjVjK3IZ9On0h0mKy0NdW5djY+46tVdkkw+4w
	qLTAVA3uwbqMVLWH7kLU9Pr0BT4uZRk4hCi8vgFBNbj7XDOFFB7CdHDzX7unfH+M0EvEPmm3wAT
	JGtX7a2CYHqft4n/pZ4m+zMTuTomLGoGJtXjSM05dTNRrgVNiD8aiGPaG42EWdFZ4F3oWXk1qLG
	obsJJ6VPQPgmSXT9jpjaTPPL2O6WUmCRjrYLOBSYVT1e0cMv+yaUzcI851zou8VGPxy81vzULaT
	jbeeoTRgcARBc6V/ec=
X-Received: by 2002:a05:6a20:258a:b0:39b:862e:634d with SMTP id adf61e73a8af0-39c4ad52456mr7291868637.39.1774518197965;
        Thu, 26 Mar 2026 02:43:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:17 -0700 (PDT)
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
Subject: [PATCH 0/4] drm/exynos: Random cleanups
Date: Thu, 26 Mar 2026 17:43:02 +0800
Message-ID: <20260326094308.1161335-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Here are some cleanups for the exynos drm driver. This was done as part
of the conversion of the driver to GEM DMA helpers. These patches have
no dependency, unlike the actual conversion, so I am sending them
separately for inclusion now.

Please take a look.


Thanks
ChenYu

Chen-Yu Tsai (4):
  drm/exynos: Internalize exynos_drm_gem_free_object()
  drm/exynos: Use DRM core dedicated DMA device tracking facility
  drm/exynos: Drop exynos_drm_gem.size field
  drm/exynos: Drop MAX_FB_BUFFER in favor of DRM_FORMAT_MAX_PLANES

 drivers/gpu/drm/exynos/exynos_drm_dma.c | 11 +++---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  9 -----
 drivers/gpu/drm/exynos/exynos_drm_fb.c  |  6 +--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 13 ++++---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 50 +++++++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  8 ----
 drivers/gpu/drm/exynos/exynos_drm_ipp.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h |  4 +-
 9 files changed, 41 insertions(+), 63 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog

