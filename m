Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2552D26D5C7
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607466; cv=none; b=kdec6tsUL8OvsAo/3ORskfNOcY2hHRmyAnzggW6Aa6lfx+O9SeMkLFAvnLtkW3AZA+mKnx3+n8MpQIchgph0eqjvXrYsP59XOium/ilpyEQBLsO20oqIJmWaNiC0Qw25QbfWEi8u0jtTYSC5St/x4zcuaiYEslu+V7UuTdCHe30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607466; c=relaxed/simple;
	bh=j11zUNL8DaXtAVtE/snPqF5Onr06Krz4w58UrTjUNi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWSfy5VR+HtnIxfCUMdrTNy8KFoKLKVoCQ9I/QpR5eVgQITys8M5fXHyb4g6Sn8Gl4om+LSGGwuaLbVbz6zOnZl7FrRnjWkrXgBzkfwaPeIs5QP0X9VkFxOgsyZBYWrMLUrnNlM96X17GKobslCjDGQo9m1KGHlItVLBcbxZVuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L1xX7p84; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L1xX7p84"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220ecbdb4c2so5380475ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607464; x=1741212264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRep6X28Bs3ILjeWVZF3puW1Rh7I5vgNM7w/7EHKDA8=;
        b=L1xX7p84EFBOwWFBtROqiSK9KjcgqdUA/W/Tt3EEMkUzxTIMT0jyRW0mPuDEut/rKV
         JoFL3nCUgV+9s5BV9i14BKRTtqkudvxBPiE5HpLg8vjdocHBYml5u0b5/9ug3qgm1i/B
         EvFslqSmyIJJlEqeeCp/e8slKRp4GSXF71MdPl6E043ScLubU594yu3ILUTviYEAtQTO
         UMShm9B9pJzpg+MkJ1KIDZ4hFaGZ+vJ9YmWu/c226I7zI9Wsj7g4wiq/OEeFRTLxOk9y
         u/uDdKZ8ZpAQALY8fCUNlO6HtgieEfzL1tj4fujDDkr8JNkwko8Q9yd16K1EX8cvt421
         ybvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607464; x=1741212264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRep6X28Bs3ILjeWVZF3puW1Rh7I5vgNM7w/7EHKDA8=;
        b=HjJTzduoWyNSwvf06aD0WOb9G0r0+lKr9/VAGqxyu+i4dXmwfB7znjObpEf8HPWHJo
         wUrt/oOLtgG4S0Iq//jFMFuRi10tfvcbNSZxmgwAPWbQXzzCc9ylF1QH3lkOng91X/Tu
         z8Qb6bLzdN9l/azM22OQgIk8zu/Fx9bg9mlDGmB94do5hIuK1DsPYGrNt8UoK2zbjl+1
         HuSQ4FvZsfyr2owlWCdvqNosE6o86Tc5ASkpl/qXxsRXBrxX9OzdchQh3BluK9eJiaf7
         CN8SXKtkTDs0IhKp+L7IciUwmDQBMbFNR2dWFLwWDHya73XhIfCXsAd1VnhN3wp6ixb1
         Qc4A==
X-Forwarded-Encrypted: i=1; AJvYcCUw0yEjc433yjcLngujLVzj/CEsm0w8BRB31oRCc8gfGhAu74pZny7v+1zJMR14WOM5b9O0lqejC1gtHHr7iNgB9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZmSz/3iamPSLqeZWH6AR5G0WJqzEdEErmV+oh67eZA4YvN5mN
	u2zXjtOUJ/Y+tSGHdpJqX5+U5ciqo+1Ii/Kcz0gQkono++VSgUuolZIM1p2U/5s=
X-Gm-Gg: ASbGncvyQo/O6nvJzQxi3sC4PFkH6C4QNsL4xKyTJeW0Dw9Md2Ar9p0Q2tsN9YlMZ+J
	ztB4DHHrFnEdPDej4VNjS1dl0y2ZpP6JCBtdDd940DBepFpPTxRvk8KOXWwp0Y18Y2AUX2Cnkcc
	NTCzuRy5Jg/9n2XqLVLZYGUjpSEnWDYDc/H4GP7xBO0ZOYr3j35PQ7SigU6YX8xvFbvz0lUBBqf
	Ce4W+kNHNJoWJah45PCzJZ5ADqEILizNPvN5Y4nud8yteFGvk3FDwJrbgmqGA48mVYz02sReLH1
	G6fvqTijmAVxAo4konyQpq4m1H69kmBYSqAsAMgeMfI3p7703zdNwHZt
