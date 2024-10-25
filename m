Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6221632F8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862093; cv=none; b=e4vQpcWDmRHWU8grkfiCQyVEc8anRPOC8nxz0FosG678lU5CEbO/kHNxTQ3eMhgh4CCqhE03m1yl9oQ3sgcq9C/vvFMkS1jmRjRSB6nJo6oiOFKNOGIWD/CCzZO7bfDeBZxZvgLUySmlbry7oyeK6kfvycy2xjSzaDnyXVqFoYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862093; c=relaxed/simple;
	bh=XQJlYvZ6vjn/TYO+WTDp4FMJOckllIU+bQgG44hsbCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeV+9LpS+7gfhYcuAgYvL6bG4W9lb5SXikqM7W1WftoQtQpawLbs/b+LDtrQcOar+erpDfmrwAK5sOiaPUT0jWF+5iP+OpXJ2RvjaRNNX/K8Vpit198pookDDaUDYsydY3EYe77PPoN+CKMeXOF/yQTM+yB7HmaJszdwOZ1FRPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjrK8CEF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjrK8CEF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso19939805e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2024 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862089; x=1730466889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mphjevL2wKBjhbt7qb95YXVF8X2HJNmvgdrJOySayeQ=;
        b=HjrK8CEFsT7+nAKDWnRBRB2T6DBSkrHLSjY/jqMzO3BzpbnjiWnfFjJYc8SerbXt8H
         BSP6bKWlOHvnOR8HHaRMYEDfJATtFBP9butVVIm6K/ASn0ta2qL6htUkAbyDvFmngLEy
         zVfhw2IRJog21N851OCsroQLPwUkqL14BUbE1ZpMZvPMES6VZ/jR4iqu/d/WJcoBAGEU
         UfS+MMQEdusjlNs9kdpf8VyZq55diapcuuJikVexH9R6sB2dya333DE955Zgx1P85nxC
         kyAfNtFSs6Mrp1ZaWa6pGex2mLx1FcsJCZg/LUED58WYlrlW4rNDCLkzlgfNObkjNfKF
         J3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862089; x=1730466889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mphjevL2wKBjhbt7qb95YXVF8X2HJNmvgdrJOySayeQ=;
        b=J2c8V4YV3mQajt0mEh806ILCM5gUu/tE8TNlhiSAra7+CvDu06J/1ffyNWeL03Ns5N
         1MTHQSgTq4T24/n8UzXRHOtsVorpWbDO14PgvG1jtiVZPpDXLlZXPa65m9cLOfIzV5qH
         TvTJvFt4YcUhyuS5F1yxVZ6QYDRGxubK9+zu79+bppSJVnP1trd88U8fCwaUc2bVq+6p
         BfoG5pkhqVc65uzAvztrEhMddesUgh8tdP8ddfxYITvqLkD4yCZF0CHe0JZUSJbpKcAv
         1Kd5t8zi79vXcBfIz4CSoQAuw8+UQLZhu8y66RqtCHM1aYeOC3lyPNHi+dOhQAk2g1Qc
         StMg==
X-Forwarded-Encrypted: i=1; AJvYcCUEu4Fv4SyNbSmikRsH2t2CilVl+tCivHuYeIoXFAHtcIfUhebmZTo6Z0WTpwNMl6eQEiuAT1XiedmdvBdGRNm/aA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzVA8JVQDI3WlXt9p7GgOhspjjPR+x949Oc3IM1ca2N2j21tbH
	0mxxnteYi51LgmwyFpWn9BDxW1kaRKxGDX/fVGk4tS18FWrsvihymuAY9ol2ZVw=
X-Google-Smtp-Source: AGHT+IEoUmmF2a29+b6OYTb4dbCjEKsfEZfPzHCBO3Ytnq8YsVvh+s+5uHtHvSiBw8IREAZ9aiGHMw==
X-Received: by 2002:a05:600c:468f:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-4318c73a46amr48990985e9.25.1729862089150;
        Fri, 25 Oct 2024 06:14:49 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:48 -0700 (PDT)
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
Subject: [PATCH v2 01/11] scsi: ufs: exynos: Allow UFS Gear 4
Date: Fri, 25 Oct 2024 14:14:32 +0100
Message-ID: <20241025131442.112862-2-peter.griffin@linaro.org>
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

UFS Gear 4 offers faster speeds, and better power usage so lets
enable it.

Currently ufshcd_init_host_params() sets UFS_HS_G3 as a default,
so even if the device supports G4 we end up negotiating down to
G3.

For SoCs like gs101 which have a UFS major controller version
of 3 or above advertise Gear 4. This then allows a Gear 4 link
on Pixel 6.

For earlier controller versions keep the current default behaviour
of reporting G3.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..e25de4b86ac0 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -771,6 +771,21 @@ static void exynos_ufs_config_sync_pattern_mask(struct exynos_ufs *ufs,
 	exynos_ufs_disable_ov_tm(hba);
 }
 
+#define UFS_HW_VER_MAJOR_MASK   GENMASK(15, 8)
+
+static u32 exynos_ufs_get_hs_gear(struct ufs_hba *hba)
+{
+	u8 major;
+
+	major = FIELD_GET(UFS_HW_VER_MAJOR_MASK, hba->ufs_version);
+
+	if (major >= 3)
+		return UFS_HS_G4;
+
+	/* Default is HS-G3 */
+	return UFS_HS_G3;
+}
+
 static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
@@ -787,6 +802,8 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 	}
 
 	ufshcd_init_host_params(&host_params);
+	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
+	host_params.hs_tx_gear = host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
 
 	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
-- 
2.47.0.163.g1226f6d8fa-goog

