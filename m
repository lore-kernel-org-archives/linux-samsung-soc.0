Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E5A19DF4F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386842; cv=none; b=GyU5hW3JMQG3hN1q8hA06PSXWL0pCgtiNL6SyVgieWNMSLeKNVHLCE0+/t3QjIIH4YmW5XhExIWpW3ixlQGhXxYcJiKdZppKorXLQrAB4JKLnO6qmYRzXTKuRGW3IAwsfJv3G7+zY8LoxrfcqHIJ5MIHGidoFB0n3JgXQ2O+WRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386842; c=relaxed/simple;
	bh=iiVF9AZs4yPH5IC0Sz8HHtFFUAcwFKXXFknN+nFLjSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIsRSNuGS0QVZ6TvtreyIMEmOJbkzEmBQUuWnUSYBC74r9PPRoQe8mKsBzBpPaG6MuNpFfkPDY+3aaYd3jolF+QaFfbyuNcOxgcCHEr5b/xrA7AUT967PtVFhuCYOFvgRhVLo4dLJrS+CmPUW+2rbMrZTp9ERg3wI1IjeOWQv3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJPNgNFB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJPNgNFB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so10988945e9.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386838; x=1730991638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDFhDh5Dsbm8CIbr2G+SLWNj/UFzwMVxtyg6fSq7G5I=;
        b=OJPNgNFBGZH+5Zs5wIpCida/Zn+vZhjdW62NxS2c1pK2KmlFkoASOJffntuBSA1tYs
         C/WEtKHHLtYuV9CTs6hEIOfx9dD2gJwbKYV4qcMPtcJLSvkSfkWUvyoYZ7csk3iGFTz5
         eAnZX4oAZAI6EOubdFxaQUSTitAbqprnyPDbpWUnnxcwYAiXkF6D0MGEGUbtND4WjYmb
         nIofs9MCspxUQz54Xj/7O46czchfYzn6naSyliGK4n1dseww5rOzMR8TBN9N/cX3E6zT
         e6zbn+ztrIKZSCeSDHmSGcCpbVnn9xm6yrpr9aGmyk8xINxPfN041icrRmziqu7sLmIu
         s67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386838; x=1730991638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDFhDh5Dsbm8CIbr2G+SLWNj/UFzwMVxtyg6fSq7G5I=;
        b=AyE3YmgzagE2zjE2I1sWc1fPqEAUosnlOAPx9pK/ZT1xgaK5161RWBdD1cfyc7wGsa
         EO6CcvMBMAtq12oGXEuxF33PChO+eYbHYw2NU54ISAQIr1MTeD7LSA1QyQBOVZdRws4H
         qmSctdYWUML79OW8q7gJQkew3JPZkIRTXjliVF4oSaPaXXLtL9UCcZZA2Qyv6MBAYDiH
         Ms+F0n2FI85L2roZ31HdRwBa0hPUsi37kE541y9J2wirG8XWpGQ+JOrco4NsXXTx6tZ8
         4bpTahjQJoDNRdxCAp+LG83EszsFlq5mA0EFtojodeOqa8bRQaOJzbNednFDvJaW+WhY
         EqdA==
X-Forwarded-Encrypted: i=1; AJvYcCWj+vfNBlj4uEWTRmUcoox0yhTX7BODll47v0Zoe7Eavsfo1EH1l8R+A6vNroVVl26IpoG9/e6LzdaHMNCT+BL8xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/thOAKfsLGCN49BR7LY9pHM5L02+tX/a5nhlUYBQGWSyWXeKi
	he2dOTz4eY9GdfI91KpOp37aep76aq7Q5uBkwpL2R0/Lu03wdccxZhV55NFgYK8=
X-Google-Smtp-Source: AGHT+IGql7rcBkBJZy/lkpZXVd8eJAHNb/N13bQ4wyVM/GFRhvhCqwbQi4nJvY1Ydgt8QtXoBjQJgQ==
X-Received: by 2002:a7b:c459:0:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-43283255a2cmr1881175e9.17.1730386837895;
        Thu, 31 Oct 2024 08:00:37 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/14] scsi: ufs: exynos: remove empty drv_init method
Date: Thu, 31 Oct 2024 15:00:20 +0000
Message-ID: <20241031150033.3440894-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tudor Ambarus <tudor.ambarus@linaro.org>

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
2.47.0.163.g1226f6d8fa-goog

