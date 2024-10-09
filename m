Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA7192D96
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Oct 2024 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472921; cv=none; b=HOWzoUSJ2wUh74O3cQr6qJklmFg48X2Y2dBh2usZ97VKZvvuf3EY2Y51MoEiMhS5jXENXTaPuutmBp31/6YQApVZ0Oj6xIK4cRx6XsDqCapAHyXw+eEUGmJCzZAA6cdGCe0HpaiPPKuhgMngsu/eyEQaSlzB9Pt7Z8zBp/lxb74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472921; c=relaxed/simple;
	bh=C68am3iNWJR/rEFnqne67c0Zba3n0Keq3E55e13RfNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XCam3mlOLRVjpCVfmXZLl+pJB9vwF5NFOHn34bbYwVh3cMfoF8r68NgsyAMmxRnYTkpPIEjMZdt3Yv8oRoU+GQMoLFtfxN/h174y2PZpZ8uBAtyg3agVSIfYYdgXwUCYI8XZWhXZnCzCUuUbaTi94TubQRMhEhbd85swtM5wYFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yTS38Eru; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yTS38Eru"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso67910295e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Oct 2024 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472917; x=1729077717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yc2bquJWnC0TuLEtllIK7qV555Ljs382cn6kxswI5k=;
        b=yTS38Eru7AFKuuEvVyBK5885GwsC9/wIRE4ZvNrZ+1IvjjowphVw+xeMYg/VjZYddw
         oO8TFXo5OF1t4XPSAZPG3u7GXTSSSGwtPaDyUZxIMdIQNHekXydwDRV0hW4a3DNBL7l3
         8cRCPiQPHTOL8ItAqEaZpvBPSiS1oGEcQk7/H6wyxgpV2vdIxMpMzv+j+QeBsOT/XmMI
         jlsxfObYCNFot2/D+HH8QbMpanJDQ7YaZKkoJ+D/ekvULjzPVFdWXbsBV4XO7nshxZAZ
         vFb4N21uWFb6CoM3eKA9kPNN7Let/GkyGVPwDZ9ZKMmu93exXzCzgKLf32ebwPxsRyEV
         du2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472917; x=1729077717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yc2bquJWnC0TuLEtllIK7qV555Ljs382cn6kxswI5k=;
        b=VOakn6lr8gm9/Aid2H6MNjU1DHecoJ5Ae2FG9TWnhTNcA/KVbCoYg6GLDwpYtZUWkp
         gZD3TPD6D133Qbv4yLOP4PGX8PGFKPoo6Xt+pfnD0HDnvnEUuf4joDP1YT5pUrPP/NQE
         YfO2wfHmiVJltBb44F9yPzbAzABLJlv3Uf4e7HwRSdnOL6YgWhpbN9Vf2F+Njq2wZUOm
         6Qn3q+yuSV1vysZgjDijAnpfI+tA47o4CaPan1uz8auebnWbi2LbZXn8mxlocrNdy/nQ
         voF0PotwQ6J5SuzWAwnB+cWSx4nwGgMAvfg6ut5OQb/WCjDDIkbMPOK06SqYEr5kaeZ+
         692w==
X-Forwarded-Encrypted: i=1; AJvYcCWC/kQtbhE0ZwSO5Tys2lsx5pGtMlvDHh5YP4W/Fvx79ji6Hu4FvvJUc1YiMESwIdVbwb1y9wQycBVaFUps1y7EYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGWo2GS5OARlwCHxsernDaLYNE5olftwSOG/ME0/49pf85CoGE
	cJnJuAz4DB7g8sBS4LxFA7jjRHssQgTkWXDqFc1H6MWFmF8DbAjvCROSwq5SxTU=
X-Google-Smtp-Source: AGHT+IGVIzAhsUABVyJOyEwZGVXwYpzikVWau3b/o+ECvGcy7vkekMhISm+whoMp+we4FD4krW7kMg==
X-Received: by 2002:a05:600c:45d1:b0:42c:a905:9384 with SMTP id 5b1f17b1804b1-430ccf4affemr14524345e9.20.1728472917542;
        Wed, 09 Oct 2024 04:21:57 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4310c3dcdcbsm12331445e9.0.2024.10.09.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:21:57 -0700 (PDT)
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
Subject: [PATCH 5/7] scsi: ufs: exynos: gs101: remove unused phy attribute fields
Date: Wed,  9 Oct 2024 12:21:39 +0100
Message-ID: <20241009112141.1771087-6-peter.griffin@linaro.org>
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
2.47.0.rc0.187.ge670bccf7e-goog

