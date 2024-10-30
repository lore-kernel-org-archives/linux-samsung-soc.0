Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52F1E284E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284043; cv=none; b=eMyd1BEt0cE49gHF91Kf5jHqZGTq6nrUGClv0sDUBDG+3ip88szUOSB2CvGqVrgflv2tiB5uY7mgFp6DTyIGlMTivM93Ecjg3Reg3c4pr5Fl8vl4NgQ9fEHMmJ1g85Z1zgbLnkJkwLKWM3e7NrdYYR41yjsmYAGVmkIefYsD2aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284043; c=relaxed/simple;
	bh=otYYs/V9Tlx1rti601czH6DoyxFLRyvqBqFlV9pex/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrvg4fcf2UDESxx/7vP/fdbknmhLOYLZMVh7nkeJ9qAtyLgx2sh4EEO5G6Wgy/Y2MrOTEsFnAORatv8oXjWXfzsO92qFp+FSweuUy8QQ7GrqLwD2RdVSQtMBxjPFGJVGtKmRsl3cF8SyH7Zj8kGwuChLXvx3rS4k2hDyOyBlcOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGTdlSus; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGTdlSus"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so63026295e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730284039; x=1730888839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbYElkal5d6+0YzyWk0lUEIt8HVlxkiQ8cX9u9pIHz4=;
        b=vGTdlSusEHEfc7Dpk7MtEloADs7n5ec/urUmH7gJcoWJaPnTmoobp7BS3JP9JH8DSG
         MZBvYlaILKdS4QxvPkeXtEQr9xuAMGSGjuczrgYnEN6iyCuo9V8BvEx2dq1e6qeQvB6C
         T5dDs5l5mSfKjeKEYK6MLdGW5+SeuEB2Jx3SKLB1fBWmcdYMGLxv0YH1/4JO5cINEFVp
         qWyXeYXKLK+wpLotq2ehSP2LuiShb9D+IyEgTPjiXpzanv8PZMH9Q6Y0l8ZWkd0iT8ax
         +1XudRNaLNaNd4y0/+r33bFzKPXIsg2ElXbqVLEeHyiAdqF9A3Klei6CfyVQXhAT9dqa
         zYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284039; x=1730888839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbYElkal5d6+0YzyWk0lUEIt8HVlxkiQ8cX9u9pIHz4=;
        b=mnJsGhd/mdMVt3FHU6BQT59NBDEpHEvITUtOHn79Q3DQcLd7J8tBJNeGlOfD6AZTPQ
         TAzy6ObDbb7W69+39K4GyI8EQf+tw+M1tsPx9IYx3yI5WkZytqJuL5civAgJ9U9WEh/X
         nfLb1aJ/aPB/BVUOnvy7JWHDzu1yyUD7hN6U9Ft8xuFBnGHFHdWKl5eUINs/nNxysHLk
         88Bgwd65TkkgaJir6yk+M1945AOlBx1mHxhNC8Uh5pnwSdpJCuMYBn1eeeWzNTZ2TzVe
         +f/7XmxTMwGmgVSZkqdBW0XAS2s1of2j3ZGYrmQs/kOZS8DkJfKvAbYr8ROQm1ftMj14
         Qt3g==
X-Forwarded-Encrypted: i=1; AJvYcCXxHptIK84dPcAbBuc51upeIjTH+UeOcRwny4w4VKPHoj030xlZkkSjJRrRoi0fmIXSvoVqoOhCvwtViGhfgageWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHEdDgptPeO+r++KLSt/udctwWNNUytQWDNwVtBz/WvZ5Ww5XN
	TbLxhmBYksGghLzuzdZRwj8aAxJ90yleYIKxFJBLQ2+iXyW2cfP59PADfh1+0XM=
X-Google-Smtp-Source: AGHT+IEBXlayGHv2GLllRn++oS/33OaG/rbc8trQcavkqXJ8lRHX4Tn/XZiU8Jv9/cKndo3pJPqlbA==
X-Received: by 2002:a05:600c:1390:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-4319acb226amr104551115e9.18.1730284039298;
        Wed, 30 Oct 2024 03:27:19 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947b2bsm17074345e9.25.2024.10.30.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:27:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: krzk@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/2] scsi: ufs: exynos: remove empty drv_init method
Date: Wed, 30 Oct 2024 10:27:14 +0000
Message-ID: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty method. When the method is not set, the call is not made,
saving a few cycles.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..db89ebe48bcd 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -198,11 +198,6 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 	exynos_ufs_ctrl_clkstop(ufs, false);
 }
 
-static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
-{
-	return 0;
-}
-
 static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 {
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
@@ -2036,7 +2031,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX |
 				  EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB |
 				  EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER,
-	.drv_init		= exynos7_ufs_drv_init,
 	.pre_link		= exynos7_ufs_pre_link,
 	.post_link		= exynos7_ufs_post_link,
 	.pre_pwr_change		= exynos7_ufs_pre_pwr_change,
-- 
2.47.0.199.ga7371fff76-goog

