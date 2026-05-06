Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9CE3D34AD
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 May 2026 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110734; cv=none; b=mciiQ1vctlxyVyMCAEtgDd1qicW4Do+FThhkXgcvZ//6A0ST9zY2XVugUcgp/7dBD7afP2OtWGNNjeOIPKNxhSuuCyk56nammFxnTdhBBNIAqRqeinXwrrHwsqUF74P+9gUxGm2HFIlhnxX84G9YTd5M7+3aiGqpBtSNGweC/ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110734; c=relaxed/simple;
	bh=YY+R1qr5oJy3WtrJhQmeK5L9NeY3a4lm2XE9sFQEb6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6Zu27H2L3pzkcEZcBI4G0NaGMfwUD1V5HUrfY/+59HePJiGxEZO8ILMdiR9YR1cdHkXzypnCiNmurs3ElHKyuHnZChELqPIDNWsqm6PaeN7E3plTcseDtGLUqQJLO39WcnUz0dBWpPrt3r8Izt5s+J7EgVCxswDLV8OZHUQ3B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qktz3qj4; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qktz3qj4"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so68912a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 May 2026 16:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778110732; x=1778715532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyuSYjZx1jLqRtBEtVQBj/M4Q/f4SPIG8RJjNTkgcSM=;
        b=Qktz3qj4FJhhAqld0ILcU9KwStIZav2c18ycDcP5aUNNmxrNDvyCPaHi2iKnfdCg3D
         7Y3b0wzasLHCDcjUpBAb5bfsFnabSeXIyhJE0ptpVJeHU+1NzouPJoDOp4dEajUvh1AO
         yBj5iIsezgcur5JPxPkenMkdnTjJgujPfIz3YL/MYASePdiHwmXKRNVTRX6r/Gj4IO4I
         cn/VCrBsrFYxo0wAXfiv5ieaVAEGotzWjnZu2xdl0Z5LmRbcs9QZs6MYTe+nycNZ1fiA
         f+xZCkfX3d3sOywiI5G6GzxL+jkEAm9yZLw8udl5tkOuBeAZDEOKStpJp13Q9Lv6aQad
         L27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110732; x=1778715532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyuSYjZx1jLqRtBEtVQBj/M4Q/f4SPIG8RJjNTkgcSM=;
        b=QgBiZtk55GnlLaauIfy9H0UaFX70a+tfVOVHlTRQhzAnDqChqzEcxXSG5UhXPncC7L
         +TC0msBswKGmUWxHipAINXOgznRXIs2WsKAcJ67cOPdkbJzUZTo2LdM1yPEHr2ubO9ys
         qJYX+BCeyYm4Dp2AfPlcbaMZrULn/Y+0qK1CSE4a1IZR9WVPTxJWF/Yq/gXndXjdHeBu
         OveMU1eIQG/CIvcbRj4xvjbEMTFMW1e0mzH6eBOIEEB+ZoSt/rzIdaVXT+iPghqTinr5
         w40Buw5EhlmbdiZRVAC/K9NLE/f7VNIkWwjCJ94pb0sVU7vCZGgJ4SPDSdkh6mGwsPBL
         ginA==
X-Forwarded-Encrypted: i=1; AFNElJ9XelobRart6r4ZmdGzRKJaLBeTnBmNaHj2L4l2nPli1iH9i76TDfJAxu5rjB6XRfItnwdlEpIL7xAzIB9vaU0P4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6SK5MFM7uyw/VwXC2HF0EBrxQ6Mtug36VQZwHUC/xhZdg9imW
	arp4+G5azWaCjXa5XCm9Jdn3PhqYFvPkV+IYeAiJ3xSPItFTGhUB367q
X-Gm-Gg: AeBDiesbMPnSo2nXNPInEIcJ5txkGdUGt2gH5iZYd/GreGHkDWgW1K+RN7qNSn8LOgb
	zoNNvYJPif4nZk33xdy2ZRLyeL8NmLrGGgCTJGprD5gv6EMB+Yii7G98sjwet3FMr/HbnKitYWm
	/KZiGDLx/MPv0hEer93vR1u+0wzn4kw21xFqf7nKxqulG4rG4N67Xwk5gx8Te2VT2YRtFgDECGp
	o6jsdpkbtE8XYzdO34OA1q4CPfmYe6RvFYX+V/Ly/ycszxJAia8bRLkzrsI3yRnVmi4HW/alsGd
	8oz8+TKRcx32oZlUFpupjDRngaFMSbSe8+ttU9lXt3Z6xt9AZu430p0zZPB/7igXtwUvjRBU/dS
	eshKQsOKR9KGjyb/N0pVvVkdrnsfDYJAo9ecBeytfhKEN8iPqT4KSEBaEOeGO9TyP5YjuxSInlQ
	pGBQ0Qs/LtnaaRG9LkEKjs74OjJ5omFx1V7Hu873t2gsOi0CQ5k8sMtBrpqu5FkDO/MVJeFBf6E
	tv43UVM+UzMcNTwNs8JzkhegxLUYTAdHKHd5oFS4u8t/A==
X-Received: by 2002:a17:903:2b04:b0:2b4:6080:d4d0 with SMTP id d9443c01a7336-2ba798c2f47mr60722265ad.22.1778110732541;
        Wed, 06 May 2026 16:38:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaaef08bsm3471805ad.28.2026.05.06.16.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:38:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 1/3] clk: samsung: use kzalloc_flex
Date: Wed,  6 May 2026 16:38:31 -0700
Message-ID: <20260506233833.178357-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506233833.178357-1-rosenp@gmail.com>
References: <20260506233833.178357-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using kzalloc_flex with a flexible array member
to combine allocations. samsung_clk_alloc_reg_dump is no longer needed
for this struct but is needed elsewhere.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after kzalloc_flex which does the same with GCC 15 and above.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk.c | 11 ++++++-----
 drivers/clk/samsung/clk.h |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 91e5cdbc79d7..2895c77534ae 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -430,21 +430,22 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 			unsigned long nr_rsuspend)
 {
 	struct samsung_clock_reg_cache *reg_cache;
+	int i;
 
-	reg_cache = kzalloc_obj(struct samsung_clock_reg_cache);
+	reg_cache = kzalloc_flex(*reg_cache, rdump, nr_rdump);
 	if (!reg_cache)
 		panic("could not allocate register reg_cache.\n");
-	reg_cache->rdump = samsung_clk_alloc_reg_dump(rdump, nr_rdump);
 
-	if (!reg_cache->rdump)
-		panic("could not allocate register dump storage.\n");
+	reg_cache->rd_num = nr_rdump;
+
+	for (i = 0; i < nr_rdump; ++i)
+		reg_cache->rdump[i].offset = rdump[i];
 
 	if (list_empty(&clock_reg_cache_list))
 		register_syscore(&samsung_clk_syscore);
 
 	reg_cache->reg_base = reg_base;
 	reg_cache->sysreg = sysreg;
-	reg_cache->rd_num = nr_rdump;
 	reg_cache->rsuspend = rsuspend;
 	reg_cache->rsuspend_num = nr_rsuspend;
 	list_add_tail(&reg_cache->node, &clock_reg_cache_list);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5..098f27a6290d 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -324,10 +324,10 @@ struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
 	struct regmap *sysreg;
-	struct samsung_clk_reg_dump *rdump;
 	unsigned int rd_num;
 	const struct samsung_clk_reg_dump *rsuspend;
 	unsigned int rsuspend_num;
+	struct samsung_clk_reg_dump rdump[] __counted_by(rd_num);
 };
 
 /**
-- 
2.54.0

