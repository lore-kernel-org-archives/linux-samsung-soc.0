Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E131DDC36
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742398238; cv=none; b=So7ztc7WGa8qVseSq65gbyZnAtep2MR/dZ2T2tbnLDulufYpsHZm89E9JEfj0ybt6shiBv+dYK1hSP8ZWnjjXDcPdpPbIVBap8hfm/MvFRma64Z9uB8s6rSN2KU8yHvyDFtS0obeHNvPlfck59AztilPGT0N6Xab5h/l+1tO7eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742398238; c=relaxed/simple;
	bh=3SI4bC7ybL3N2FRvbuwPacvlxHEWeD8IolpWQSN1KPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkke2+f6L4EnlQhW+9/FW0p4oKIw2b8CRwH3YoPLqkCuC4BmESnmfTZXKBO11olekyc7lPDfWFiq/Et1e3EgTIIPA/h1ZeJmSJYhFvZGwS2ETIEOl29LRnpDqU2EJyR8b7hdOzmAQmNT4W3bdJ7DhxFQ+dJuIx0aOVKA9kuUGB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lwz2QgCP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lwz2QgCP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso32438875e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398235; x=1743003035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFAUALr8nAtye3+ZWjuqCa8ix3cqHAZ7WDjEfM5Mp+M=;
        b=Lwz2QgCP1fjGoso0X3obFi84svUz3wxpvDYJClyOKcINmg5oCz+CeXEIkCe+NMhhGQ
         2/qSltYMBzqhhpUltVXwVq/ibTUe/rzR0YmCpTxPez6H8ZEXLeFPDWfGDqAKJM21keSO
         +iyy6283eg8hhB6y7acMUFnR7cQ57voY0RFiQNTmKX8gvPYXhILT9augvTauZ1A1PBBj
         S2orWYkMrbkplGpcH3nyLy6FhrBfEYRAmI8bEjv47H584asEIaPciO/K+NZJPLc8B2dW
         C+akQoz1IkUjMJWCdKPeSRdl9jmxrC1yGE7y4tgJLIgeD8OAuI3/7JFDJ4PSCwNDh4pM
         N1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398235; x=1743003035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFAUALr8nAtye3+ZWjuqCa8ix3cqHAZ7WDjEfM5Mp+M=;
        b=JLF6zb4qiVlhSIpogkYX2dZ5395V2HQcH3mDRfP3QKRvRRsXxmN+JrUNldpUPsy+h9
         AAI3Ry5Rulyx8mAsqqwP9EN9Nv88KI7B8Rp18AWGSQTYp3fXWee89vC1utSmwe6oqd29
         WqQaeCeTQeG5PFpwfKZMTC0VgPXzU1knTAe5Qwu8CctCCXwNu27E7JCQLMHjQF//6qBj
         Q0oPRBfUNhWOLHOCxUCrE9wRZqLOSy8n0jBCMZfFituTsQWQcBhFAzxcNbrSyPCzYUl2
         beAMNtaENGkjI2UmvT1/lkvRW38O4/25MURiOA2mHLyyuM5UDEjk9bKHEKhYN6zdVJVx
         9z6g==
X-Forwarded-Encrypted: i=1; AJvYcCXDM2PTGcxiZ5KGlND0NnFcPlf+JOxn1mkINQFN2/XQfoVpK6NmT8WcOxjWC7eRZJ6X9o1AIY4Lqv6/TabyllRWVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxRZS4buGaL98qao1OTZgPNmKdEFRWdqBEnm2lOEO3mvJCV7fd
	dRDx9rcwn9EYEhxFE6wN5v9LGPTB9JbWWxxK4DB6zyKqWTNwDXPQVhowl4cPVhI=
