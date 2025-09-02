Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0151C274FCB;
	Tue,  2 Sep 2025 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756811968; cv=none; b=r4vKq75Zpie5IYxO7F9ZwoZotVY45rvlW1nZiXIO8Biz8czEzlyj52tef+Ttn+W215HRPuUG9WKUF4ebC2fkaC9eMJe5KU4Wr2QkOqcYaGzomFAYfQn6rfewmZyphCCYquVrkJqbJzbKg2tgldkyv0U2AXcU+ZPVvzKz2xEQznE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756811968; c=relaxed/simple;
	bh=BoGw017JV6MDafm2pfGD3s91i69iqGZ66miMlmTbOQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hyHqR52Tg0QNmRq99788hVRpAYnWBAz9uLY59OWa342i/i/nDwJ/tsuS5GGh74A0J77wlErj/b9ybZxEchmPorcEGUQk/UbzliPDU4GTdZF9bjMopE7FGEK9od/tbkhYE5QBoMrxGpBoq8DiK33r1XOzfb5/P+9hdGp2FFlplNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8wP8rNA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8wP8rNA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b13313b1bso5455425ad.2;
        Tue, 02 Sep 2025 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756811966; x=1757416766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
        b=a8wP8rNANVN8WaOdj/T+UUEcDSR6k26dT3AM3Vu5GMpY+921m8ngcWG70zdAltOa55
         lSv9Pfv0EiALOD3y7qaR6CNprOiL02+BDKqr/H+wxtaIy2Gzi2d1M/U5KyceX0nHGXi7
         UCe/CrDrzla0w+Of9iUNSUqksSuXzIrZyetmKFlztAswMYOfOHIXL4TTRgTSO1TvGG7A
         VJkYUeNonjU2AqVrIsaWvU5ykcPnpvZKxTN2TjgveMF7Yr5V3BiO3BfHeJu4ZDFFOZik
         7Habsh+ijgPcLm9ZoXYHDAJ/IhAL9xxB9bciMnKgtSoWRPJbIDTcM82xqVvlPMSxS9o7
         xK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756811966; x=1757416766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
        b=exn0BSsAV2ccZtOTXOJ+DD8N73KdgsyyaebNUJbfaPbgff0julSLqytsU/taPiRvvT
         IsFDN30BtA9ymKza+jUXP2aVDLrBxJVWkwJp0YTLGU6q/rV4GbP22KksHu+6dkwhWEqm
         rG5/wq0UfYBMMFEcOrn9Mz18AeGbOI9Z9k51MSuuw+BizhRQjU1OBC9RzrTjFr4lMR9/
         S7E2OWwSzQ28sdytFe2TskLnsYdskY/zUyrE/8/tuxCZ/0q3igciQ5ma9IeKRUvvbzNe
         fO6RBYCoi3fNxVYKXq1pMhZ46ulbQOuhdX0GiI6knORgkLBd6fXJA9jzVl+lNalbBBWk
         BULg==
X-Forwarded-Encrypted: i=1; AJvYcCW0nCvVZdyg1zbSQwi66njSS/3tmA+pvgVuUN/9jTBFzAKT9Q4kn80cy9QDKD6SuY/cxVYVAIbzPVavFYCUOQMR8Vk=@vger.kernel.org, AJvYcCXQUM3tmkwisPwAPG3Zo4APPdSxx+3PzsO4DkGKbSik9qrwqrSiWsLsdEQ+B8ImbRwEqt9Z3YPrVIhv0js=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/RsPp4Cs34vGH2Nu1O2daVCXGjmf5sVjAvKQ6BJlVxpNc/w/d
	cBSC2YChVzVnhUkJdQ2mAeG9x6+HgM36MyV/pTZ8LPAZPiorF6bV0WVV
X-Gm-Gg: ASbGncs6LNP5dxuKo+6zoLRqXuNBBnTqfQc7toM8T3YrPp8QF0Zpx4VMg1AfVAvoCKl
	n/wL9uxSqZ7zK3ISOPG/2SXquzOhIYHbjvHd8ZlXEHlJ//oukn2RhMQ7ZJnX973AqSvwjRivogY
	B89fD8CD0fXwFwquxE4CrfgJuku5g3pQk+7z3QAefHCaZEewIlgc1DuyG2lCJGL1eMvtc8LkFEx
	9aDvDSIj29MLDf1s5U9sZnn75Ze0nw30l8ldRcnnqA7fZf2Q4R/GfJ5xTyJc6KpNY58mvPgm/wd
	0q6fMNE3xTCXKFWsHcsrILeFDcSK2t7Av74VTK7/1SfR5B0yVgT25h2ud6QYSKhefo5TBIxJ5gU
	xSvKzRqxl774vqsyZCKQtMuiWUtr68aMH76OnPWxi0gsky+B6mg==
X-Google-Smtp-Source: AGHT+IGxnHS6Z8WCWgDFUeDJb6KIIEv4c0pLQBKyRBYltrfE2IaLwrI592U+lXunhDHTgiqlRjBU3w==
X-Received: by 2002:a17:903:ac8:b0:248:93f4:fe14 with SMTP id d9443c01a7336-24944b1b1f2mr128729525ad.33.1756811966169;
        Tue, 02 Sep 2025 04:19:26 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903705be3sm131325835ad.18.2025.09.02.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:19:25 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Tue,  2 Sep 2025 20:19:16 +0900
Message-Id: <20250902111919.3524799-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 64 insertions(+), 11 deletions(-)
