Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836F2D0614
	for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Apr 2026 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775630986; cv=none; b=jsMJAX4PK5EG/GRw+kRFDp0XY68wt243RcppWZqSiIPur9aXqcjHruQEpqTc73Mq9rZWMel0w2Wpx1EO9q0RP36j35vfee3n0bcpHcm7hdllAk9wfg8eKXp9cg0sgg6kXVi0zD1RhiCZX6rQAZTK5E/879Ok0tV/RBC5L3jhj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775630986; c=relaxed/simple;
	bh=iN1JcgXW+5teSfs4vwUZKh/Iit/rCF88dY9lYL44Dco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WW5TWmHh5+xIv8YZiFYExtucFZ24x23FBGtbzS+S0QRf5bjfpvtHv4zu4WzNEHqxCIpSWqSAO/bYCBnMxrdmycrnn7mNH43vUZfaq2B8o4CEUtnhA2UIit+byiRrYPznxe7Ax8hzgSxIFQXL0a9wko6iwcWZmI8jxSIFphb2e9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KRk/qct3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KRk/qct3"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c76bc3e8de3so2237275a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Apr 2026 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775630985; x=1776235785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/MofJKHc8I+/Pub8F3lPg5UDKLJc1Wt+gTwGRRfhuM=;
        b=KRk/qct3beZ2U03TBWj4Rp5/MTUl9ktwcku+dR9u7POTw76tqww1APHkOZsvB1ngBg
         fUkIAD3IwM/KIB1ji2yYfrHJ7seL2sOqsrQ90DgFKA+E8Qzg9A/+LHkjScdEUpocil17
         uP1BtdoJuDnfrNCBMJwJgnKjw/UBlTFCng5iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775630985; x=1776235785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/MofJKHc8I+/Pub8F3lPg5UDKLJc1Wt+gTwGRRfhuM=;
        b=b60+hWfsc1bGJrJEC+zskYgJanu+/llLjWa/3BGPZoIk6lhlXxI4RS7ADMgCWhwpE9
         A5loCOjZdm1bfNi2KvTkhmpG4JYNOfJmDMyZvpzK80l945+a1OgNfpBI2+L5PnY6LmkZ
         ZzBYJ50js5y5SZCC7J1bCgrPfqoRFQRyqtMr++dLa0kQXZPbwVLmRPQbbvQd9PhUvP4c
         F7MQ+Va3pRCv9AtVpO/Tbd9tWVIBCOFHuLANkIymIvYPkj5FFP5NSw6QLFYCj+GNFYlB
         JbD60LBf3yVvMDLKQ8YdGPW3cjaFPZKjHMD/y8nEjEebr7SsX0uOfUaO/2SUa09VdknX
         G9NA==
X-Forwarded-Encrypted: i=1; AJvYcCWZSir4c6iS/9h4eflZA2Fmzb/D65yLr82bD35u24C5LWFtuSMJsiQaMYLkY27rsskSbx+EXnLJNx5pJXtbza1HNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Okt2vLTdd8qOdNu2Ce5Dk3SkR996xvX9eJ7hwjZSN/dWDFf8
	wEopVzF/uCsZmzL2ldvVVpFrnl93L8sO/ykng/cTmWuWqBybv019jD/LAB1j1MD0jA==
X-Gm-Gg: AeBDiesdFoRxUjzT9ANSrCVtySEvbySHaSsTz7AgveUnVNu144P+v+3rgTwG9pLR3tO
	z4wouZeR6FSRiX687RJkpp+yh4rjitkY1jw89xCBhueJywdCgOo7c4OKRj114Na6bgmeeb81vke
	aOAneASF2oXUZXDeMttcljuRQtgCVRFGdTofHuB88nIAwniyVTATGDU2C0/x7JBSdonZGpUSCrc
	77dCulSGn7DOQyVp+im+uAvOFT63+wY1MoZS804QD2yigYvCDpxy+PiZeBJZb37kMNWqwUlxqOj
	5fxOnfnRrfEeXe99k8Lq+zNlfpHRXvfA9hqBQpNxwB+ZmMKEWzLugTFAvHc1FqdE6Xs+rHtofgp
	FGK7wfAZBAx1HFtNV2VwyrRqjDSBcAo5mvRxuQuu8HJg/5q5iun1lwe1PjkrPmQA7Mi6+WxXqMe
	Z3Qcrn4pf9zf6hmrphyF/VjSVER5H7E9XNd2AScyiodsfkSNOrO/49Uc/r7MBYsugGLD9zI+qEI
	y0Lp3hB
X-Received: by 2002:a05:6a20:7493:b0:398:9ae9:710f with SMTP id adf61e73a8af0-39f2ef7e3admr21007463637.13.1775630984895;
        Tue, 07 Apr 2026 23:49:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f0e3:c8b2:74ff:70d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6561fe9sm17036136a12.15.2026.04.07.23.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:49:44 -0700 (PDT)
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
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/exynos/gem: Fix printk specifier for gem_object.size and dma_addr
Date: Wed,  8 Apr 2026 14:49:34 +0800
Message-ID: <20260408064936.1342321-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the recent change to use the GEM base object's size field instead of
the exynos_gem object's additional field, the printk format was not
adjusted for the change to size_t type. This causes a new warning on
platforms on which size_t is not unsigned long.

Fix this by using the correct "%zx" type.

While at it, fix the specifier for dma_addr so that the cast to unsigned
long is not longer needed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604081331.jSJQSVmg-lkp@intel.com/
Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is only compile tested. Build for ARM 32-bit confirms the warning
is fixed. Sorry for the noise.

The commit hash used in the Fixes tag is the current one seen in
exynos-drm-next.
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index d9d42809a1a9..f264e170bc26 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	if (kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
-	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 	return 0;
 }
 
@@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
-- 
2.53.0.1213.gd9a14994de-goog