X-Google-Smtp-Source: AGHT+IEP9WBpfwUfNjcEv64MqjMjEFYBNBNT2/2tSm8WD1uShhaDmBPXB0CLzQORfjn3hNPrTtyIxQ==
X-Received: by 2002:a17:902:e752:b0:223:397f:46be with SMTP id d9443c01a7336-223397f4a55mr41038145ad.47.1740607464373;
        Wed, 26 Feb 2025 14:04:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:24 -0800 (PST)
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
	Peter Griffin <peter.griffin@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/6] scsi: ufs: exynos: move ufs shareability value to drvdata
Date: Wed, 26 Feb 2025 22:04:10 +0000
Message-ID: <20250226220414.343659-3-peter.griffin@linaro.org>
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

gs101 IO coherency shareability bits differ from exynosauto SoC. To
support both SoCs move this info the SoC drvdata.

Currently both the value and mask are the same for both gs101 and
exynosauto, thus we use the same value.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: d11e0a318df8 ("scsi: ufs: exynos: Add support for Tensor gs101 SoC")
Cc: stable@vger.kernel.org
---
 drivers/ufs/host/ufs-exynos.c | 20 ++++++++++++++------
 drivers/ufs/host/ufs-exynos.h |  2 ++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index cd750786187c..a00256ede659 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -92,11 +92,16 @@
 				 UIC_TRANSPORT_NO_CONNECTION_RX |\
 				 UIC_TRANSPORT_BAD_TC)
 
-/* FSYS UFS Shareability */
-#define UFS_WR_SHARABLE		BIT(2)
-#define UFS_RD_SHARABLE		BIT(1)
-#define UFS_SHARABLE		(UFS_WR_SHARABLE | UFS_RD_SHARABLE)
-#define UFS_SHAREABILITY_OFFSET	0x710
+/* UFS Shareability */
+#define UFS_EXYNOSAUTO_WR_SHARABLE	BIT(2)
+#define UFS_EXYNOSAUTO_RD_SHARABLE	BIT(1)
+#define UFS_EXYNOSAUTO_SHARABLE		(UFS_EXYNOSAUTO_WR_SHARABLE | \
+					 UFS_EXYNOSAUTO_RD_SHARABLE)
+#define UFS_GS101_WR_SHARABLE		BIT(1)
+#define UFS_GS101_RD_SHARABLE		BIT(0)
+#define UFS_GS101_SHARABLE		(UFS_GS101_WR_SHARABLE | \
+					 UFS_GS101_RD_SHARABLE)
+#define UFS_SHAREABILITY_OFFSET		0x710
 
 /* Multi-host registers */
 #define MHCTRL			0xC4
@@ -210,7 +215,7 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
 					  ufs->shareability_reg_offset,
-					  UFS_SHARABLE, UFS_SHARABLE);
+					  ufs->shareability, ufs->shareability);
 	}
 
 	return 0;
@@ -1193,6 +1198,7 @@ static inline void exynos_ufs_priv_init(struct ufs_hba *hba,
 {
 	ufs->hba = hba;
 	ufs->opts = ufs->drv_data->opts;
+	ufs->shareability = ufs->drv_data->shareability;
 	ufs->rx_sel_idx = PA_MAXDATALANES;
 	if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX)
 		ufs->rx_sel_idx = 0;
@@ -2034,6 +2040,7 @@ static const struct exynos_ufs_drv_data exynosauto_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
 				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX,
+	.shareability		= UFS_EXYNOSAUTO_SHARABLE,
 	.drv_init		= exynosauto_ufs_drv_init,
 	.post_hce_enable	= exynosauto_ufs_post_hce_enable,
 	.pre_link		= exynosauto_ufs_pre_link,
@@ -2135,6 +2142,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
+	.shareability		= UFS_GS101_SHARABLE,
 	.drv_init		= gs101_ufs_drv_init,
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 9670dc138d1e..78bd13dc2d70 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -181,6 +181,7 @@ struct exynos_ufs_drv_data {
 	struct exynos_ufs_uic_attr *uic_attr;
 	unsigned int quirks;
 	unsigned int opts;
+	u32 shareability;
 	/* SoC's specific operations */
 	int (*drv_init)(struct exynos_ufs *ufs);
 	int (*pre_link)(struct exynos_ufs *ufs);
@@ -231,6 +232,7 @@ struct exynos_ufs {
 	const struct exynos_ufs_drv_data *drv_data;
 	struct regmap *sysreg;
 	u32 shareability_reg_offset;
+	u32 shareability;
 
 	u32 opts;
 #define EXYNOS_UFS_OPT_HAS_APB_CLK_CTRL		BIT(0)
-- 
2.48.1.658.g4767266eb4-goog

