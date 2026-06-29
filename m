Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A8A37DE97
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jun 2026 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703546; cv=none; b=AvPdBLUAnkhHYK57yQtFFzKbs7RxMTufssJr1OTN8xCENd/FyEUjGb+1wWYL62is3Xy5Hqehx45uSNCSMBAUOdWerxoevYza+1VPiSgxX5DYCvXTl3cGUOUGPwAZ+aUMPDTJ8apV0i2UrjFVCZ7AB9jfqgOFcqExbyobyQWkThc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703546; c=relaxed/simple;
	bh=LDc0P9CwkIe16iPZKMLw4eVvkPa43dqovSv391Oa31M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbDUGQ2ia2Y36tQlz4X3GDpcTseEaOj+5SUNC6+uZFwimcYCrUvULDDp0dpwCbNF+8ExryXocKMH5LJw8Qv+8vlLYyz9K/5qyBr3wd+quVzTZFBFJkKhLy+Y5Wlm1CKn4LgOgZSLfOL65M6IL6r6rwr5cirOEnP5dWUS9S8y3Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPryPO5m; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPryPO5m"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84536e2857eso1376997b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jun 2026 20:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703544; x=1783308344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80McaoHOMKyfyTsbZQMYToHQLH0RNFgmuDW7N7Wm2Yk=;
        b=fPryPO5mTlCT5Ex/+AkzF9Ugl+fMtqhWWuVkrzdvIZGV/qOep9zHRmVstDjPxCfwzc
         42jAKD0DmnOEkuKIuIER+ijsshljuAmdoJABiLIl5OF+ytfmOwQP5z5v7wxD2Zuj16o4
         Anhtk1eCh3mkEZR68wCLjbOT7dpe1lPA6LMvxY47InSCoIFEi80dlwGS82UwKJbK7tnc
         sVA2RH66vuXoUVT/QGfOFQccX9TJXnnUkYHkV5LPUNH9Q24HJOkQvbU+J43DTSC84rnD
         nS37kignYRbYnsln5wfhEFHjqONse7jt0J1sl2asGL6U7tRw4skjn5t/DDhrvfbu65yS
         sARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703544; x=1783308344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80McaoHOMKyfyTsbZQMYToHQLH0RNFgmuDW7N7Wm2Yk=;
        b=Xyvvc+YTfqiRnrGoUKCIyk8lKzCkwslTequB2WvWtaayI9MWfplEibZNwTbI7WyoqQ
         BGAGjgcCYScwAR2FXs3q+VnUqpNynKenF4nL4P30Sdg5dJOGkiyKZOYBVylyGlaNtMpw
         pjb/cATQKl6Csm4mK2w6vWSCJpWqPjmIfFWuKPWuV/RUnbxybKC743sbwIPm7l5rKYa7
         byy+xZcB8w4fh9Lrunx8OKS6CVlA/dU6GKrwDJkpuH9KYzg9qEZn74asLIQdP1R1AZk+
         gDpOZ2V4W+qzdkO2AFfe6W7MoyavhY/H24PHsdUnp+DdL2xGjltauHb+u40aVQ4Q73ud
         qeiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZCMHErHdNg0NsLHFI2VSopfpmfQRJTUywQ+W180iJHFmTsJBau2vhLWC7+xYt6cNswANtU9kZNBSe+se2kCGlSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+X9MduEjixRFGzoCGTWNv1HcuLSBhCxRDgIvrUFlGUx6k9NzV
	pkhfISA6Lf9IkeF9MXdOX1PRtxVF8XaoZQnys+51vDROvbOEbLzi3+jA
X-Gm-Gg: AfdE7cnq/h1saYNe2Q0nGih52GKATYXjphsfh3iZDX15a1Oh8aZVYoYFG271rrSjwEI
	fK24LTBqnohRkYWkfKzMLWnU5MKT2oynlQg9R6Q1eicsoK6e2KtfG23l1uI9tNMQx7pTXc5HEoL
	5rZ2SyIHNGtp60Ofuh5KA6g4envqhPmZD4kU7QGu2xtf5DoHS5Q7Z0E4k5tCiDcf6s3XC+QnAPc
	0jt60D/plzVmWE4/d6IPBfX+H2aec0FcDWhbLGpppyga6wviM1pmszwVw8aQLeUKQK8NUnPAQBd
	585Bjwwu/Wve5FAHbs0BQlV6hCJQynpcV/LbOITiwSSmaG8BJyojX1FbtKlP3+Ve9xYRw14KejY
	dJfYmKwIR7vv+On0oqvfh1MJ178bt3sZAiOh1V3zJ6i+DRSquyTqQc5J6uSyzjC+FfArGsQCUp9
	YUVxfBzbDF6ULOCaCGTi4xOg6t1myvpUa7+Wgnl8Ih7MZeD3/9Vc/pApZxSenilsl/CKETaR3w4
	rVXQ/jqvg==
X-Received: by 2002:a05:6a00:9082:b0:847:9267:2104 with SMTP id d2e1a72fcca58-84792672a21mr150260b3a.12.1782703544516;
        Sun, 28 Jun 2026 20:25:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-846c7f659ddsm1921771b3a.32.2026.06.28.20.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:25:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv3 1/3] clk: samsung: use kzalloc_flex
Date: Sun, 28 Jun 2026 20:25:38 -0700
Message-ID: <20260629032540.2331559-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629032540.2331559-1-rosenp@gmail.com>
References: <20260629032540.2331559-1-rosenp@gmail.com>
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
 drivers/clk/samsung/clk.h |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

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
index b1192ca03db5..be733eba08a2 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -324,10 +324,10 @@ struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
 	struct regmap *sysreg;
-	struct samsung_clk_reg_dump *rdump;
-	unsigned int rd_num;
 	const struct samsung_clk_reg_dump *rsuspend;
 	unsigned int rsuspend_num;
+	unsigned int rd_num;
+	struct samsung_clk_reg_dump rdump[] __counted_by(rd_num);
 };
 
 /**
-- 
2.54.0

