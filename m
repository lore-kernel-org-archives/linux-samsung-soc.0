Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E618FC8B
	for <linux-samsung-soc@vger.kernel.org>; Thu,  8 Aug 2024 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126291; cv=none; b=LpNU+aKCGHiQsr0YZZ+Mg2SXbqqXwpePs4r8e6q8kSIwNyITbaGmffwZtvUgXwDy3hvDto2mXFMAg1LAQd558aN6hDbd8thlumxUKHr2BfFikt52h1sQGOU/bdnJEJq9FBoeXWG81KSrAZB6uSqFon52T2qFCZ0wj9FvHbvT1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126291; c=relaxed/simple;
	bh=nXzI2w3ThoiSRcRj8fOXuTW+n6yOdH+9/0PqUvo2i28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4In5W8jLIAMbxWLGZ5m+sHIV/YMFExvRhjeDCFmh6h+v/1TlpurEzDD59o//TBG+W5PlyNr6DgB+AT7DUqMMJOHlOJnQsBN3GykkYXhTmVSSOHhBeSewu33QAZyn83lOa+KT6qU48eK2klTIGUrvHwvgfvT6eZt+NyMw0u1U4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+WL0U4t; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+WL0U4t"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso992775a12.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Aug 2024 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126286; x=1723731086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4eCyKnwzwhvgvotyhGHB+vsH3GCQ4YaY3HQS5YaZiA=;
        b=q+WL0U4t6EwBL8eNlK2/FmWUZC3P8s5m8MYyNFffPuvqw81ona0TYd66H9P69RIJjy
         cScCavcVbUVUjXGu/6XWoE/WW0zsgcJiWe20ucTkilRKArEdmghn+S+AjeQV1GctjZjl
         ISCsatkLjJfPCwakcJAHAs6Ke1jN7Of2TWIJuM4srKKZLNmmVZBqWsvmMAMO+24q2qu9
         dBoQn1O1ir1EgDgVDjmemQJxIDkzzeN+4BHo6UMqm2VP5TXgPfMkpot3TnAcPfU8b1lX
         8b1W2g/AQWV82kytzqN7vgIEdbavkFrBa+jrbt66rv1kklaDN4ZHojtCFfZFJfJmbbCI
         RtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126286; x=1723731086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4eCyKnwzwhvgvotyhGHB+vsH3GCQ4YaY3HQS5YaZiA=;
        b=FrDmmcBaJHDVfrnV/AdhPKap4Bwdv6ZVoe+q8sNGsH2pz8E4QWYHRKaw/8pK5AR7go
         +LIPppFuI/ugen507NsjV0FHtnLp3KD5DVCLpKsMvM9m5TEzRz3nnBKzOv4ZDN5JYKpo
         Wf0Tf5SxLXS3tx66afDmJF5GrHrV+gjJfwn+kDcBb9EaGKx5pPe+tTvZ4h8ebruVo4HU
         wy3Stio2zGTc/YHVue9j1pxMyUSqqdL+Ll2pc9ep5WPjZHcMSF56KxNDYV1lPcKdpO/Z
         mlcdyZXMY0/c62OSRqBnk4ZwX/h3jtyNGezTBNQeB55tuW+lg1QadNAeRLxYY8wEenoc
         85uw==
X-Forwarded-Encrypted: i=1; AJvYcCV6JjeICKvfInQM0JFsSBJvijPFzHmiQapzabLXiMvK5jb0xyjaRj7WCxCRaqkFcwbo/EeKSxfVOQEOk73kuN6pC/dDI3M8CvsWnUKE8NQIthg=
X-Gm-Message-State: AOJu0Yxqa33mrudRYVx4jrgvCQ7x6b1uRMupHcrHxdNdXPP/eAG4wT+M
	xwxjzu5ks0h8T9IL3V+04jWAIrdghRFzmcBlVtrsaKMZFohhPg3Og4/MBQhIlMI=
