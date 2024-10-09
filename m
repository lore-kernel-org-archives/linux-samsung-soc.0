Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF245193438
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472922; cv=none; b=CbfO810AE9sVwFemhf5Om6gxMmhE3ALS10VY+DNXt1noudMmgzSEzNXkOw6F5O3jMET4IRx/S1Kuy0K35nUKwVanYVMhHFaVtpG3Y1auJzFthF4VFDB243JXmoz4ayjqVCB0xOBDFaTVyFuIjT5KDxf4KsH3UTJm8Zuxz7s6950=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472922; c=relaxed/simple;
	bh=JxNG6eDRQStONM4tz52v0Ck91QG+AO2DWVUc9ANCsYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ip517HPeVLXDouhda3Ihkok8YbqdspVxYmr+sE1ZE5HKsaU+glBz9dFSmQEiZILtxpIzAFLnBEFVe4X4vbFHJ3TC+qVaIMaP9veNxAumeGDo8kKyt+1fxqvg45BJnR1i6PHAFgxQ3YQ8+ofUZwkmb3n3D9dMFBckCCN0/U5Gl8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIvYHbmL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIvYHbmL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso59542055e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Oct 2024 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472919; x=1729077719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DpEnA3YplEcQFI6shVCtQMIfbctSRU8+HvPgo32UcY=;
        b=nIvYHbmLfZgeRoYnHLkBTeImPy14vEevv0QP7RkkwhOXCB8s4qH18Fc39DtzEjNLBl
         I7NG22DlWetJq6E5CzfvPpstkCLGdLFSJ1JA1Yp27fWIi/wddvVUkClD/SovTnVsGzFG
         Iqlf5j2E2zZsojo3SkoNHr+AtK6PrfccKtDHAvsDvs/z8FEsVrYoJmbEJU5BORWduXB0
         9ZEkJbpFj+Uor+/+SKx3KK9UH+welIL4EhUo3vI6QHECtx+4i2LeF5NR9b/v8j5cYpiH
         w2Ii4tqJMQBv9I0O3h85MiD1YRcaY7zSe+kGczQn8AjOeEb98CdkbTGigikj++THgdaq
         +mWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472919; x=1729077719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DpEnA3YplEcQFI6shVCtQMIfbctSRU8+HvPgo32UcY=;
        b=wmXCPARdNu+FAfn1C0zXTt+SSKA2cIG1gWdKezsPE1aNPhCqp6ifFS5ICGC5igyDlh
         AAAlLlhqyOyUPl+9JX/UOVTDAIj3T63GM9avCvS7Tty+0+809iCW4yAvKFmCGG7wkRbJ
         XxWKqDKUU8s7byv0SMOoA6NlQdE2TDGyMsfHH4yAU0yVmQVaqdIGdOm23K5dPBa8ugQs
         SDYHmmNE/8Tqr9HL7HQSjM8Ydv9x8yx9+aVdmLNR15geljiaYuDGp5G76Ao4TEXLK+hk
         Nfi1teDcP2DW8KSsxp3mqTMk1G1fH9VYCI/1Qw28iYemFuwBfXlCuz52alTdyB9opsHo
         cdYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Q6E1rvzsPkJDhbNpUC9lDIAcxlKz+HrCOBh3/Uqa5M9vykSdQ9r54GwIlQQsQ+2O9+U5wG44UfSu/bDJosLijA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+B0I1DKEVCHxeBVfsNvvTM9nRDkgO5Qq6GMANVp6Y7D8mDdO8
	hS/igga4lti5+ooTQsNYl+rSwTBN9/YYXWtpoI0DDwRH+ecBg80ruXJAn1m6rR0=
X-Google-Smtp-Source: AGHT+IGuNlqf0UjHLa+gCSHuJwmN6aEEWrwupvo8fc+pj3U1PFfl1qX4v/XDeaScMudS3KJA7vTNzg==
X-Received: by 2002:a05:600c:4f48:b0:42c:bae0:f065 with SMTP id 5b1f17b1804b1-430ccf041a5mr15501335e9.5.1728472919068;
        Wed, 09 Oct 2024 04:21:59 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4310c3dcdcbsm12331445e9.0.2024.10.09.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:21:58 -0700 (PDT)
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
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 6/7] scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
Date: Wed,  9 Oct 2024 12:21:40 +0100
Message-ID: <20241009112141.1771087-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241009112141.1771087-1-peter.griffin@linaro.org>
References: <20241009112141.1771087-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firstly exynosauto sets EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR so setting
tx_dif_p_nsec has no effect.

Secondly this assignment can't get executed as samsung,sysreg dt property
is provided in for this platform. Meaning the execution flow will return on
regmap_update_bits call above.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9d668d13fe94..d4e786afbbbc 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -205,8 +205,6 @@ static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 
 static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 {
-	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
-
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
@@ -214,8 +212,6 @@ static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 					  UFS_SHARABLE, UFS_SHARABLE);
 	}
 
-	attr->tx_dif_p_nsec = 3200000;
-
 	return 0;
 }
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog

