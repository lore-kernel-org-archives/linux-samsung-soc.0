Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959920BB43
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862099; cv=none; b=XF23vB2pIVWciGeXxfwyoap24SpY43UVgvMIyVWTQgIylTyqBBzziwDzF7Yjny8gXk3nXraX+eSbjcRbbVIxfZyDOTdDkHJXW4StmChBISom5l/Mlon5w9u1vbZ6t9uyO3ywKExHy7eiaHn6zxJHJhAL7xze0QEM0O6cYl6e9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862099; c=relaxed/simple;
	bh=5eFNbj8oKYgUwgjCPIPgeqetnx6XevHf8p0h8myP650=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoFiv4Vbp/BTU4qrYyhLwS1nYRRquJHKLYxgreU27cVvr5WW56vj6/Mzn9oAS6Nnq8fwC/9XsEeetOhRP6v41zgTC+Q6MPLkceVtF5Cqyx60SOOfAaLF06qAbHwKK2YUm5g2B6jKA+cHlazJ2pDdQEX8+ho64EIZync+OZSdtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wy2xOp9f; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wy2xOp9f"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2436180e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862095; x=1730466895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4p/a/n3EAi1phVyfP45uoVE5rF3xsXeLLa3VUUHv34=;
        b=Wy2xOp9fUzbZ2W/7xYQjYaryAa6BHnlzKLPu10Vj/amZr2+GNi5PS5/dGNdx/W/AvS
         0ncux9kscK4KZWkt2OGnvvgrgdH3SwtO1rKkE6YuTyxr+4CwtH7I94OepIo10cGZTFm0
         V86CuToeFFYzZvAhsO7E2/+AOlTlkOJYvo1lJTxotyxg+E2rMCCUjEAVhfqt1Nc7EdfR
         0HNc9yyDbd8a3VU99dvfMqZjsJ8aMX3qWAY/0eZqnOvepod8QMepHjE/FhnwsEmXG0Aw
         Sk0Vh+knbGtI5HnFtCv9M8AwB0KZ13KcjmDKsc8abacLRdTQa3Kj8wDK974nRU8ntHAG
         byrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862095; x=1730466895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4p/a/n3EAi1phVyfP45uoVE5rF3xsXeLLa3VUUHv34=;
        b=OVbhpXPPJUbUkqYniiaXRYDrenH8Yqa33ExE6ox0d50BdviJhFvLhrCP+51nWSRssa
         jKGiAYBb57g+rEpxR+yrEJgs3bZlFHwzAyqdF0HT6jB9dChCXcPNFSXCOPtPvKg1to3v
         6mKcGE+EpMQoozqEyxUDX5rjRVe8EhqB9E1IJq3TCjEWmx3HkyLCJAy8JPgVsHcTWV91
         QOxcPft0ZrThOQGofNSwHaKk/XEYHausc+nTO2n6vtpZWReHzxxB235q/H3f1+6HoNGD
         JCJxCalXZZFl+UHxUK8a9uZ7h8T7yMBfjfm3r/LJeedfJz33Cfauad/96GlIYmuAPuSQ
         oUFg==
X-Forwarded-Encrypted: i=1; AJvYcCUaP6mpYbwUk5L8qcXFAYM62eifABF4cdNKzVsIczQ4a31XCkLqHtxGwpJzSykpQkRnbV0QzjjESfi/9Ho0pJxC6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA1XUfiRVCgTRljo5BIEIyDUKS87SpjNaqq8zPIlvV0Ev+vnl
	paosx80px4SoEwna1R1TyW5f9jisfFDUccFBAqx3yng6kFJ/kJfXSxhDEFQO460=
X-Google-Smtp-Source: AGHT+IF1nqwM65nZ/hmqcna4gL0pzIQdq9UtAly6V9yqCaP7b5l/UQUT68oG19uDiQ23I6pznxiPSw==
X-Received: by 2002:a05:6512:234e:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-53b1a2f1eebmr5293668e87.3.1729862095389;
        Fri, 25 Oct 2024 06:14:55 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:55 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ebiggers@kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 05/11] scsi: ufs: exynos: gs101: remove unused phy attribute fields
Date: Fri, 25 Oct 2024 14:14:36 +0100
Message-ID: <20241025131442.112862-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
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
---
 drivers/ufs/host/ufs-exynos.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index a1a2fdcb8a40..9d668d13fe94 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2068,26 +2068,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 
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

