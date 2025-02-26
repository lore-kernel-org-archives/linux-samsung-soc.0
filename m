Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FDE26FA64
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607469; cv=none; b=QZSPBuDCzrt8y4Mwjk8v0fe17D45XZn9xSbehwODu2Uc/ErWjhAV1xPXybi+hz/FJA93WtfEoxD5iu4w8RdeHjZSy6YJ/Ig39eTEHhjPrEZrvkaVCjkNsza5vqNSKQBwivWyK1/WGfqiB9xwbPI5Z2aWlRhEXyt3VL3+oxGMqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607469; c=relaxed/simple;
	bh=CCW/vi/idj6TZP9g/W7l1pZJSKJbysF20wfjKmqw31w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wp//iwIEFLgc9vVTxxXw2tCHfEzztWz7FT/oH9T5SUtZOny1Kk32SDPheKbQryvwfeOr+KNovg5VMEhYs2/VTayBpopWc2sAhXBDmer4yF8ZLMa/NR839CB59OkMLxbDXnZT/HDTdBtDcGxAeUgK/J1Ur+rxgtdYJfiS//Inrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pceV3xtA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pceV3xtA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22114b800f7so4405585ad.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607467; x=1741212267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWTKjOPYHYbBCUgjwCQAeP5e/oUzLq3t7mP4ZZ5O21s=;
        b=pceV3xtAIpkUCiw0uUrfr51u6u9YMS1RRCJV6CAUMT693o00mLse0yjyK9ToFuBu3R
         32SJynC9Pe1c/dMXxgLfrn+gNODLSs9Ys/cJpUrzbh2Ak4PscnjOIlIde0njH57GWjlP
         Z0iFhR4t0jgFRjBp6hYS3EBXo3JqNbKp+QiU1zj1A9ZEicwOPXjAx1r90Zt085ncYrZx
         F+oCHek/IEOLsGLFGdatwFlpLPJxCT504JBPKaMQ+o37znE3j37DPAcZ7IUCW+h2gsVw
         XA8JgpNd1OsoeupgNoPHKbkmXcRDw/ADRdYFdSGXBo/qKTa9AZ5tzGCxexuqgrEcUhq3
         5OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607467; x=1741212267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWTKjOPYHYbBCUgjwCQAeP5e/oUzLq3t7mP4ZZ5O21s=;
        b=cme57fePVPkO5WiKlivTW36gGdEV21QoBuSfy/qKyq0m6j/DA2vKgjymYaKT6hhgQf
         3ZCCLsBi4YDnF6oUictSwCjvfblrkW9ac6223lcIXBSParoOF0cCtEyhNponWLdjfoHa
         wVU77EfjeDQw/5KSfFKTTqsP+VUTYEaiM7GArFJjk8DzdUthCxkRQTlgfOn4G6H+g0FN
         TS42hvzrr0UwDl72ZGnE5GJ/xP8IEYg1UVier2jk8tuP/Yai/3muURDX54IoRwcnU04V
         V2w6q4Usp1qGWXYfPqurWjL6zzE4CNCTEhT2bHiqJabUPIUwXCP7Hly9w5PTjJaFHo5R
         WE3w==
X-Forwarded-Encrypted: i=1; AJvYcCUWwu3FgAG4bimyd3eVE4CC2QsrVzlQY/onpmWve9tBBRy+khLpeKLMdYj2JTEUUzNX7h9A88jOBfZILrQOdVtBtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/GewGIjNsxy7jHAop6clKA3yf0+WNtiQmub2U0eJTdxlkgb0
	7MPHALZDulUsUw5EgvO396qBtx4TgpOO6yMOUJoVbzXMtRKqXXoNLwupSK7rrEE=
X-Gm-Gg: ASbGncss8Dykney8uA2DJRRXwqIdBFGPfWVnaNw6Ub9IRXmYTn1sgujgCSn4lBqdm+O
	35ZmLUlPyc4eSPa/P9gY6rjqn9fhhC0R+fRnUq2gtOyUnrqEJDWBCtUMaAkD34HTTJbGvPflJEk
	5DtjP/k/CLRqhtwsK9i7ZQKN2OtKX0oiUPq0t+DYOYO7IN64u6VMPDKbrUe3PwHlppe59rYUKtA
	R8+Ur5/bZN4QRv1vd+IlNDkbMRL2FoTrONhKq6ZSLUa+aOwckpVGnBoU9hlrpKNWxKHp+T7IhQR
	qrLE7Gq7E0WAY2T1B5NY/qH1ou3UX7OWmqVur/JzXdJ+HMiKSMTJQvYr
X-Google-Smtp-Source: AGHT+IGCx2oLKcB5bpzVlnTDWzwAr4Blf9QYoJQocatHQosYv1is1Be436vWJXS8IWNGbLlM5P64xQ==
X-Received: by 2002:a17:902:dac5:b0:220:d439:2485 with SMTP id d9443c01a7336-22320094d51mr69995645ad.29.1740607467660;
        Wed, 26 Feb 2025 14:04:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:27 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
Date: Wed, 26 Feb 2025 22:04:12 +0000
Message-ID: <20250226220414.343659-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
fmpsecurity0 register is type2 (double file encryption) or type3
(file and disk excryption). Setting this bit enables PRDT
pre-fetching on both TXPRDT and RXPRDT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 943cea569f66..27eb360458a7 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1098,12 +1098,17 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct phy *generic_phy = ufs->phy;
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	u32 val = ilog2(DATA_UNIT_SIZE);
 
 	exynos_ufs_establish_connt(ufs);
 	exynos_ufs_fit_aggr_timeout(ufs);
 
 	hci_writel(ufs, 0xa, HCI_DATA_REORDER);
-	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
+
+	if (hba->caps & UFSHCD_CAP_CRYPTO)
+		val |= PRDT_PREFECT_EN;
+	hci_writel(ufs, val, HCI_TXPRDT_ENTRY_SIZE);
+
 	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_RXPRDT_ENTRY_SIZE);
 	hci_writel(ufs, (1 << hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
 	hci_writel(ufs, (1 << hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);
-- 
2.48.1.658.g4767266eb4-goog

