Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECB51F873B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 08:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742285265; cv=none; b=PSiD2xBznZfGL7g7DdGUOLnLAARvCROE+bg8wev9P0zq3P4rfAdRa8n2KryDV5ElAtC4KnXFXMlG7bV0FLzO5kAdk5WJKCKfD5vHDC90pFCaI5BgO7H+HZmJIwcGTrLEVEPVNIq/EODcw/Wlr7VK/bnaFEXHBuTl33YlNUJnWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742285265; c=relaxed/simple;
	bh=7/FQC0qr3nzncJkItFemzTYwa35i0ePuQ3ObQpFFzZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rItOSGmo3zxN6u5PaMp2ZK7mbL0+Hdxe+E1J+lgAfeZ9aE/dz5OH4+4ximqPVDKKp/rAnbTbHsyaq6YeI026JGyAYC7OolPSrT77XHuoy/EWSBJBPX4/h0SE+67sVo4YtmcyCoeixHq6qbWT+GB25TBcZSX56tVtfDmIcP3d+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtyrRaJe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtyrRaJe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so1396295e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Mar 2025 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742285262; x=1742890062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=;
        b=JtyrRaJejDTBHUOJNoo2A1UT97AHU3WWFMwhltS3euFDX5AO1OS3SbJHNThd02IcrM
         DNhAX/Ndi+sAVEZSpayKpshM7wvtjWZUJhtPLUNUirjti+yZdE9s9gJPKuY+8N+R8B/X
         cveA/nB0poDRLfrz27GFGp5Qz/XzYEdaYThMUfrs6maZ8IntnVo4RM5jiUC9W3120+YT
         tolUrwlvy8C5zZZiMh8Ll2O0Z/4xsu15+AvXhSFrz/VbeG6aP9dwmskh2MU9lpJWgfTy
         pPNLbDrm28m6MxYoZxtKQ11Jv86h4Jb+N5iz8DZB5WZLkbP2B0O6YB2yWupSPNI97Fd8
         CjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742285262; x=1742890062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNXHg+fYs2vYclPphu41jtGXveshr859Ah2cwXoi544=;
        b=VCw3FoGXnWFXgCVrZXXeLTqmCglc2Tnt1rLd1JLbEX9p81J36S7RTTqSSelSuDZ/xV
         6qGOFCYjg3LasMjp035yM9rw1jJqjaN/jtW77eMZ7wjZN3I0dsBrZaIMhUho9xEMTiQO
         aUeTkGP80p8neWeSMQt6bEngK4ritkMB9XgsAU7StNa9UBuoF7zMmodWfWX8UQSLNI+o
         hpbGSYMoqc7cIPs2HGKFcUkOckwqe5y862qOirqLJEb7riwQTV/SrqJrrVRs02oc7aW0
         0vQOxivAKvL6Bqmsn3PhsVB2zJVwaxlljlLxsc3YfierbvJgguiujtdicH+2jx+8z3dT
         z5dA==
X-Forwarded-Encrypted: i=1; AJvYcCXB2akCH4ebgrCGqArzxznwtIbS9rJz0xEtMiCX0XUar+GW43O+9hTLABua9jemWyiwWN2T5G26XKvKS4puINWu2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxswj9jeDCW5Bjp3IS345lLLcGMWJ550sFpzXtR0o0GkeW1NcCa
	eM78GEUEZTMWF/8bpP7VzMvFUPbZmMp0xHtkTa4bqVqENDExY3MwBxgUyWOSly8=
X-Gm-Gg: ASbGnctGCvQ94Vz+NY3ep+/e4moZ9C+sZ5JYvIUK0gSQ7UMdLrDmTMmWL0pZ/s8f9ul
	Qz/5Ufpt0qk6nYXMA6qHbOMen1/lpQ4//ZXvJkJAVKCK1ZpQn7kBvQOhLrHUUEvTbPDghn+yNeE
	5wfmK+9tZ4YFJTBt42G7/emJUYA2RRRTZ8+E6sYdx7/Ug3aJNDtmrek5oPzKFL2uzUjh2/02B6d
	qXLnv2CUe1q3ANoP5xJuTjsCNsYp4jTPl4klGhb7n51q4VU5L3yoDFtXOVIDiBX7odF+CzSbDZS
	U3E49+7BXaemWFi92yJDtI66b7Wqg91kEK1qqG51irsKQ3NInxnJE9aqTA==
X-Google-Smtp-Source: AGHT+IFwlyR0auz4mcdACDhys146VQDwS7zQVk+tqjA/y7Na6v0bxrpeypR8IICKSK0Vi8hm17Mb1w==
X-Received: by 2002:a05:600c:871b:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-43d1ec6544fmr65619435e9.1.1742285261948;
        Tue, 18 Mar 2025 01:07:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c4f9d59dsm17389527f8f.0.2025.03.18.01.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 01:07:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/exynos: exynos7_drm_decon: Consstify struct decon_data
Date: Tue, 18 Mar 2025 09:07:38 +0100
Message-ID: <20250318080738.29292-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

static 'struct decon_data' is only read, so it can be const for code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 5170f72b0830..f91daefa9d2b 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -43,13 +43,13 @@ struct decon_data {
 	unsigned int wincon_burstlen_shift;
 };
 
-static struct decon_data exynos7_decon_data = {
+static const struct decon_data exynos7_decon_data = {
 	.vidw_buf_start_base = 0x80,
 	.shadowcon_win_protect_shift = 10,
 	.wincon_burstlen_shift = 11,
 };
 
-static struct decon_data exynos7870_decon_data = {
+static const struct decon_data exynos7870_decon_data = {
 	.vidw_buf_start_base = 0x880,
 	.shadowcon_win_protect_shift = 8,
 	.wincon_burstlen_shift = 10,
-- 
2.43.0

