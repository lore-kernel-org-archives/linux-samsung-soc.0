Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6A2749D7;
	Fri, 18 Apr 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744981630; cv=none; b=MA4/xqR19vAwDfdcYhH+1ZvmTCAgXlmOQofEa8mAdf/iEMkJ3uakgGhQDm1Niqo6AddlbpjsopRl4LlU3rvfZcVIbTeLEEYT4f8ew6Aj2eRyWxFFY4s+TBOLfXd/6Nec0A+0SozQhDADVZtK3r8INONhWOB4uSOBEc/nPIolnbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744981630; c=relaxed/simple;
	bh=wUE4dWHvSCik/3H0N3jXNmiIywoqHZpP04FIL16opA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hAnwFxfc0qg8qHcLou3RPiy9SbtTylFbJZxipLMyYVwjcrP7e6COjLpTaO/8gM1xXft7gjF91H0tR7sMtSzylh4oGvD9uq7FpjyZT09wAzLy8wYJxFex0kCOeGuh9LDLq0tCPAucwe/Ap+u5AYAB7lwnO27W22wKGCzSvmPRhtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRcd2+Z5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRcd2+Z5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso17901905e9.2;
        Fri, 18 Apr 2025 06:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744981627; x=1745586427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=;
        b=mRcd2+Z5NFIGMiqm6QsNJPzVq1vbfK8eOWkRhvH3DHkfgND92pS8AEdZNGdwl6VMQd
         7KmaVsDjYom57/qqNwF2E8R44QB5QkQLBQKbtXC69Nmt+1VmVOSUNAkHtGiN97vJBTMe
         kqSvXZH3wiZ9TelT/Xt/CXQtA4OF1FldC4B19HKu8DEdiZRsXQKa/J8gdvK9j6lJmX2m
         vCgZiTW8v2oZhu1eAlvczoAtC5fh9BGQq3hdtVqcelNQAc1XFkVk/EKTazf/ae74ID23
         tQgKLogkvU/GG70awKCTJlVmnimZQWjgzfMDxQQd/ceFBId0fCUwtJDuCALCe/buCje3
         y9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744981627; x=1745586427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPmaDVcyCN8xn5x/2E/HujSFy+Zs3h3dzceOeOvtskU=;
        b=oqklzvlGmDyfyUU9PRDH8NA5wkQAe5nYUB8Y0RiYiLX7TbV3w1aADZANxAQIZKkwSs
         WWoReAVBbw6tmPzcFOYMouifUpumyj050wHYL3aRCtGcTaB6DwMNSrggZIe3swDxEcNe
         qOwQ9lyrsAzu63FYbUqcYnD0y+u3T2lGIgTqGdmh5ncAk9FwqmRB/8HxNyTIU2Lvunrk
         zHayvfiDbGEdO97XBcma8+WwKhCd+QHHERsmEMv1/dKEtoM8ImlwyT8/mSN+Lft7XJxA
         4m9KS8xPFWdHs4XlYkw6zQXWsHZ24lkC+CpOJDzw6DRbFaAsKIjgNc+FFTcXe78gikir
         dzfg==
X-Forwarded-Encrypted: i=1; AJvYcCVCCy9OICNLQ5BkgMkEjpPrGAb89C+JU2nuI2/P0MadzBHvlmcmuqzhp9GpQ30YA13l+Hox0lVVS3DbDuQDmktft6k=@vger.kernel.org, AJvYcCWpkCETRi2yYIxDMYSdsSpGjFG3/WJqPOZlJolsJAaKZ7fIIeaeMJtbLbUTxI28TBsYtJNQH0qiebeSNyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoyENvxm6l78aC1BbVLQrPjXQX1CkAvECBQ2pfkIsAufW7QRy
	viGTOvGpMgJAebAy1Swg4irM38LjQ0UkO4MmyBlvOSiqdDdH7oEv
X-Gm-Gg: ASbGncuJLAAHo9M4aUxAJl6VlaguXMV2W4TX9YC2iox7ehtDViGRmJ6vSxArbGnWFNp
	kVKn2XhOMMggwEILPl/s0qlSpxaDG7CRJ7LiERU2YPbihpioOQ1XzEWIJjvXtscpTkQ971OK5DR
	yi10vQqbHtMmRpnLRNbqD+L4f377uXu/LKJwYi7ciwB/XsQePMVRkjA/GKVfkmws7BL+KHAT9Fb
	SEJ7fY0qA+D2rQ3mVNYsNIzwjTRx+UA8CKJjdMaFT1/hD0phG+IfS7V9hfTmBcV4VCkoXg8k8r3
	Hkthzc/UwTrFhHAX/YWwLZPDsAuu9/spdIa07EaBZg==
X-Google-Smtp-Source: AGHT+IExMbsAQz7Mwc12HiLkpWeb7K2O1dS/WK/atDtpdKNgEq1aIQw+33yHgxXO3RSHnYFs46ICbA==
X-Received: by 2002:a05:600c:1547:b0:43c:e481:3353 with SMTP id 5b1f17b1804b1-4406ababea3mr21349975e9.17.1744981626906;
        Fri, 18 Apr 2025 06:07:06 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4330d8sm2796501f8f.33.2025.04.18.06.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:07:06 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/exynos: Fix spelling mistake "enqueu" -> "enqueue"
Date: Fri, 18 Apr 2025 14:07:00 +0100
Message-ID: <20250418130700.540590-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a DRM_DEV_DEBUG_KMS message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index b150cfd92f6e..09e33a26caaf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -908,7 +908,7 @@ static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
 	u32 buf_num;
 	u32 cfg;
 
-	DRM_DEV_DEBUG_KMS(ctx->dev, "buf_id[%d]enqueu[%d]\n", buf_id, enqueue);
+	DRM_DEV_DEBUG_KMS(ctx->dev, "buf_id[%d]enqueue[%d]\n", buf_id, enqueue);
 
 	spin_lock_irqsave(&ctx->lock, flags);
 
-- 
2.49.0

