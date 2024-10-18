Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF8520E319
	for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Oct 2024 01:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729214205; cv=none; b=mN0i7I2h0kvgw3PEkdnoYW6FnCnIHoOHq0U8u+sReexm6Y2EjNz2WB1AyZb4nj/mdQYViVX4V7zoRJJTetQL6T76ZDxGe/+bJmGND7LIfWtADxhvNIgcjtCCW7IUU9LUy0FVUtf4anP80laRjESAS0xUZTZtLzEss1eqcOgLXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729214205; c=relaxed/simple;
	bh=0SGoQIoMr1vLVXE3RitZP/wGChm+OcYL5HC9kf4AkgY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lg6XKRIbymE+7ki9bqL80Plf3L21l3rCRCw9PkvvQoYNTZ9khWUCg8OpyF5Vh73qwca++7vh1tPHy0U66idW+3lJe0bcFLAFad/WyEvpHkA3BQIBIWyNSZnmUb/9vNAABrxvkQ+Y3ditwO81Ot6T8WY9IwrjA0/D0plzExyLzzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFSruf+v; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFSruf+v"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7b1457ba751so131227985a.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2024 18:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729214203; x=1729819003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L+jeEzvzeBO0CSepYbmjdJpmL4Dx0CLgyilp0Lr7mac=;
        b=mFSruf+vmHPycuO3+ZlKnUOGOtvAN6cTuZM5M7ok0AlP0NboFv8uetT4T8BZytfdCL
         Cuv5SzkkMzi2HBqcdfZSdJSYyt9krJ1QuPewV7fvQInkvFYrlqOWhN0L9LVe3RzFYPbY
         QcVQ8ueK9tDmaVzLzvs3agCaN6l4mfTGhnitk3QSvoJAjlkoOyyOC5wDLLQ0QNqWFON/
         FuXRV2fRXnw9Rvzj1uBG2ikPjTOQhTyEDU2jY+mRtVjXL3QdP69H7Jlw9AK1ZSEfOira
         PSALt87CVqh3OXatx2AIxH+zknyuUQZigp3Whpt7iCYBy64gKXY7jaMkRNeuweuQ4rvE
         0+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729214203; x=1729819003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+jeEzvzeBO0CSepYbmjdJpmL4Dx0CLgyilp0Lr7mac=;
        b=sNuXw/6XV1b5oz3qK87oscHM6/2/e+ciBbae66sszJR040uUFqPzJIoCSvlqCYJHQr
         7eWpqdSnKeewz8Z8fuLZ7+QGGRvh2YEjxwg9PcHnAoQ6Vzh22GmK5u3ldi80iIW5CYIy
         Pc5X8eWqCsmxMgUzRxSoNALbZiXNWagCZMZby/qbNcNqiPdNASPnaep5iKwuwwVE9n3s
         6+h8VegxU2x3gojbQmV4QwZTFA2fnk09aqE46dZTOCXvFlWZ1/adJmg5AxMBTRpTKzpJ
         +X4LtWsNfeRS4+FA34SL2TdRrP4WB1kzyxAmnmgulUx/vTGHS3OOqgvE629TvD5/3Ig8
         xN6w==
X-Forwarded-Encrypted: i=1; AJvYcCXkoReUhtY7UHmay8clpmpNVStVfGTb7C5g9g/NYtDgeG+t5MCRWTJoAM79I1noBu57I8zhoa6Wd/s9wQ87/TBn2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrbxDrgJczf7q4490CUBDyJ1/+63Arw2ZAjYq7OrYYKMjTEo9a
	sm6wHVzn+RRI8pSL+zvyaiNz+efkf4pyCvVIY40FlQ4BLKzeIb+fznkoc7W0KDmadQ==
X-Google-Smtp-Source: AGHT+IHHFnNKX+aO1kFP+z5fdwNhVe0jV7E5UYmQLhZyHyGqgaPqopnARtqKFCzaWvPE4BOI1xJEnw==
X-Received: by 2002:a05:620a:1995:b0:7b1:50a8:3394 with SMTP id af79cd13be357-7b157b7d45dmr85250685a.36.1729214203021;
        Thu, 17 Oct 2024 18:16:43 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b156f9858esm24367585a.40.2024.10.17.18.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 18:16:42 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/exynos: fix potential integer overflow in exynos_drm_gem_dumb_create()
Date: Thu, 17 Oct 2024 20:16:05 -0500
Message-Id: <20241018011604.24875-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

This was found by a static analyzer.
There may be potential integer overflow issue in
exynos_drm_gem_dumb_create(). args->size is defined
as "__u64" while args->pitch and args->height are
both defined as "__u32". The result of
"args->pitch * args->height" will be limited to
"__u32" without correct casting.
Even if the overflow is quite difficult to
happen, we still recommand adding an extra cast.

Fixes: 7da5907c84f8 ("drm/exynos: fixed page align bug.")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 638ca96830e9..de2126853d2c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -337,7 +337,7 @@ int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 	 */
 
 	args->pitch = args->width * ((args->bpp + 7) / 8);
-	args->size = args->pitch * args->height;
+	args->size = (__u64)args->pitch * args->height;
 
 	if (is_drm_iommu_supported(dev))
 		flags = EXYNOS_BO_NONCONTIG | EXYNOS_BO_WC;
-- 
2.34.1