X-Google-Smtp-Source: AGHT+IHLyR3mIPR0bVi3zK5Pu+MOQMUFddYaWH9c8BVGPZ8CiQyaIW7/W5phTXQL3+7VzYauXFuUYA==
X-Received: by 2002:a05:6402:1e93:b0:5a3:3cfd:26f7 with SMTP id 4fb4d7f45d1cf-5bbb2409945mr1779672a12.32.1723126286215;
        Thu, 08 Aug 2024 07:11:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:34 +0100
Subject: [PATCH v5 20/20] clk: imx: drop imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-20-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

There are no users of this anymore in the tree and the clk core
implements something similar now, we can remove
imx_register_uart_clocks().

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk.c | 72 ---------------------------------------------------
 drivers/clk/imx/clk.h |  7 -----
 2 files changed, 79 deletions(-)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..5f998e56a4ed 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -154,77 +154,5 @@ void imx_cscmr1_fixup(u32 *val)
 	return;
 }
 
-#ifndef MODULE
-
-static bool imx_keep_uart_clocks;
-static int imx_enabled_uart_clocks;
-static struct clk **imx_uart_clocks;
-
-static int __init imx_keep_uart_clocks_param(char *str)
-{
-	imx_keep_uart_clocks = 1;
-
-	return 0;
-}
-__setup_param("earlycon", imx_keep_uart_earlycon,
-	      imx_keep_uart_clocks_param, 0);
-__setup_param("earlyprintk", imx_keep_uart_earlyprintk,
-	      imx_keep_uart_clocks_param, 0);
-
-void imx_register_uart_clocks(void)
-{
-	unsigned int num __maybe_unused;
-
-	imx_enabled_uart_clocks = 0;
-
-/* i.MX boards use device trees now.  For build tests without CONFIG_OF, do nothing */
-#ifdef CONFIG_OF
-	if (imx_keep_uart_clocks) {
-		int i;
-
-		num = of_clk_get_parent_count(of_stdout);
-		if (!num)
-			return;
-
-		if (!of_stdout)
-			return;
-
-		imx_uart_clocks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-		if (!imx_uart_clocks)
-			return;
-
-		for (i = 0; i < num; i++) {
-			imx_uart_clocks[imx_enabled_uart_clocks] = of_clk_get(of_stdout, i);
-
-			/* Stop if there are no more of_stdout references */
-			if (IS_ERR(imx_uart_clocks[imx_enabled_uart_clocks]))
-				return;
-
-			/* Only enable the clock if it's not NULL */
-			if (imx_uart_clocks[imx_enabled_uart_clocks])
-				clk_prepare_enable(imx_uart_clocks[imx_enabled_uart_clocks++]);
-		}
-	}
-#endif
-}
-
-static int __init imx_clk_disable_uart(void)
-{
-	if (imx_keep_uart_clocks && imx_enabled_uart_clocks) {
-		int i;
-
-		for (i = 0; i < imx_enabled_uart_clocks; i++) {
-			clk_disable_unprepare(imx_uart_clocks[i]);
-			clk_put(imx_uart_clocks[i]);
-		}
-	}
-
-	kfree(imx_uart_clocks);
-
-	return 0;
-}
-late_initcall_sync(imx_clk_disable_uart);
-#endif
-
 MODULE_DESCRIPTION("Common clock support for NXP i.MX SoC family");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..314730f848f7 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -11,13 +11,6 @@ extern bool mcore_booted;
 
 void imx_check_clocks(struct clk *clks[], unsigned int count);
 void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count);
-#ifndef MODULE
-void imx_register_uart_clocks(void);
-#else
-static inline void imx_register_uart_clocks(void)
-{
-}
-#endif
 void imx_mmdc_mask_handshake(void __iomem *ccm_base, unsigned int chn);
 void imx_unregister_hw_clocks(struct clk_hw *hws[], unsigned int count);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

