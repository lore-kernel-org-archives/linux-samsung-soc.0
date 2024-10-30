Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC221DF754
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 13:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294817; cv=none; b=A4H4ekAiLqilY9hBFWgrQJx3GTL46pgg2cLndEp/AglyEwVC5pSfWhzpHR7j2BiekqWyYcOQdQ1VoQkfmdxdAwX46K0/+xXzL140ZQkVUg+zNPzkIkgwztMujm90v9sHi+WxKIf+S8D14SI2Z6nnSg/8ZaC7tAUt6t5irVMGQi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294817; c=relaxed/simple;
	bh=AKIM1SvGVyzI+MQKD5g8HL9Q2VVl2NspIGwsd6hNljI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FK0ttvCT2cAZ4QtksPFDkm9Ss4x9ADESso/pED30ekpjpKkkNXKDfgUPnrG/carUG9H+e067D/9QJ/WqyC8P3XdzagOgBTqHwFcvZ5a/PK2KLOqO7FeuXVsPRFbT12l88sTEXOXFqSIe/YjfLEYU7weOvBlTnKiW/VlnuCbhmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bja6eSGr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bja6eSGr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so61478545e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2024 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294812; x=1730899612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUH2BZzthzEXo7hEUioBbWsSt3qoc+SC22xhMIafrmU=;
        b=bja6eSGreaWxeDaw5B0/liSG8bTmaG1CFEHXlm6kgcNdIH1xrBTZJ+XYCOX7uh8P5P
         e5y6wMmPXmNXjlN8mzz9APIDWFHhoKSXA0f7pvVPYhtk0ZylzTgVmqYXxQp9Wq1uct8H
         zm/ENm5K8fKF7r+7ntbWITZZyvOcNtCRgcULff6yLgfafIyfJNdqj6W+rg10rAH+ybp3
         yloizhviHDRDK6JsdfRUz1hvRlS7DAxsQtI7IQH5doOJxSrNqIGWAaJeV+vZhS2qNqmV
         5+ibDSUx4/HbwOh2E6y1H8lDjr97FzOWULzd3Dh+j7eGkNixsPNRKyNS5jrnKzXH0OHS
         zzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294812; x=1730899612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUH2BZzthzEXo7hEUioBbWsSt3qoc+SC22xhMIafrmU=;
        b=F/wZswqMmS3zJwuQsQNoisdIf4wIxSyTbA6XzUkvdquEX9EZOm/spU5UFc6hE0uirf
         dkkHeZqTb8kSwYSavPlJuWpwMp8UqiAir0hVscEFPYU0T+kKef0nl8hwMde6MemHbz0B
         rcMywNdmb8Ztp9V3wbm+CcsP01LbGip2mP0ua5s56AYvKWuh/VrMn2WHMty/QzSvpeRL
         NzzI0QCd6q4xmDECFYBJ1GRfGQLhHG3cqMxqtAi0Rqh/w66Go+CHaRzBRyVuUo6j5cHj
         7jdmyC5ttzgx3wr9Gl7IlPPvzPteLofkB4lY6UzIGLm2i5HRsaYQiBSGBgSZInYGS+mE
         Dv/g==
X-Forwarded-Encrypted: i=1; AJvYcCUSiaOXxHAEZ1FnaaNe795mGYam7qJ8yospwbm6DiQ5fYOrL0rfMtmV6kInmyHK7CadvsizQ0WD7sDnnSkVRtdO0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwJrfD9MtVX3vsJa1GXeAjiFtfIBaZdpoP5y/2rlSXWHd9mptI
	vr65PHpHcJeLxDGeLYX/YdAPQOUO3UsZjrcQPWLMq8N8qNutQb70dnsRcgV6u90=
X-Google-Smtp-Source: AGHT+IHIMdJDEaCeqIXymbskBOdadZaANy4sAJ7qeopzQzAgJpTpoJyPxtp9v9pMK+6XU1FesTsuxQ==
X-Received: by 2002:a5d:4602:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-381b7076530mr2335207f8f.19.1730294812459;
        Wed, 30 Oct 2024 06:26:52 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm15356836f8f.30.2024.10.30.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:26:51 -0700 (PDT)
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
Subject: [PATCH 1/2] scsi: ufs: exynos: remove unused tx_linereset_n/tx_dif_n_nsec fields
Date: Wed, 30 Oct 2024 13:26:48 +0000
Message-ID: <20241030132649.3575865-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tx_dif_n_nsec was used to compute tx_linereset_n, but the later is not
used afterwards. Remove both.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 5 -----
 drivers/ufs/host/ufs-exynos.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..91c09309c1c1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -548,8 +548,6 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
 
 	t_cfg->tx_linereset_p =
 		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
-	t_cfg->tx_linereset_n =
-		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_n_nsec);
 	t_cfg->tx_high_z_cnt =
 		exynos_ufs_calc_time_cntr(ufs, attr->tx_high_z_cnt_nsec);
 	t_cfg->tx_base_n_val =
@@ -1970,7 +1968,6 @@ static void exynos_ufs_remove(struct platform_device *pdev)
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {
 	.tx_trailingclks		= 0x10,
 	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
 	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
 	.tx_base_unit_nsec		= 100000,	/* unit: ns */
 	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
@@ -2046,7 +2043,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 static struct exynos_ufs_uic_attr gs101_uic_attr = {
 	.tx_trailingclks		= 0xff,
 	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
 	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
 	.tx_base_unit_nsec		= 100000,	/* unit: ns */
 	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
@@ -2074,7 +2070,6 @@ static struct exynos_ufs_uic_attr gs101_uic_attr = {
 static struct exynos_ufs_uic_attr fsd_uic_attr = {
 	.tx_trailingclks		= 0x10,
 	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
 	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
 	.tx_base_unit_nsec		= 100000,	/* unit: ns */
 	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 1646c4a9bb08..e64fe20d50c1 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -136,7 +136,6 @@ struct exynos_ufs_uic_attr {
 	/* TX Attributes */
 	unsigned int tx_trailingclks;
 	unsigned int tx_dif_p_nsec;
-	unsigned int tx_dif_n_nsec;
 	unsigned int tx_high_z_cnt_nsec;
 	unsigned int tx_base_unit_nsec;
 	unsigned int tx_gran_unit_nsec;
@@ -195,7 +194,6 @@ struct exynos_ufs_drv_data {
 
 struct ufs_phy_time_cfg {
 	u32 tx_linereset_p;
-	u32 tx_linereset_n;
 	u32 tx_high_z_cnt;
 	u32 tx_base_n_val;
 	u32 tx_gran_n_val;
-- 
2.47.0.199.ga7371fff76-goog