X-Gm-Gg: ASbGncsudW8oYCoObTJipM16F5KVRBdHl8qnyVjbBvwqt4rgV748uYrnDOwVp/kBvXX
	P/No41OKFOx21lYnlwFvVsXLz7GP7JqTKr7KlOnCO54cHdy5rJNTXfMmhULZMrIxxnlhq9XEoGJ
	H9oqOfiGqKE4n56Yzu+NLSaSy68XYGRCO7l9MpmJK28LXiZMYY9hj+Li1CS6tPWMhQJt6pUW1fi
	F6BH3BZhtpFhoZo0Nie4gSvf4aTmBqiAhVsHRSvM5JISIlW99oPt85WT9EevqC5cSOLj5lob8pT
	auy3P4ULZZuMCGfav2qV8ptSMvPb2nfliFinTv/zDEMlVkvR7gs/ElzqZKkxX3swukCUliumGdJ
	LPs6NcZb6ctg=
X-Google-Smtp-Source: AGHT+IEHXtC0EIKTh5C5yDLtKnopzR+kKj3o5MrwB8zEIjbuESCbAMxGj1QGIrHhGz+ceqR8jXdneA==
X-Received: by 2002:a05:600c:3509:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43d437a9541mr31446495e9.14.1742398234649;
        Wed, 19 Mar 2025 08:30:34 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:21 +0000
Subject: [PATCH v2 4/7] scsi: ufs: exynos: ensure consistent phy reference
 counts
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-4-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=3SI4bC7ybL3N2FRvbuwPacvlxHEWeD8IolpWQSN1KPw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMR7Gt6GMiUHhQ9tNeB1ryvfLXf0f6hKBg7Z
 AIUaxYvoPqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEQAKCRDO6LjWAjRy
 uhgZD/44yhmeYZZzFKVFFjq28rha6NHqeREb1/qoxysPC7HrGnjsYlpYk7SLWHWWcyjtwhG/gMt
 O1lVZxIDu8c7fSHM8+Z80aiXDkcsmEARfOUrD7rvRCij6LS61K5swgmRoawpJUwVvovpsoSW0g5
 ABdLqjCx+iqyCQMidJfzV25UAHL4ymc/kVXCFeiVTBnnTndKQIathuUUcIEm/D2p1t+jRbp1ouj
 psGLVwlAg4zg8pKpXLOUq9qzcfjC45NB8RsIepMMqtHXKaJISGMHXLd5hVa/TNrEeTA/cPK42UC
 gzzSTMDl+u11SC4wzQJW1pGjPumuXTS5esnkGul/VvG0fkXHdp3YuGBE3rnUUwFqjGqOmH5yoXs
 Y70vVU28KnxP2Fnhhl1lONhMkR2STrszNmC6huHjeZtsh4TFCSmXHmLJh0xpisMoQmlN/30pOcl
 RRN4m1DK7nUiauvbcCVaPdj5P6RmbOYJtDqUCqON9M/eQo7wP4JYkQZi5YQHNXvOx1YZ7jHq5jc
 mfPzh2Tq80p/hi0O56Kgz0Ehub3xxNXIikH/CGYwVORuo/Gmg8U1YYHcER1HhltRaAp1JQPrDw/
 c1f/EAeGILL0PZnv5PKrNi3kkPLIv224YLEkUbnDCaWb9v3eW95YQeb7mFh8wcQGHiwEF+mqTl6
 hymvqaPAm/4Doyw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

ufshcd_link_startup() can call ufshcd_vops_link_startup_notify()
multiple times when retrying. This causes the phy reference count
to keep increasing and the phy to not properly re-initialize.

If the phy has already been previously powered on, first issue a
phy_power_off() and phy_exit(), before re-initializing and powering
on again.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: 3d73b200f989 ("scsi: ufs: ufs-exynos: Change ufs phy control sequence")
Cc: stable@vger.kernel.org
---
 drivers/ufs/host/ufs-exynos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 61b03e493cc1ddba17179a9f22e5b59ece02458b..34e16e198830d086cbdb6cb0b027ca92687b2ae6 100644
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
2.49.0.rc1.451.g8f38331e32-goog

