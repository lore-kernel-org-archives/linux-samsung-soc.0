Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374F1E3DC5
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294816; cv=none; b=e5swgSfpR87LRZBJtVgwxLg+USaWwUTIaMT2NlcVdcXl4i5MrQRCWja7SX9rSjX89xmTTsOLpPzWjDspCbmDMGbWYnWpFi+3JsbHyYRXG/E7taJGjhEEdrrfku/vED5I6AB8qjWQ4YeM3zSsqnK5JV3gAgKdgBr0gzIC9zjSJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294816; c=relaxed/simple;
	bh=ainmGEAe2nvxsKE3uvQszP5Qu9isSkOhSEr9wHzge2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0KeCI5JMYixvFRCcKFYqBnoR+DCPHDdRTqii5rviBx0bE5BpdpBB/XESE0W8mkxuRNgHIEkkP8pa9oY9GnU2BrWcXW6hHALijuGtoVpxdNCo0StQBQBzixAj/PiDU75pvypJq0u7m9pNkMe4igyVJM1O/BbXUrDt3hMQK6VGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IRuyzutJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IRuyzutJ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-431481433bdso63366935e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294813; x=1730899613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzoMFJwewUJr88TLCzmafGB2re8jMyauaVwVQzw6WY0=;
        b=IRuyzutJOpgHKPIc8F65+3Dzj4F6QsXdLYsnARRL74s8AtI6/2f6OYsLb9AymF/BZy
         chd1ahZFl4PDtsH0S4UdOfe/5AEHkRpAYkpxKt8LTdUmT5I4jh1lw4daGdZgmgtzIJpH
         uGLWH8Z9o7qsij9BHEgvVSy/T4pZ688MSz6/A4c4YaKXlJDqwoyl+Qo+t1ZTKyPc8cVe
         TUxKCLfh2zWhE2qe33Kwul+vsUzFjd24STvHmi0r11hRc2IHqnAeZJio9WUQTN1qROJr
         4PgUN1pyBQ50Iqg2MHUVQOnDBkXKqalZJsfr3uEm9/07ADLNKSlpfWa7enNGC5RzeRR7
         5d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294813; x=1730899613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzoMFJwewUJr88TLCzmafGB2re8jMyauaVwVQzw6WY0=;
        b=uzUHCITECQrNqtsaJmS7jj7fen6oVSrf1O0YAqdzR69SRNAnu9KQdoM3ffi7MUQCh6
         5SPfI7LKGWD0M+aetlTk8pom08cC4YxhxQpcL0vxRKpsW1lkvH+JvxaRG8mQu3ngvAKF
         cPAZJNJ4NIIvYvm8oUI5jlUJ2qCNAHRQ5HlB2bAxDqCFpQBrT2d/kDNRIiWJrzF7Y4BG
         T4zKMbuGjnADh6hUiyAa2OcjDasWO7yeN9/46j6rnj4fCB8YJAhZY7udDFbcc+p6vMMW
         kVpIrsem4/VAcKwYTVgjqB8RhA+ur6U/4QpAEDzOzH0bk6Yy86vMzb46tnByZhnA5tNv
         ulYA==
X-Forwarded-Encrypted: i=1; AJvYcCXP26WHeHs/pTjlHhchrRduIe2IJSAW4LtHrHHJjZD2T8tYjeVV+tE5delTv9aIYHyTtnxPYBwSRV2KbcDPzXlSSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWjtgfZbXopKAwQwLbmciCn33Xmqf5xS1xlFMI7bdH/i7JhALc
	6XUvca2s+Vq+r21M45oJWM3jgPUbb4w6CbV+lf6hTmnW5YaoqCU5JWIsCvbfRLc=
X-Google-Smtp-Source: AGHT+IHvCVDH97OPRIU78dk2sv1dUkZXYpRkqnVZcPXDtJpr/JmOXd9IkvC3KGa6t702TR8hj0iMNQ==
X-Received: by 2002:a05:600c:4f06:b0:431:5021:32 with SMTP id 5b1f17b1804b1-4319ac74308mr110456545e9.6.1730294813080;
        Wed, 30 Oct 2024 06:26:53 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm15356836f8f.30.2024.10.30.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:26:52 -0700 (PDT)
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
Subject: [PATCH 2/2] scsi: ufs: exynos: remove unused rx_hibern8_wait(_nsec) fields
Date: Wed, 30 Oct 2024 13:26:49 +0000
Message-ID: <20241030132649.3575865-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241030132649.3575865-1-tudor.ambarus@linaro.org>
References: <20241030132649.3575865-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rx_hibern8_wait_nsec was used to compute rx_hibern8_wait, but the later
is not used afterwards. Remove both.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 5 -----
 drivers/ufs/host/ufs-exynos.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 91c09309c1c1..fd86252ab2ba 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -559,8 +559,6 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
 
 	t_cfg->rx_linereset =
 		exynos_ufs_calc_time_cntr(ufs, attr->rx_dif_p_nsec);
-	t_cfg->rx_hibern8_wait =
-		exynos_ufs_calc_time_cntr(ufs, attr->rx_hibern8_wait_nsec);
 	t_cfg->rx_base_n_val =
 		exynos_ufs_calc_time_cntr(ufs, attr->rx_base_unit_nsec);
 	t_cfg->rx_gran_n_val =
@@ -1975,7 +1973,6 @@ static struct exynos_ufs_uic_attr exynos7_uic_attr = {
 	.tx_min_activatetime		= 0xa,
 	.rx_filler_enable		= 0x2,
 	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
 	.rx_base_unit_nsec		= 100000,	/* unit: ns */
 	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
 	.rx_sleep_cnt			= 1280,		/* unit: ns */
@@ -2050,7 +2047,6 @@ static struct exynos_ufs_uic_attr gs101_uic_attr = {
 	.tx_min_activatetime		= 0xa,
 	.rx_filler_enable		= 0x2,
 	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
 	.rx_base_unit_nsec		= 100000,	/* unit: ns */
 	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
 	.rx_sleep_cnt			= 1280,		/* unit: ns */
@@ -2077,7 +2073,6 @@ static struct exynos_ufs_uic_attr fsd_uic_attr = {
 	.tx_min_activatetime		= 0xa,
 	.rx_filler_enable		= 0x2,
 	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
 	.rx_base_unit_nsec		= 100000,	/* unit: ns */
 	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
 	.rx_sleep_cnt			= 1280,		/* unit: ns */
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index e64fe20d50c1..b7fe725c7f8e 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -144,7 +144,6 @@ struct exynos_ufs_uic_attr {
 	/* RX Attributes */
 	unsigned int rx_filler_enable;
 	unsigned int rx_dif_p_nsec;
-	unsigned int rx_hibern8_wait_nsec;
 	unsigned int rx_base_unit_nsec;
 	unsigned int rx_gran_unit_nsec;
 	unsigned int rx_sleep_cnt;
@@ -199,7 +198,6 @@ struct ufs_phy_time_cfg {
 	u32 tx_gran_n_val;
 	u32 tx_sleep_cnt;
 	u32 rx_linereset;
-	u32 rx_hibern8_wait;
 	u32 rx_base_n_val;
 	u32 rx_gran_n_val;
 	u32 rx_sleep_cnt;
-- 
2.47.0.199.ga7371fff76-goog

