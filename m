Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB811BD03F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386854; cv=none; b=oQdsgZGWSYk1mwOaXGbShYr8YGxHNU7yigN5Px/WBXI12y1ADpGO4E9JvdsAxcuWucoWQFqfYuAIMLCDBTFSeSUfgTyMfxkOOvVX5o9HhequmgZQpVZj1iUxdX+l5aou8ON9MImSODRJcuMunh/fUhqVJwfNhF4ycPtRrNA/ORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386854; c=relaxed/simple;
	bh=ObJIfaZjIKHh2LbJ+suNUf2iHwIx5ihpEmFxKcO6q9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/+oiquCSxsKrZiMBiwL1MTFzEKaD4FjJJPxvZ/0XI0BNrDCAbmM/oxqZmLchsuRhvDqOsxnO8z+s/iNF47w0x2fvO7tt6wMu+tnjl0Cr+k1TAzZ7/K+6YNA30LiGIX2xe1ElvR0bjZ7jqjXXcrcdGpR4o5dmBQLn8ppnqta4rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lq8uVEcA; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lq8uVEcA"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb599aac99so9278731fa.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386849; x=1730991649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGlRIDiWOIW/oUdNVyUFBt1pPENWr+qbw5BPnPtDdZA=;
        b=Lq8uVEcAXOSLAgjGkH2DEZcfJB0trq358MH9DKZEZAfoueU2Xk94ntbcAXnBR9m+Tg
         QxTO7l+kOHTz/iSHTbc08gKTncF0Bw67Y74ji1KBZcvVCoMBkRybHpTwnQS83Vq5ewfW
         R0K/WxWt9NHKrPyt5vwPZEKK7fN43m4jcJ9pNrXeZI4gF7nlEdTb5QMK9AtKIEeoeJsY
         +Iuycf+S79TryUQgzIjHGPfzHwD7rXnlqzzkDzzLuR60j/QOoj+L4t5Vuc0I0n2qA5T4
         Y19ycdU10VLPeyn5xShjdNJt/MP5ah9amL/a2IZ4d7q4xu6N0CxfXmXrZIJTV23ixn1S
         VjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386849; x=1730991649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGlRIDiWOIW/oUdNVyUFBt1pPENWr+qbw5BPnPtDdZA=;
        b=iTibbKfgypulUY+hdb5hSXZpfh65J5qcfgqO/TeRz2hocXsM8/fVsH9aM9HfeucYXu
         8jezmrqYro8Yg2d42QICdUr4n/7OuewjFEmBS6BaGVi6Kyu597o/E72hUA7kcoO37R4o
         SczyGGbYmY5qF8ky5FIyOxeqktZsO3cXw3U0fGHewSLs7X4FfQPNT4pxgIGI9ZGqM5zu
         5drQYQNN2oEUtALdbDtpszP0DjY/EaAqp+lICfXgPlMs2z2mU+zLceMCz/IDzJPvALL7
         v245Lu8gRBpFXufbJjGeaULOmyQ0+h5u2Dv0lthRq7WdxP+eW/2uShDZZVf3Qmo2wq7/
         GziA==
X-Forwarded-Encrypted: i=1; AJvYcCWtDLdNZ6S8zBrEjKrOZIBCQVZCByoeHOQQRsn/ZWLn4NICS6AR9JXyXoZRY7oIDGWCX8XpMtxu39J6XUZ+grw6Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxehqXyNa7CAmtqZDOvLIiUMq74jHiHorYWxkHsS/PdPrEuGiUY
	60r/w6TKfwBr/1BKx+XzbvYt+uRDVxzx6SAY/Vh663ykiFAeMph02u4XYuV7Cz0=
X-Google-Smtp-Source: AGHT+IEXzbBlOP0V8hZQy8KaxBb5hcC2ucoOBrtqsnAW7CPkAU8t5qtuC/NhFTjTUjwZ36RRBVibJA==
X-Received: by 2002:a05:6512:32ca:b0:539:93e8:7eca with SMTP id 2adb3069b0e04-53d65e02513mr162912e87.35.1730386845937;
        Thu, 31 Oct 2024 08:00:45 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:45 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 07/14] scsi: ufs: exynos: gs101: remove unused phy attribute fields
Date: Thu, 31 Oct 2024 15:00:26 +0000
Message-ID: <20241031150033.3440894-8-peter.griffin@linaro.org>
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

Now that exynos_ufs_specify_phy_time_attr() checks the appropriate
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag. Remove the unused fields
in gs101_uic_attr.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 0ac940690a15..e477ab86e3c1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2064,26 +2064,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 
 static struct exynos_ufs_uic_attr gs101_uic_attr = {
 	.tx_trailingclks		= 0xff,
-	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
-	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
-	.tx_base_unit_nsec		= 100000,	/* unit: ns */
-	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
-	.tx_sleep_cnt			= 1000,		/* unit: ns */
-	.tx_min_activatetime		= 0xa,
-	.rx_filler_enable		= 0x2,
-	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
-	.rx_base_unit_nsec		= 100000,	/* unit: ns */
-	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
-	.rx_sleep_cnt			= 1280,		/* unit: ns */
-	.rx_stall_cnt			= 320,		/* unit: ns */
-	.rx_hs_g1_sync_len_cap		= SYNC_LEN_COARSE(0xf),
-	.rx_hs_g2_sync_len_cap		= SYNC_LEN_COARSE(0xf),
-	.rx_hs_g3_sync_len_cap		= SYNC_LEN_COARSE(0xf),
-	.rx_hs_g1_prep_sync_len_cap	= PREP_LEN(0xf),
-	.rx_hs_g2_prep_sync_len_cap	= PREP_LEN(0xf),
-	.rx_hs_g3_prep_sync_len_cap	= PREP_LEN(0xf),
 	.pa_dbg_opt_suite1_val		= 0x90913C1C,
 	.pa_dbg_opt_suite1_off		= PA_GS101_DBG_OPTION_SUITE1,
 	.pa_dbg_opt_suite2_val		= 0xE01C115F,
-- 
2.47.0.163.g1226f6d8fa-goog

