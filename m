Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E43145FE0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714134014; cv=none; b=D5+LrdOzx4HontQ8PuAsjnLv25U6lsxAuDz29qU7ThTO6rPZjlytkOQWExZAnuMDOigN4h4Ej+xBSx+8vKk+HnUavihJCuvEauAuclHkYppKitkhvJsex+CcP9el6KFySysmXctT7eqMhyVgxuZxBM2mg+FKGSmpuGVOdNHSfqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714134014; c=relaxed/simple;
	bh=Lo00QN3orvBLO9CxiZxmwFW61cBpMvV5omccjpwyRtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JfYNidfcR38xPMQaQq3kDLKr2zwHZxKDKj0P5ARTJ+bk8X171i3wMIS7OdvXrrrAuKNq190Jddo6n9rWnnpgTecLV8BEZxj6Nt9YnikMBFWLgVYDAdKm8pAevqHgtoxmTkBpo5xCVSl9ziliDtRFrv/GiF8CVtZdu3TnfM8pmtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hA8l2oZ7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hA8l2oZ7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-349c4505058so1474760f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714134011; x=1714738811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGiBT+3rLHUSe0fCpI84iZd1Y9xr9GwhBK0cp1D0rYM=;
        b=hA8l2oZ7cOk7LEkLzQKrY7eerivwyjjSLyJDuBPfjK8tbnKx+Faca+WLs8KhMjvsAT
         L8qcQFN5AQ1A8Lw2jbBjYo3377zKwMT3dB3NjE9/9HKqBNgx0fZ6qgqlwOBCoxVNcjtU
         IlpOHs69huMnNWkjqY0+Ej4aV5xld9P97jP16Pd3OXPW87tAz2w2zhxSlUmM6kc5znsU
         TIozRunGTDNN7QYDPpvlptFCuTfyuVL3R/0xNyePVoJeFrLAuGqwWsdqDkf2r/eAKE4p
         9csqy3tcMMnkwd2aS3zIzJzsWgevHDadAXFbSgOpd+8LpSKaQM5QAhRiwVB9VEXcokuu
         /oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134011; x=1714738811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGiBT+3rLHUSe0fCpI84iZd1Y9xr9GwhBK0cp1D0rYM=;
        b=BImK9WoHTDEsv0rVFqIGPNF4860mJsSB9hFuJ0fo0UkeCXVmb3rhyE8Ref2h6Zc0nv
         cE+FV0qFPSrsSxE9u0jytVU2oRn0aQBNB+U2uR/7R3u663KQ33vmsX6qlgfmsDOfir1T
         pnTwH7/MCIn+hZDmtTBNNuyjYUbm5L2lGwPqUMsiIXbmUISNnwOCp7Ln4Q1aLorkZ2vX
         v+Kqb6oi/2wAVkU6vwtxKALuceCMW9jqjueeifdWnoM7n56XrV0LywRykBYCQzHActB9
         83Qa6YexnIR5R6lTHm3sS0mfdr1Tg1O+STmMnJXFC3hOvIdoRrKNcFoXt2nII3goqSfr
         pW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVW6y+nAhyhmmCkyhrbWgzuIwsl5w5czBtYOSK/zxPBzTOJgIPlf4pQ2AdXPVEuJ7gly/unyGs/XWkjXUgedjcw8glZNnDIUsL3KwdW1h7yCNc=
X-Gm-Message-State: AOJu0YzLzZWFfonZT7ljvtMBkeMpw4NNdLMz2+LIZ3hYnJycVaB+NZkt
	dv3FPUYz7NPglvCcEZ4wiyFdV3D9/lI+b9vHbkwN6NaKReQgvugepFwybStbxxo=
X-Google-Smtp-Source: AGHT+IFnZl64tUcUlk94yOZUNVeflszVkGoOajT6n7ta7tcevMv0Y3TwjzY6xunY4Vmk8prFor+Gjg==
X-Received: by 2002:a05:6000:1886:b0:34c:6798:13d6 with SMTP id a6-20020a056000188600b0034c679813d6mr1086457wri.43.1714134011175;
        Fri, 26 Apr 2024 05:20:11 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:63cc:9bae:f542:50e4])
        by smtp.gmail.com with ESMTPSA id q2-20020adff942000000b00346bda84bf9sm22478146wrr.78.2024.04.26.05.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 05:20:10 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/6] scsi: ufs: host: ufs-exynos: Add EXYNOS_UFS_OPT_UFSPR_SECURE option
Date: Fri, 26 Apr 2024 13:20:00 +0100
Message-ID: <20240426122004.2249178-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240426122004.2249178-1-peter.griffin@linaro.org>
References: <20240426122004.2249178-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option is intended to be set on platforms whose ufspr
registers are only accessible via smc call (such as gs101).

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Will McVicker <willmcvicker@google.com>
---
 drivers/ufs/host/ufs-exynos.c | 4 +++-
 drivers/ufs/host/ufs-exynos.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index e8d3302f6df0..66e52c3607e2 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1186,7 +1186,9 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	if (ret)
 		goto out;
 	exynos_ufs_specify_phy_time_attr(ufs);
-	exynos_ufs_config_smu(ufs);
+
+	if (!(ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE))
+		exynos_ufs_config_smu(ufs);
 
 	hba->host->dma_alignment = SZ_4K - 1;
 	return 0;
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index a4bd6646d7f1..0fc21b6bbfcd 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -221,6 +221,7 @@ struct exynos_ufs {
 #define EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX	BIT(3)
 #define EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER	BIT(4)
 #define EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR	BIT(5)
+#define EXYNOS_UFS_OPT_UFSPR_SECURE		BIT(6)
 };
 
 #define for_each_ufs_rx_lane(ufs, i) \
-- 
2.44.0.769.g3c40516874-goog

