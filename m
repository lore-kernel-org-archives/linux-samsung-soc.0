Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1326B08C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607464; cv=none; b=euki9UCpc4K8d0pUIg6MLWwwqTInkrCt3171y3zM39rBkxqHbAuO7/MsIkJpcq5sAT3ebcHQlplmLXJXkd/04lU8NI/t+IcsWa3lZoAfr4dGtkhMio+vrcLfBv8jgNfSSyncKswOPQoYj7tGOw73eaJhYXZK16pXKxlwxI7PwkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607464; c=relaxed/simple;
	bh=zzCHAyEKqRP94Nq6sEsgHMP78zfxlBlURkm2ZCY7I5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0X0K5DbhgxbGJz5WNwzJwyoWy3xp7Cb6sSPd1WYs/ESgSJlrCXvInM7zfrq/x32cWvx7MF0nSnvO0ZGk3/1iIpYJkTA1pBLpGDUWuhXREz2ITWlRkORij3Q1RgYFdKSy94nQ6BT1XydLbX+6HyPGzcA31O1H8nHEWTEIZredj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuRAUNYq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuRAUNYq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220e989edb6so6089855ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607462; x=1741212262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTcDz5+Yk2Rd6PndDa6YwrNqhNuGseEibA7R+3Q+jN0=;
        b=YuRAUNYqgVfywzeYfW+j0Lp4zAb+InAsfYR8RJnEnAryAHhuar6Gi9cdhjViJs8soL
         p+XTqU03rL3YUinttkeuwhvYDBYndftcQ1lb6JrayJWYaz767kT/7uSSqq4z3wDgWKw+
         tCNTZSbGkmHX0fdlTrrajQTQQ+ehAOD3ixMlGtJOJZMGY3XhMabTvcLIbIQa4rkvjvSJ
         fF9QmOj1dIRwAygKMwVXWm7oCmSnhZ3H4xNrRzbzfngxmnrYSIJAjlQScDmvXgIpDU55
         q9P5MI6BOq/HOO6RjNFwOhFij/cUQzMCamgQLxaDNE0Va6Uhysi7kn5GAc/x2beLnm5s
         Fytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607463; x=1741212263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTcDz5+Yk2Rd6PndDa6YwrNqhNuGseEibA7R+3Q+jN0=;
        b=C5O0oLRCFgxAcOMY58ZDyqd+dhv4R+KBtDgdTG0E3UMrog6nBQcqxeTSDKFupClhDv
         mB2vrhMA6eZp2rq2E4gIQurvfAac82ARXNBs+Ol7tUeFzBWS3p7xES6AP3biFIhJSKNL
         2TqS3w/YsbexoF3mkagtskfuAU2Xu6UlpRfR9ulc1uqTyT5GAtf7VIWywn8a1XCWq7GJ
         fqmiVUAPfOGHLqkFntHl4QPOpduAGqi/v1OoY1IW4Tr57p9kHWgxVbkRix5QeycUbMvC
         qg8VhxhO7hOjWtW2I5whfSPkzv0kSrlci+n80CB/OWlY6Lvzsa5SeXRk3zEHRYwfKR3P
         RQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQsST/cv9hUIHC88vZE4jjPFufhnLu5EGqsRto+A0nBAPDVqAvPN24GnRXCNFEYhD3jAHgYCphCTXhOEvcfgwDKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnjidAzrW9NQD8MLqaUvCogh1cYt7VZPZQlSEQd0RjePg2wiFh
	al27v5sEXQNcxb/CK+fGvmK1CGJdH/RG8DKOaKGDlEsaFFf/ERPCGdKw1zlg5lE=
X-Gm-Gg: ASbGncvtJsJ3M5Qlp/P/MxxCh2YqnpgqNEV3ow1roCGjzpb+k6+WVvxBASKzBFVjDQ4
	rl7XkLBuTaK+FNDgr/swX9q5KkhUVNSFv4cIqflmKwM50FvN7HrBbp7JeL5NrHLC3szLxzl3uyj
	2Zq1JEjnE4pjRs+7w0Ni3+pVVANGbZ0O1SE45FScJHFAZHABZJrf9B9xxmd29CGpPCNBKepXdoD
	8znHPpoYqRiCnQ4OFedO++uNZL5z7neIQf3czBw6JI32nAGY4rduyMZbmtY6rYjso6/pbzeBBTI
	gvwelgFo6dEhv9nt/Ir/kkYNN1ALM+hteZx+C7wuw5n2DopLolFzJQCP
X-Google-Smtp-Source: AGHT+IGveFL5jaPvmaU/Mebx9uyRVH5JU7x/sn/aSccHmWkURMmnvFmqMMw5M5iqYS+8/nz1Dtqa6w==
X-Received: by 2002:a17:902:dac3:b0:221:133:fcfb with SMTP id d9443c01a7336-22307b4bbcemr129932265ad.20.1740607462686;
        Wed, 26 Feb 2025 14:04:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:22 -0800 (PST)
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
Subject: [PATCH 1/6] scsi: ufs: exynos: ensure pre_link() executes before exynos_ufs_phy_init()
Date: Wed, 26 Feb 2025 22:04:09 +0000
Message-ID: <20250226220414.343659-2-peter.griffin@linaro.org>
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

Ensure clocks are enabled before configuring unipro. Additionally move the
pre_link() hook before the exynos_ufs_phy_init() calls. This means the
register write sequence  more closely resembles the ordering of the
downstream driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 13dd5dfc03eb..cd750786187c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1049,9 +1049,14 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	exynos_ufs_config_intr(ufs, DFES_DEF_L4_ERRS, UNIPRO_L4);
 	exynos_ufs_set_unipro_pclk_div(ufs);
 
+	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
+
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);
 
+	if (ufs->drv_data->pre_link)
+		ufs->drv_data->pre_link(ufs);
+
 	/* m-phy */
 	exynos_ufs_phy_init(ufs);
 	if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)) {
@@ -1059,11 +1064,6 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 		exynos_ufs_config_phy_cap_attr(ufs);
 	}
 
-	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
-
-	if (ufs->drv_data->pre_link)
-		ufs->drv_data->pre_link(ufs);
-
 	return 0;
 }
 
-- 
2.48.1.658.g4767266eb4-goog

