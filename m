Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DAE1BD007
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386853; cv=none; b=Rf0hIVWZ0U9mllsaXJ8LAzysGPQ1BlmZdphOqDeWF0nvM1iIOGTqMxZg4ry3zc2JBfklmuIVRGMLweC1YR/ixCVukxZDeS4v9O49lWKiQldbmgm6DdR9sOZW49KlZKhJwQZhQkPMkKss6TZfqaj4jQI4nVxpAETS123aOV4YfDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386853; c=relaxed/simple;
	bh=cgC00Z84GRqTAZwgtEtqtGHvbN1Ns7uMwFdz59+HA28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kmk+o4GPCsz3hGAIcPgy0CLOrwBpbIprDq53hG/2yK/Oc4WuB0PGjQGzX6s/kbhZGGxmH9z8etsDxZnwNGp/KA7+Me+FXrbKUlj75+tuAjEJCc+CV4nLAOPVCjjtON+dKPFoljuWQwNdV1GlASahdzFmIlwu0UE25AhjgF2UV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/rFZrhS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/rFZrhS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43152b79d25so9088005e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386849; x=1730991649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+843px0rCbg1sKJc99pP4x3dOG1mc5oHs0HJIyYuQ44=;
        b=q/rFZrhSfcwcuHKJtAz4QMBdRxnNFvdnxVCVuQjDCGHhYf7/urQQNvPLSeQkXzoI5N
         B4gBFcmDIKX2Es299zhIgnXySaNaRO4M4MCU6QqCT/iCzSjcWugD/orFTHLLX9p0Ygrv
         Dy94Fy5dDpvfWNscJw7EDGV1zfGjDdVbhl4s0C9bMtMTegRS+xKxfvWu7KhH4fRHAMzc
         TJJe2iZLaPWTeuz6SuNGVTyxp6zF2MF5rJSoDnWYNe2S1rX4Dx7ME+ngONWrdJOFddqB
         AHavRboyX8vtqYMsbK2tIsHlFyUtZWr9YiOLcggYEC4Ewq+sgFxDaBPflaJRk/ytgT/I
         bsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386849; x=1730991649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+843px0rCbg1sKJc99pP4x3dOG1mc5oHs0HJIyYuQ44=;
        b=BNXocXbVVYgbBbTVMJa0GYEn4x//LSgoTkawTc9jJBizxSfv+dql5eeZgvOdp8yFcf
         FF+mehYSy8nQg0wRvGFZGuXjcxfE6FqJBRTvnJSOHK54wUxf1Hik+KxOGGS5ov9B/m+c
         +LYm+S+8J3wfX1XGKg4xREKBjFKaANvTdo3j/oTIvgMTljr+t0qy59wTlA8KS9HZmWzv
         b2KNqQnzoacZo6KzQqAs5T0xeaABtiTJTTTwohJlBPL1YfBtkPVhTVRzs4l+RXPdA/34
         fMwyTeJXBenpr6278ZvXxsMjtATI93/0QOsiBylEeWOomij8/l6p72038SqfXD8Vhjtr
         g3PA==
X-Forwarded-Encrypted: i=1; AJvYcCVGbJsPTwUb9Oxt8bXf5OlpjfaaZwkRlsuX3MNTl1w0BWOYzaf71v5irC+hs9PjJrm1MZ+7JvqBnzUd2L9tMrnRDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+cn/9CMuCyX56LK6xREHc9abuixBq7bnFMprf31/Iz2RvN9fB
	a/uya1kRUQJo1lXg5qbOBwq7l7TEa+II6HKDquqFErj1JkUMm1845SvpKjHUtaY=
X-Google-Smtp-Source: AGHT+IFz1+UYr4hSStn9sPc2pavAOWRlpkPtO9pHTEtEu9q/PXw/hM8RRdJlrb371+ewLtzLK5Lt6Q==
X-Received: by 2002:a05:600c:3587:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-4327b6f464amr27709765e9.6.1730386848476;
        Thu, 31 Oct 2024 08:00:48 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:48 -0700 (PDT)
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
Subject: [PATCH v3 09/14] scsi: ufs: exynos: add gs101_ufs_drv_init() hook and enable WriteBooster
Date: Thu, 31 Oct 2024 15:00:28 +0000
Message-ID: <20241031150033.3440894-10-peter.griffin@linaro.org>
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

Factor out the common code into a new exynos_ufs_shareability() function
and provide a dedicated gs101_drv_init() hook.

This allows us to enable WriteBooster capability (UFSHCD_CAP_WB_EN) in a
way that doesn't effect other SoCs supported in this driver.

WriteBooster improves write speeds by enabling a pseudo SLC cache. Using
the `fio seqwrite` test we can achieve speeds of 945MB/s with this feature
enabled (until the cache is exhausted) before dropping back to ~260MB/s
(which are the speeds we see without the WriteBooster feature enabled).

Assuming the UFSHCD_CAP_WB_EN capability is set by the host then
WriteBooster can also be enabled and disabled via sysfs so it is possible
for the system to only enable it when extra write performance is required.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: update to new drv_init() protoype
---
 drivers/ufs/host/ufs-exynos.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 378c16d905c1..d59e1933b64e 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -198,7 +198,7 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 	exynos_ufs_ctrl_clkstop(ufs, false);
 }
 
-static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
+static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 {
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
@@ -210,6 +210,21 @@ static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 	return 0;
 }
 
+static int gs101_ufs_drv_init(struct exynos_ufs *ufs)
+{
+	struct ufs_hba *hba = ufs->hba;
+
+	/* Enable WriteBooster */
+	hba->caps |= UFSHCD_CAP_WB_EN;
+
+	return exynos_ufs_shareability(ufs);
+}
+
+static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
+{
+	return exynos_ufs_shareability(ufs);
+}
+
 static int exynosauto_ufs_post_hce_enable(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
@@ -2120,7 +2135,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
-	.drv_init		= exynosauto_ufs_drv_init,
+	.drv_init		= gs101_ufs_drv_init,
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
 	.pre_pwr_change		= gs101_ufs_pre_pwr_change,
-- 
2.47.0.163.g1226f6d8fa-goog

