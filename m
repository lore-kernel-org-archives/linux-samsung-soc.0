Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8825E33890B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811163; cv=none; b=b7dw6mqJn3BFay2vLTZ5AKl69SSb6F9lfZNyPhKYFJtWRcVt294jiNrhzLO9n6j0lfjTVsLjluf4OSH0tvJfNX6+Zogur4WoOeR4eyBqlqs/uAUzD1M76t9mJgE+nvQP1nqncG8gCTq2/Hoe3eSuPrimABRY7wDev57QhBbBGLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811163; c=relaxed/simple;
	bh=w8UP13amm384XzZzCwddmrnWJmCBemyZWN4IAg9GFDw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iG1TsBfNENAq3ZFrGt3BryQFTUfz59K/97conmhHrBKab8+QganIi/AZXgiIgO3Wz36PoU5SsQbkAOOx8hLVpHHaXpAcxCN16DgztQ4n0JhZayWnsZDJM5DahMDc8i2b/wouaoZdnaeuE+8LaDwDkG+8vo3HTd4Uu79eoBw0tvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIxD5D5h; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIxD5D5h"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0833b5aeeso41642175ad.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jan 2026 00:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811160; x=1769415960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=TIxD5D5ho/i0fVkwSu3crfT+G2sc94WKEkUTu9XyLloE1DKE2vEeSUcy6abgBKp8B4
         cafaB5xGlSicP/L86qFJRdwXJHGwxdRtoHsvyyIIrU2te1Nd8N9rO8iHPIQBmwnSL4Ef
         tah9avOGSFQ0eVdRooul5KLJA0NfVTO1UA11PjYpnOBAQPlwb8eYEtcGORJ9N38OBsik
         trkNP9Ngp2rBLnqyyl+bVbsNMueDzJaHHNlcKR5gIM8TYoFoP0g+FEnI8fKgYMp+n0MM
         fEG4P+M4/odq/6cYjyA8ITTYV4bRYHN8Lm0kORmeF81JOEGoXsfWfmwimOVZYYufK6kN
         dtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811160; x=1769415960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=azV7tlVbEmMdX3kuf46JBfr6PNobMsauSHeWiHpclxjSlA0iYSKzlI2nQrRVDR7ZHb
         NqsuqUVTlPbNAD+dcPlBn0xSi/okQ9aMYlo/k0E1KBq1dMk22F5JkIirIc/os5bVzALd
         /hR+Y362k10IYKOXhjzpw1o8Ho2EKZ63Q8hVgC4VXJGKoyEE8JE1NwYJpQsZNwGzTJYB
         vS3yYt+wBUv8hGrggQQ8TrYlOJxKu8rIhQaF1+4pZtelicTNtxih/FsD6s3OOzI7ExG8
         iRckOZlOF3tt/yRPvYG9qhScvbtW4u0KXZzZEohEqcx4q7jkrxovYUvzQXKYsMT0zd7i
         HcfA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Y1tNLTU6ubUxpNetwMlwjmRFCAGNmz+Ivgd0uY7p+aNiMLUnCV8OcjcXi9caN3fvuBcThsAbo5Tc+aIMD9mGTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo8+U1yRelAgACcGWgRTx3n8dhvDBVmz+LlU++iUWEnlIegVI0
	n7DWYWK5GMGPmKDAQTuaZe/1LPXEwHfg5w0hTmrLjANAqgBLXsOv6NQu
X-Gm-Gg: AZuq6aKiUas6emeHtW8/MIr+P4P4PKhzH49/Eq/FICkGi1Z2nlKuohKOgYAiu9KwF4i
	OobxlaRc/0TEvD7ZcXKN785oL7UMTJEaaEn+78X+fIad7sUdHeG+ThN7D/gNuzunKlBi17P0Zjx
	j1Tz6hY9dKawZGwnDSTX+1nyt6XJG7gvGFmfE4qRbbUzhjfz+gd3XC0/YRIlf/EONgY5ItUr9I4
	Ecge2Xc2RKVk5XEeltFj+9EI2kW7WuRdEeeCG/kJOXSWcSRkBxi6yKDrx0didHjCOQMQsjXiEtY
	o0mk1HJ0XcqgXHgHOEfHswiCU/mmm8elCE7J8dXwioQoL5LIGTzkkwxKfKNRA4qgRVYOynAEXeg
	PXqT1PGkEex+/oAdc0WpzCaJhLMgNmOiUse4tU/gHDh05vJheB52SNbe2MT+poDj/K5lHZLDzpe
	kGD0S+/ct9gVyUG1qmutguUzdD5MY/wlV49hOEMCDvcaUY6zko
X-Received: by 2002:a17:903:2282:b0:2a0:de4f:cad with SMTP id d9443c01a7336-2a718954195mr91095305ad.60.1768811160125;
        Mon, 19 Jan 2026 00:26:00 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:25:59 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory corruption bugs
Date: Mon, 19 Jan 2026 17:25:50 +0900
Message-Id: <20260119082553.195181-1-aha310510@gmail.com>
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)
