Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B318826E62F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 22:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740607469; cv=none; b=KKS2y6gj4eutsZJ7MgD17HwrTc1dcyQ06TWeZgkWyIR4oKIRXFXnFYU0p7dyhCfGHMYAZg9PbTX+Y5PbR43zA/MBLHE1ygXmFQEGFwMee8jNmdAQeen8ObVT/nkEQF3i7evzDXK/mYxaoWG1KXMnwaKhizACf2X6P8wW9EDk+wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740607469; c=relaxed/simple;
	bh=XD5vHpBRFTxxteEvRZ/Amzm2FaKpvRfB8H6AYjhg1D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tR/usvxa/y/z3p5ToIFLLQKpRHtDCGWgrRqF80p0OnPpgp3txdNAvF0iGxhb/5C2L+b9ns4KE2nWXL+6N2hjUCfxMTIo3pwYyKx5Rw+Dj9xhkYRqZ4LradJQLUAfjIYsHuRWxOou+5T041siG5k6lvrJ6ufSM+vBV6J7zjgC2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gMyC7EE1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gMyC7EE1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220c665ef4cso3433835ad.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2025 14:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607466; x=1741212266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqQVvrSG700cJ8ivAGfcs4D2QICVIKls7c2wPxYXgmg=;
        b=gMyC7EE1m+EpUlfi8P2iye5nBycYRLvHj9VIhmiUXuRPclAMNWlHaPT+lUwsGDX7sv
         5NjqLMD0lzex16YwaVbx4vmRYlE/jixnnH27RW8cSyeAIDvu7tqGX0q/sTSs2ZalMlWe
         Kd8d0/tZWEEvPj3pMqig19FWyeE7jYEAZm4bB1D24hnchC68Sy4o6/bHgK6EtDJZ11MB
         6aRnggH3QMbOgw7nAisf4dzbEhnds8BWcvWtDK36aGAFj4HV7VH1pap8rP0PCYWXiMTr
         /8DKCwNokHzsYXi6SGVqUL+ZwNwBpwJHzkXR51bVimteJeMCLsqvnL3YC/snskdQLI2H
         zrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607466; x=1741212266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqQVvrSG700cJ8ivAGfcs4D2QICVIKls7c2wPxYXgmg=;
        b=C69unFaAbUYYyOcTWtArPEIgI60Ibqk82HCiYXldntDVds6nE+ROlSSMahSKJirSq1
         QYS3du79CjRby3Qyf4HMsu+Yo5xXoxxGV+4oGhonuqFdeLoIBO6BfN2fY0CV6AfpoKxw
         NGSynvFncfh0qsRF5y6H1qqVQgTinJ/y10S1EIt3MmzyEiCmlt9SinBBdKO4Cl09bLln
         LJVY1HxEzkDO43k1W5tNbXWKFn6zJ4rnicd1bGl/rI7Y9s3bqktU5P4GRwwdDFmsPh7c
         Goy10ZKtF2sZKaWENoEqD7XtysxiacXtN0R5VtcPskCOiSrgIdnuvdQVKTncw1v2XoIl
         dRGg==
X-Forwarded-Encrypted: i=1; AJvYcCU5ZRVEDZsqO9IDIWYGaUSjWbL1VN8Tv49Cmer5GnD/GXx3FFh5vRm2vAdEYrrqIkDYHerKa00K15EX8dh1r5K0kw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZhm8m777EVEmslsESAosx1SE1Od2JYC+eeGUzTwlz9Byqm1wo
	df0paHYxRNnRD+pQi8Lcxvk8lXWLYHtlhMHWgom+zFfvk6dQG3I7KfXJqT5ujQo=
X-Gm-Gg: ASbGncsL/FSHHIDkYiPkUwt7vgSCuPvYK12q/y0HHlcup/f//ZbetMagG5FCG57W54I
	Rn4y8fFl8D73OCpFpW16nOwbrWPjjnh01CzXOaFKeeNcZe0DiKkDaSYJtRjCiT9PeX1deW4L8eR
	B8Sz1Ien9Wvli+9C3LWNb2q5K9wCCqiVhPl0MVgFmjBG43/asPe98hnFfe6wBEYerHnaDM7HskW
	HK3VSq3dtyuHX2OxJz0iyPyAIrdQ5CfvgNZhQTLqKknQ+w8FzGiDTNKgF/ABKlm180MXFMJ2n1J
	py0awjNjK+WEFMvi+1GsQ7TjUyw4Rm9+CV8fZKMjWB/EH5f31TppaL/4
X-Google-Smtp-Source: AGHT+IH0ey8eRCvxcHgsNYYNwiwm9i82ds1xLg6pyL6Gx4FmTSqN0nYi+iPEnmvAXppRtAVsCj9cLA==
X-Received: by 2002:a17:902:f68c:b0:223:501c:7576 with SMTP id d9443c01a7336-223501c75e9mr6151485ad.12.1740607466019;
        Wed, 26 Feb 2025 14:04:26 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:25 -0800 (PST)
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
Subject: [PATCH 3/6] scsi: ufs: exynos: ensure consistent phy reference counts
Date: Wed, 26 Feb 2025 22:04:11 +0000
Message-ID: <20250226220414.343659-4-peter.griffin@linaro.org>
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

ufshcd_link_startup() can call ufshcd_vops_link_startup_notify()
multiple times when retrying. This causes the phy reference count
to keep increasing and the phy to not properly re-initialize.

If the phy has already been previously powered on, first issue a
phy_power_off() and phy_exit(), before re-initializing and powering
on again.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index a00256ede659..943cea569f66 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -962,6 +962,12 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	}
 
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
+
+	if (generic_phy->power_count) {
+		phy_power_off(generic_phy);
+		phy_exit(generic_phy);
+	}
+
 	ret = phy_init(generic_phy);
 	if (ret) {
 		dev_err(hba->dev, "%s: phy init failed, ret = %d\n",
-- 
2.48.1.658.g4767266eb4-goog

