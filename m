Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24FD3B1EEE
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2026 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209154; cv=none; b=tdaosPk/iT2AlasVnRegcHTYuBdNGVLjeSW2Fl2grJPT82+J4MHmi0cmkrfc/hRqJFWdpXbmvcvzUajcmg1b7eiGQ5mHH8uhomqMc4BjaFSLFEaO2tPZ0Rl181sFHKyZ4T1rquy3GQWfSkwX0YxulxycI4K2eFFnEHsGINts+fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209154; c=relaxed/simple;
	bh=QFQbK+h1+T3zXv+Lo48t5Ke65VULKiJ5q5hWe7PoMYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nnpt/P6/lAAm2y2PxlRIJJ3FHmCoMv+of/MaVqESjhBSjvMHl8t3g69Upb/WrK+e6qN8//2CrVOgG6mvZPj+moi/rb8FxUtbNe07cHVoP+o8+Ti3H56L6VEhRLhmByxc6cCGYmVS6Vt2E4mE2dYyv5la4QwSeL+lCxKD3yu32bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAzLSiH5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAzLSiH5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dcbade417so2069541a91.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Aug 2026 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787209152; x=1787813952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=;
        b=GAzLSiH5UJUYm86Dp4pHOhPMz2zLDDmIEYmtL3eADu7jYkkHGH1XME22SVYjduWosv
         qQl+FQAC/88INrm8NaHek7VsptLc6LE97Tb3JTGf24e/wYhuUjwq26A+2rnxicwQafMW
         PEgQ51qXh9Gk4CcdRHyTAg60J7TEcwhbwFhK3iLyl4OmhnfFJnDPOQJ0aK4aKtF9gUK6
         WvsQY1sXZihI7UE6qRfFzoOudRMDbeibzd8dlKZImkn+YoaG7Zja6CCzoXhEQFMnL9pi
         LlI6QimBeNRRd6BfWlMrHEuKS9hGPy2XbW/go6Ai0DmLK0BTE/t+98Bd2EzdTl1FN2GX
         VaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787209152; x=1787813952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+flFXip44k0sCr7rKJMxdk0YHFqAbrFUAstCTx4HU4=;
        b=BvWCSiExxAVXy/c/xciYkkl0imXQfXtDoZQIp2h2auE7BEzpLPFXkZxYb63f7Pg/fl
         DBIhWX1SEqxOH4vWwLGNyrJJDw04jij6sPMklBICPhnH/JXm13uACEeUKlPDxiVzT3xx
         O5Bwa9tMZHe5S8FyioVnhJ/ObSAKPu/NiwY5+4IPR4ox1SG8TPz3BQ65PFbCudI9xQzX
         168fsSzvKU56mzBfqGxjWwqUwvSlet8bFoueDSfxTLdKxs3Q3r9ntkUgSgsh8KEGCIqU
         CDaqtKRVB7DEC9FsCSWkVNpQEus0qT5rn1QDFGvfeZ9GNSTfFFSSn0t77Ps1KNKSVKUA
         MVTA==
X-Forwarded-Encrypted: i=1; AHgh+RowscBfTwdwtkgmt5JgRelJG3PQL7ys7BYyWIslrVSnpT9VLIlM6KfOlYlBrCpQ31Ka/0VadKZSX6teBK+pC2eTaw==@vger.kernel.org
X-Gm-Message-State: AFuF++nZL4YQKcjWKDeoFsa+jXpezzF4YO5N+BdRieoCQCcbkU3nwhjv
	CgKyCYpDYKOz9hjTIBrNn2aquvKnIr8HoEhtmo/Mep0M3wLF96JILxI=
X-Gm-Gg: AR+sD12bfRLyXUxn1XCaFi8jogF3redLR2Vb/mCOeQ88DSIlRIWCHJahIb+2LnpuOy4
	bBTYKiYoZqcbPyvUnointS3lB7tjngWFZkXgLCZ1r2uknJ9XfxdwuEcLbROgIOQ1cIT2RXCC0W7
	0RXrh4AC7fa4KN92LvojhvW1jZZKg0HqjPyR4fntU0scecvdfFvCnoir6xmoCncubvwH8XAJQiU
	GJlv1ZG4qBMtbp2azTkpcmROT0UZdJRBPU42eFReDd4AXp+kDUC/cjyVN7mSksX8vgwsSbclgPv
	C8iaKW5I93jxE/I1gwF22IVXgTrIM4syMxNs1aWWo1rPVv4OTOIAZW6K/Uxx61p1z3CIIlCu7JW
	JBqzqjfkTT6wMbyRhHGvX9R0N4GY0ejXdlC3Weu0ZsASBZmmTw4bZr9cOf4RF9G+heBHPoCvQ8M
	dZWwaejmZdfPxSYYredJySurinpVhRSy7bXBvFN8AbmKX5EH6KukRzUr/vgfDNB/u1pfFomUI1S
	w==
