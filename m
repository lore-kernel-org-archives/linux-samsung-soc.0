Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873F8763F1
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Apr 2024 20:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712694130; cv=none; b=EiBS9mTabs12MgoK8uAfLxv4IO+Yj4+0m7ted6Wsg5p51XLsgWwUPEqPcNEvxo/L9MfzRqW4nIPkwS/gYLfMi/Cylm2bHb1MeAFuSw03frduAv4kU32c/7UVv997SY80BcoVVDnlnqX5Jludvy4e0dAE0VaOIxrHfv7XEosErJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712694130; c=relaxed/simple;
	bh=LP0AE5/PUtGSyLNbe3rFEA3/mjUNWVbbofmFlYStYaU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e3V0NBh+YSMS9jo3rqiJ3MAKfosNtfFhoSU8mY5RkoXzNpMzKRUlAVzDWImEQIU2YyJoIjRaAk5bCdyHp6gry+DE9s2tdDYWx5oS1NRBIB/+JKmwfqUmNTke3/9Ht9qfqqqY8OIpHZqj8vXIOhQrakgBhDy8rZJn5jSJW+HyaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qIOjafEK; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qIOjafEK"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1e2c0d3eadeso44418475ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2024 13:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712694128; x=1713298928; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=li70RG4leC6BXT61G6ins6TrGephnT1pmJh8LVW4448=;
        b=qIOjafEKF6gK2ACResldhYXO7ScfyaQDN/R5/AHjQTsIxMM7a+h/lSRGt/+riBXOIk
         dIvXqdOB6KJ0PUiPPWhtVzdmb+dng41tdpnlTKg4POjY2Er/dMRfdxPCPlFvXw9E+omD
         dr0SL8WlomT3H6IGm4FKdSewRmAe2+3AxJLiCBfxIMfBjOVUlyMcb9u3IsRZXq7CeqTS
         wvGHht/7ec1kaKEgyTUCJD3mBIAD5JBKqEibO1eNFigUsOCSsAX1lif+jY22SlGXJBvO
         s1y8wpVsJwsqZiPZHY0Gmgc2Nu1Flwdd4d5c8VvYVKn8BqJ2QIQZ43aTt+CKMsrQCqUN
         fcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712694128; x=1713298928;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=li70RG4leC6BXT61G6ins6TrGephnT1pmJh8LVW4448=;
        b=rZpQ04R7+LyhfW+xCi7uzVrKQy5zx9SuzCF1srX2CqtCp6Op5xsju1SUzAQsxv83XD
         fNLVv3Rf4KbR5zZSVowfgtniVJbV19xQfd81ZUDdwprFAsWtrp/RPnxr/zKkk5yL1MOT
         cq45GsB32c9xtnYw6QxXsm7N+OdwgnaCSzKx9lLR5erV4aJjL6DmIiTqrG+LqTuB2qMs
         eA76fMUU7QgSgsA0aU/aBQAQ0yoSuojsFiWmwOBxG4/rp2z5v2/T83rkRoK7VIdBSkQO
         YthlZAG3fjy4QE6yIx8SjdMQ+CGuvxf/LGoIBusiAkOIw1Imqittnczx+3W46RRiCJLP
         +iJg==
X-Forwarded-Encrypted: i=1; AJvYcCV78F2BgCLhNZTs3/6WrAoR+LN6GZfNBst1XnD0BxI3Aa39nzDlUbXhpayViR8NygzxNS9J+i5KMkdNvGJAXleXwEDTY2kiKrgboHjkWteXcHA=
X-Gm-Message-State: AOJu0Yx2391qQPF1KGvz5umy0Vk79Epl2ODI9K0Lwhl7fK6OzWYCEthp
	2DFzmJLN8Oe6f7l6Y5K82NF05u1hK3fSS9T/MnnM1h0Z7GIU0+QYNk5aboi7mNIu7tHhglzqolj
	I/kqVkrkdeqxItEt5cOIyjsKYfQ==
X-Google-Smtp-Source: AGHT+IFRUiwCI1bVLGrKHHupMeWnTyEsNBKU9AP3ld9A7X1GTUv6ZAcQK10ulcSFjVO9m9GOgSGuiYAPdF1BHs6+B/o=
X-Received: from wmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ebe])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:f2c9:b0:1e3:e092:53b9 with
 SMTP id h9-20020a170902f2c900b001e3e09253b9mr29282plc.4.1712694127914; Tue,
 09 Apr 2024 13:22:07 -0700 (PDT)
Date: Tue,  9 Apr 2024 13:22:02 -0700
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240409202203.1308163-1-willmcvicker@google.com>
Subject: [PATCH v1] scsi: ufs: exynos: Support module autoloading
From: Will McVicker <willmcvicker@google.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Export the module alias information using the MODULE_DEVICE_TABLE()
macro in order to support auto-loading this module for devices that
support it.

$ modinfo -F alias out/linux/drivers/ufs/host/ufs-exynos.ko
of:N*T*Ctesla,fsd-ufsC*
of:N*T*Ctesla,fsd-ufs
of:N*T*Csamsung,exynosautov9-ufs-vhC*
of:N*T*Csamsung,exynosautov9-ufs-vh
of:N*T*Csamsung,exynosautov9-ufsC*
of:N*T*Csamsung,exynosautov9-ufs
of:N*T*Csamsung,exynos7-ufsC*
of:N*T*Csamsung,exynos7-ufs

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/ufs/host/ufs-exynos.c | 1 +
 1 file changed, 1 insertion(+)

Note, I tested this on a Pixel 6 device with the UFS patch series in
[1]. With both this patch and [1], the ufs-exynos module autoloads on
boot.

[1] https://lore.kernel.org/all/20240404122559.898930-1-peter.griffin@linaro.org/

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 734d40f99e31..1795860a2f06 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1748,6 +1748,7 @@ static const struct of_device_id exynos_ufs_of_match[] = {
 	  .data       = &fsd_ufs_drvs },
 	{},
 };
+MODULE_DEVICE_TABLE(of, exynos_ufs_of_match);
 
 static const struct dev_pm_ops exynos_ufs_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ufshcd_system_suspend, ufshcd_system_resume)

base-commit: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
-- 
2.44.0.683.g7961c838ac-goog

