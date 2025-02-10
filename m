Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C871C5D7C;
	Mon, 10 Feb 2025 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186436; cv=none; b=nBVOyWFRByfBpBGUB4dtVUFZIouuSjuqNEhFTZKOvCSDHOeYO7sginn0o6YvI4AGePEHtejDTEAxdh6cPSKk6er6Yep0eEf/igpJXt16XDnuF5OQWbI42c36ZXtMdSh2K3Pv2JjB/YT2OzMBvTbz5lQadH1apXRUGsaxQwUrT6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186436; c=relaxed/simple;
	bh=UmhTdp0yOp0xOBa0fKhmJv6Yjngb6GLcstrvhe0JLRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAC36KRFPzk22ZIkidABlIwoIATKb77hHy8WWJ8jNRovHxvEqIb2oNFPxipyr8YrQ06PkxwmJYM6DyGzviFBbm79zVGnmpBC13eqbJ5d37hYK74YRrW/c7e8Cw4TDA8xB92NUHe20acfzrWG6JX+pFnh8Ma525HnwGiYl98xxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoaDYg4q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoaDYg4q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43944181e68so8225205e9.0;
        Mon, 10 Feb 2025 03:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186433; x=1739791233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWk1tmUv6R6ofIovz55Q8Qebo6k6REo/VNEY88i+dbU=;
        b=JoaDYg4qxgz800Lg+yvzpTkVY0vr0J875cw7/mRmzoCcyjuEWN29hEEUwVFV7LpSmL
         oNh3WffRe3IthUItPBNaJFBPNNgltHNfMeKi+diaogw/aN/jnvr13Rk4biB6Z1VBABeC
         C0zvTT34SGu+cRJ+bLxqnCHxViI3RWGHyHp4Sh+3zdwg0GrzVl8u8V7XtZ8XDMp98J65
         kk/ClnMrnbBOrn+ftWBdcs7tFuYQ8tPLqOTFPc5mc1msJJ2h5sX+eSULUnS9snxWrthf
         JBXWFn+5uD0m1zwwia8bkA0MXw64DIglQmgrF7jbPrzntGKcjASrcVa8rHAyZ3RHrX0t
         fSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186433; x=1739791233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWk1tmUv6R6ofIovz55Q8Qebo6k6REo/VNEY88i+dbU=;
        b=AziOAg88xpc1O5vPBBUc1piKIKAtZzlxluAet7in2/Ja20SeIMMBmz8M1NpBlzMBVg
         JxZwKOoCZX8Uun3NwAPpWCZJzgjMftMPWyuUdm6kPCeD+kniP1ATGoJl1NbRLtFW2crw
         8ZgzJV1GMs6U5EUFXIx/1t9FmnVZ99H/4ZAWzKaHU/TsHY7SnuJewt7kZPvfosNlG+PI
         npYICKK6mFRavvG8xXMI715nopw4K+D2JKJPngU/XKbJ02vapbt/vpBjUZWcqSiRXwgG
         CJazXVZ1BemvtOxs6XxzhB3MWvOMsKaBDq5xhRGnRrOA0GeUuyrtZSYCH2L+KMFnyxTR
         JULw==
X-Forwarded-Encrypted: i=1; AJvYcCVAoeityrKuStlY3fTcweoROJ9pa86/kytrT3aSd7aotUfyO4rPbOkaPuf0E27i//tXs/qWN4GArsjKKs4L@vger.kernel.org, AJvYcCVgFSwqZGFQ13/V+9sVw2gvIu4FKHJCvqEz5eZMMcK3ywuZ1tK+gsbcHad9MV+xx4ZwwQuzae05p7Hcmv++kGg=@vger.kernel.org, AJvYcCVhjlDITYQ5LDmljVKAQBwQ3FevAesdi1rHf5UhqK/G6GhVt1Ew1YCPSTGnrMUPrG2J5NtfZw/YcaFHqgVTNHTnqEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xqmvm8KOegHlwZ2aN7/D5NB8HkVwdYPKNeXoLTTfei5mmgk2
	f3+nj+NNjS2kMGnXJvJbvwY40P7eSfmCQ3Oyn86n1cuCf8vosGj6UO8ygWbw
X-Gm-Gg: ASbGncui5adyDuwhhxCIuqTaI7zBS5o9s6xg+W+CFdRlnO/tUiHPandK5Kg4bYEXnCE
	mQAl86brM9jOeBw7GzjIIPurR1/+kgkGIFjYd6Ps9eG5bHEpwRam9pNLycAV/1qUJg3i5OL9T6U
	KepNqCw4Tf2ytXxeCjuPP2p7FFWMv938KeuTqgHTX+LWTxVJ/tcVK8qsShyoSujPwA85AqXi9xQ
	X3cffolan7Ig+1ulU/JDaJ9PoTmkEsPYLNjK9bAOH1R3Wax4e0bJuoNJqTbp3B2chP2VtYNAXik
	NX/xC/YT/B5Z
X-Google-Smtp-Source: AGHT+IGbRwLLu9tR/y2eBa/u7toSv7se05o3znHII8V/vw85Z3xbe+EWFjbGzJGpwzoJnEMDsZOF7A==
X-Received: by 2002:a05:600c:3503:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-439249cddf9mr124532365e9.31.1739186432404;
        Mon, 10 Feb 2025 03:20:32 -0800 (PST)
Received: from void.void ([141.226.169.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af07sm12174656f8f.15.2025.02.10.03.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:20:32 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] iommu/exynos: Fix typos
Date: Mon, 10 Feb 2025 13:20:04 +0200
Message-ID: <20250210112027.29791-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some typos in comments/messages:
 - modyfying -> modifying
 - Unabled -> Unable

Fix them via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index c666ecab955d..69e23e017d9e 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -249,7 +249,7 @@ struct exynos_iommu_domain {
 	struct list_head clients; /* list of sysmmu_drvdata.domain_node */
 	sysmmu_pte_t *pgtable;	/* lv1 page table, 16KB */
 	short *lv2entcnt;	/* free lv2 entry counter for each section */
-	spinlock_t lock;	/* lock for modyfying list of clients */
+	spinlock_t lock;	/* lock for modifying list of clients */
 	spinlock_t pgtablelock;	/* lock for modifying page table @ pgtable */
 	struct iommu_domain domain; /* generic domain data structure */
 };
@@ -292,7 +292,7 @@ struct sysmmu_drvdata {
 	struct clk *aclk;		/* SYSMMU's aclk clock */
 	struct clk *pclk;		/* SYSMMU's pclk clock */
 	struct clk *clk_master;		/* master's device clock */
-	spinlock_t lock;		/* lock for modyfying state */
+	spinlock_t lock;		/* lock for modifying state */
 	bool active;			/* current status */
 	struct exynos_iommu_domain *domain; /* domain we belong to */
 	struct list_head domain_node;	/* node for domain clients list */
@@ -746,7 +746,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, exynos_sysmmu_irq, 0,
 				dev_name(dev), data);
 	if (ret) {
-		dev_err(dev, "Unabled to register handler of irq %d\n", irq);
+		dev_err(dev, "Unable to register handler of irq %d\n", irq);
 		return ret;
 	}
 
-- 
2.48.1.268.g9520f7d998

