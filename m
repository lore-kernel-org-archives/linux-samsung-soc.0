Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585421772B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739385180; cv=none; b=Fdaism8iLb83A4aDqzpOY+SLXwi1plXZBKmRbs76oiQLKOBIKXAHdqgcN17c0KZtRFvL70Z9q5V8RoEfrpMPmqJ4IHZqlR2gxhA42oei3zLXkaOgpOLb2dgWLYy60+PA25LvvBPp+PUWTng/cXrvw5glnvPTtkUshN6qfrWhG10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739385180; c=relaxed/simple;
	bh=DScHAAMLHvU4xu4O0WcfNhf84lXVnZDNRB2q3PdUj1M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qE5/LqYKLCIgL/VToO3K4//YgyYsskZrMt1Fgh5KfDJ9yftkUYemQiV/HMEwDHWbzg0A8cPaHVlmLt8p2J9FN/tUzFS9BF5IjHAbvj+aXgxzHmaN70438zmE4LqS//o5D56tOy7F6KOcynM47jFBd0KHw5HTG0gHynCmT2C3z/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=az8W7Jtv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="az8W7Jtv"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21fb94c7fc6so44643835ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Feb 2025 10:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739385178; x=1739989978; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYmiCJ+R7Juy7BxO4gHWUFDYWab8Kg8RAmIlcH74Szk=;
        b=az8W7Jtv/DJtnL1epuGG+ZQiIdarzAKDUm/H/k6smcA0DM/eJikQFF8dKqXotbugUx
         p1VJyL0xYJgB460ioVaLlJfLER9wnHM7rTkBeBASXm5XQRLSF0ygGnTLp6ZxcYkz6VrH
         dNaHwLjUmEliH9e01MGo4bh2x/T++GDUX5v1SFJUr/lU8cCQi/p87S8gXStATBw8XV6K
         m3SgdgBQhuG3/MThSZgNLmo8ejN6sOimSBG6dgY61PejtzWjeGkUq/wZ2tUwDmn/4UK0
         M+Ag6jjyltrn+34xhMgHirHOK8yJxtRMMdhxkzhaB5pFkGI42EQ07TnOtrnEb3+VUF52
         dOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739385178; x=1739989978;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYmiCJ+R7Juy7BxO4gHWUFDYWab8Kg8RAmIlcH74Szk=;
        b=WVjaI7TaiMNaDLlYJRJD8vws+bfuH2HkmRtGub7CUOcJEs1agRKWSKtGkfhTEBzrPV
         CTvQc1s9lT9UP0jqekwiIWWYV0legLnzY3vKh43NnLzZRH34qoMCcUgtugmIoJD65YZj
         AjCrg5XUbypECCqEBUTCJNu4pkNqIfrwJcbKGm6dqv3I9F+FLm5AmxZ6bwA+l8WISkQj
         tvqVJ6ybtvUrNbFVpAXTpT+0c0/xgTatgU5L4QPCHpW20Bdr1bo9iqgQjWHHIotp16DA
         Pw5w/6lDsLzhLX4Bc4fQ6Klj9R40yswPQ3XqRCcYHl3ncp03p/FJsS4HwptQR8/kcxAH
         3qag==
X-Forwarded-Encrypted: i=1; AJvYcCWkFjptczOEkVxBS81S1ZEq/mfQuwimPiR/WVzjiHvt7Z40nxpWYm4+yYDVLHf8Ph7+H5pSMIhGu/GG4RyXm2yhqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1G+gLUfDKRikFQ2MOo/2FjI6V147SOiN+onLTJmPCrNAH61YV
	R6GGMj3SSVTS0d38iE8HR94AS83YPt/HeVXxEdRY7iXXgQODROrLNdQoeAULo4Fo8juUGSrDGDr
	W6Qqms5vsf3gQP3FHrF5iCOzt/A==
X-Google-Smtp-Source: AGHT+IECDfJK531HNRGV3syvC/DgBgcGWiTf33LlelsMxeULH9/uMoeKotioRlyy2DZQ3lTimCD19P4P0Lz7bGElf8A=
X-Received: from plbmn14.prod.google.com ([2002:a17:903:a4e:b0:21f:44cd:af62])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ef52:b0:220:cd9f:a186 with SMTP id d9443c01a7336-220d1afdd64mr7208785ad.0.1739385178165;
 Wed, 12 Feb 2025 10:32:58 -0800 (PST)
Date: Wed, 12 Feb 2025 10:32:52 -0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250212183253.509771-1-willmcvicker@google.com>
Subject: [PATCH] clk: samsung: Fix UBSAN panic in samsung_clk_init()
From: Will McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Stephen Kitt <steve@sk2.org>, 
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With UBSAN_ARRAY_BOUNDS=y, I'm hitting the below panic due to
dereferencing `ctx->clk_data.hws` before setting
`ctx->clk_data.num = nr_clks`. Move that up to fix the crash.

  UBSAN: array index out of bounds: 00000000f2005512 [#1] PREEMPT SMP
  <snip>
  Call trace:
   samsung_clk_init+0x110/0x124 (P)
   samsung_clk_init+0x48/0x124 (L)
   samsung_cmu_register_one+0x3c/0xa0
   exynos_arm64_register_cmu+0x54/0x64
   __gs101_cmu_top_of_clk_init_declare+0x28/0x60
   ...

Fixes: e620a1e061c4 ("drivers/clk: convert VL struct to struct_size")
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clk/samsung/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 283c523763e6..8d440cf56bd4 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -74,12 +74,12 @@ struct samsung_clk_provider * __init samsung_clk_init(struct device *dev,
 	if (!ctx)
 		panic("could not allocate clock provider context.\n");
 
+	ctx->clk_data.num = nr_clks;
 	for (i = 0; i < nr_clks; ++i)
 		ctx->clk_data.hws[i] = ERR_PTR(-ENOENT);
 
 	ctx->dev = dev;
 	ctx->reg_base = base;
-	ctx->clk_data.num = nr_clks;
 	spin_lock_init(&ctx->lock);
 
 	return ctx;

base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1.502.g6dc24dfdaf-goog