X-Received: by 2002:a17:90b:4c8c:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3958108a4bbmr17249377a91.10.1787209152046;
        Wed, 19 Aug 2026 23:59:12 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb87174sm5483221a91.12.2026.08.19.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:59:11 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	bmasney@redhat.com,
	luca.ceresoli@bootlin.com,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	michal.simek@amd.com,
	shubhrajyoti.datta@amd.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] drivers/clk: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Thu, 20 Aug 2026 13:59:04 +0700
Message-ID: <20260820065904.2032536-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from its suspend and
resume callbacks, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/clk/clk-si521xx.c                  | 8 ++++----
 drivers/clk/clk-versaclock5.c              | 8 ++++----
 drivers/clk/samsung/clk-exynos-clkout.c    | 8 ++++----
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index ceadc07bcb6d..9336d08e8083 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -341,7 +341,7 @@ static int si521xx_probe(struct i2c_client *client)
 	return ret;
 }
 
-static int __maybe_unused si521xx_suspend(struct device *dev)
+static int si521xx_suspend(struct device *dev)
 {
 	struct si521xx *si = dev_get_drvdata(dev);
 
@@ -351,7 +351,7 @@ static int __maybe_unused si521xx_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused si521xx_resume(struct device *dev)
+static int si521xx_resume(struct device *dev)
 {
 	struct si521xx *si = dev_get_drvdata(dev);
 	int ret;
@@ -379,12 +379,12 @@ static const struct of_device_id clk_si521xx_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
 
-static SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(si521xx_pm_ops, si521xx_suspend, si521xx_resume);
 
 static struct i2c_driver si521xx_driver = {
 	.driver = {
 		.name = "clk-si521xx",
-		.pm	= &si521xx_pm_ops,
+		.pm	= pm_sleep_ptr(&si521xx_pm_ops),
 		.of_match_table = clk_si521xx_of_match,
 	},
 	.probe		= si521xx_probe,
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index 913fcc5675f1..bf2276981e01 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -1223,7 +1223,7 @@ static void vc5_remove(struct i2c_client *client)
 		clk_unregister_fixed_rate(vc5->pin_xin);
 }
 
-static int __maybe_unused vc5_suspend(struct device *dev)
+static int vc5_suspend(struct device *dev)
 {
 	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
 
@@ -1233,7 +1233,7 @@ static int __maybe_unused vc5_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused vc5_resume(struct device *dev)
+static int vc5_resume(struct device *dev)
 {
 	struct vc5_driver_data *vc5 = dev_get_drvdata(dev);
 	int ret;
@@ -1335,12 +1335,12 @@ static const struct of_device_id clk_vc5_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
 
-static SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(vc5_pm_ops, vc5_suspend, vc5_resume);
 
 static struct i2c_driver vc5_driver = {
 	.driver = {
 		.name = "vc5",
-		.pm	= &vc5_pm_ops,
+		.pm	= pm_sleep_ptr(&vc5_pm_ops),
 		.of_match_table = clk_vc5_of_match,
 	},
 	.probe		= vc5_probe,
diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 5f64d93b2fac..9c8b17cb5e7c 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -214,7 +214,7 @@ static void exynos_clkout_remove(struct platform_device *pdev)
 	iounmap(clkout->reg);
 }
 
-static int __maybe_unused exynos_clkout_suspend(struct device *dev)
+static int exynos_clkout_suspend(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -223,7 +223,7 @@ static int __maybe_unused exynos_clkout_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused exynos_clkout_resume(struct device *dev)
+static int exynos_clkout_resume(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -232,13 +232,13 @@ static int __maybe_unused exynos_clkout_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(exynos_clkout_pm_ops, exynos_clkout_suspend,
 			 exynos_clkout_resume);
 
 static struct platform_driver exynos_clkout_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.pm = &exynos_clkout_pm_ops,
+		.pm = pm_sleep_ptr(&exynos_clkout_pm_ops),
 	},
 	.probe = exynos_clkout_probe,
 	.remove = exynos_clkout_remove,
diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71..da62c7b7f24d 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -955,7 +955,7 @@ static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
 	}
 }
 
-static int __maybe_unused clk_wzrd_suspend(struct device *dev)
+static int clk_wzrd_suspend(struct device *dev)
 {
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
 
@@ -965,7 +965,7 @@ static int __maybe_unused clk_wzrd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused clk_wzrd_resume(struct device *dev)
+static int clk_wzrd_resume(struct device *dev)
 {
 	int ret;
 	struct clk_wzrd *clk_wzrd = dev_get_drvdata(dev);
@@ -981,7 +981,7 @@ static int __maybe_unused clk_wzrd_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(clk_wzrd_dev_pm_ops, clk_wzrd_suspend,
 			 clk_wzrd_resume);
 
 static const struct versal_clk_data versal_data = {
@@ -1242,7 +1242,7 @@ static struct platform_driver clk_wzrd_driver = {
 	.driver = {
 		.name = "clk-wizard",
 		.of_match_table = clk_wzrd_ids,
-		.pm = &clk_wzrd_dev_pm_ops,
+		.pm = pm_sleep_ptr(&clk_wzrd_dev_pm_ops),
 	},
 	.probe = clk_wzrd_probe,
 };
-- 
2.53.0

