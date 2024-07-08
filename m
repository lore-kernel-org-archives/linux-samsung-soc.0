Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B93A27B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434330; cv=none; b=lSLyi2PB+yGKHVmmqGrTPWbLFcHTZtiIWNsBAigS5uOzrnvgOQ2Isr1tI1rGJpGgeVsPNYDco5b4seaPwu4dEU2MNF//Dx2hvqdedRaxtEddIhN/9wKMq17YHuh9yRjIBBhT6pacd2J1bh9s7gJHU2FkJmLH2xgYMcIW2dA7H/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434330; c=relaxed/simple;
	bh=sGBDAvNswctcuk/kjk1ua5TdJz87BTlyYVmswBU0S78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLfRMTQB087WlxAoTgw2dGNzLNLevUti17As4szuzLn/dHBMOaJcvM9iTUhmOhGLShoAXlIvPluNKNk0nXhQ3RjZMkRFKMO9qQFw+o9p5Dd1vjN+W4yoTrafc7NCgdS9XmldYYEBVJ5CRoPRFKehLS4WEnMJbdouZOO9SfBv8/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0WpBMKB; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0WpBMKB"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so4070413a12.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 03:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720434327; x=1721039127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jI6VExt196cOGjHLMIZgkrjN4DBF+pr/VqM+rA0L/Ng=;
        b=G0WpBMKBfIuP4IelHFiOo5bEjSiKfeC885eWywXecckDzdpGdxk/ROyO+vCcIDDcoe
         x9YEoX5gbSPpzvNT6myY1O4w7ZpWbCAAYH8qmKgeNS/n1WkRlxuZSq//XiYKshRd0fk/
         0XjvPFqXU4PQiKkSDP/BYqdALo/8ATYQGVZayDitXstaFCpIv+X+27XEK7ARRj8qsLJc
         FRxsGW6b9yG3aESEApy06yNW/RI47dQllczv2Tu4zbyT62g4C3bq7jIWQdPEAIEFl60q
         dlTdVIe/z0UEDD/+EkhlacEp8wmuf5SSJMKfTOrB8k0nib8JEBUBsPmTbeybT8p9Knbu
         EBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434327; x=1721039127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI6VExt196cOGjHLMIZgkrjN4DBF+pr/VqM+rA0L/Ng=;
        b=INqsmdgaGIg+9Hpg2DeFYqdHK+usliWM8B0FjAMiUKrjLfmynRfkkEkiQArctRlUV6
         wZeW2eB4UFapz4qBeNFodTdIZxrH3uktLR3Jp+WckgnnVmnQVfkvwtdM16D2kmOK6lP1
         p2vt7Y5WFT4Mc41p325sPhjHLjw8o1KaOm6BfvcsUBigjl+638+gFeYvoh0SzWxsc5n4
         haMZl7D1rsSFO0A4bsaM3EHjhZ2CV/bjODG+vz9e36iwnr+g/BSJTuYutMjqTX0l52NP
         TUWDgu2x+ugVLvE29sAOMTgephn+x30UGqg6o6LRIqxicWzMctq3NJt0kyT0/f8HCv0M
         DdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2N9z9IA3e0g/+XbtY/1KTz4qLmQgJEgNb+HqH9vfBwgrvyPPZdljztpKrWrwVNJ6N4PdLD+dq1lupQLa/fapkBBa5H3VajM6pcRRyffkRrK8=
X-Gm-Message-State: AOJu0YzFtZdpeZ3GcPmEb2P5PFhQwJJOB1oB+oET8HQZrYSr1kwjzIqP
	aaqg6viEHmZZOwUOdCTSdZvX0XHGZRpFmveOhGSoBmhmJMnga6hzE+uWuCIe1m4=
X-Google-Smtp-Source: AGHT+IFGnbgPOvevHxHVID3Wzld0NPCwFbKNE9rjCXjOAdsm+hZ7aEjxXKtcxeG1n3/cwquRVy1giw==
X-Received: by 2002:a05:6402:35ca:b0:58d:115c:f529 with SMTP id 4fb4d7f45d1cf-58e5a6ee3f6mr7598736a12.7.1720434326728;
        Mon, 08 Jul 2024 03:25:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58b246087e0sm8045437a12.62.2024.07.08.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 03:25:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL] pinctrl: samsung: Use scope based of_node_put() cleanups
Date: Mon,  8 Jul 2024 12:25:19 +0200
Message-ID: <20240708102520.26473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

Use scope based of_node_put() cleanup to simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Link: https://lore.kernel.org/r/20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Hi Linus,

I got only this one in the queue, so sending directly.

Best regards,
Krzysztof


 drivers/pinctrl/samsung/pinctrl-exynos.c  | 16 ++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.c | 19 +++++--------------
 2 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index ce5e6783b5b9..b79c211c0374 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -662,7 +662,7 @@ static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 {
 	struct device *dev = d->dev;
-	struct device_node *wkup_np = NULL;
+	struct device_node *wkup_np __free(device_node) = NULL;
 	struct device_node *np;
 	struct samsung_pin_bank *bank;
 	struct exynos_weint_data *weint_data;
@@ -692,17 +692,14 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 
 		bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
 					      GFP_KERNEL);
-		if (!bank->irq_chip) {
-			of_node_put(wkup_np);
+		if (!bank->irq_chip)
 			return -ENOMEM;
-		}
 		bank->irq_chip->chip.name = bank->name;
 
 		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
-			of_node_put(wkup_np);
 			return -ENXIO;
 		}
 
@@ -715,10 +712,8 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		weint_data = devm_kcalloc(dev,
 					  bank->nr_pins, sizeof(*weint_data),
 					  GFP_KERNEL);
-		if (!weint_data) {
-			of_node_put(wkup_np);
+		if (!weint_data)
 			return -ENOMEM;
-		}
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
 			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
@@ -735,13 +730,10 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		}
 	}
 
-	if (!muxed_banks) {
-		of_node_put(wkup_np);
+	if (!muxed_banks)
 		return 0;
-	}
 
 	irq = irq_of_parse_and_map(wkup_np, 0);
-	of_node_put(wkup_np);
 	if (!irq) {
 		dev_err(dev, "irq number for muxed EINTs not found\n");
 		return 0;
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 623df65a5d6f..a7deae4afdcc 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -251,7 +251,6 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 {
 	struct samsung_pinctrl_drv_data *drvdata;
 	unsigned reserved_maps;
-	struct device_node *np;
 	int ret;
 
 	drvdata = pinctrl_dev_get_drvdata(pctldev);
@@ -266,12 +265,11 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 							&reserved_maps,
 							num_maps);
 
-	for_each_child_of_node(np_config, np) {
+	for_each_child_of_node_scoped(np_config, np) {
 		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev, np, map,
 						&reserved_maps, num_maps);
 		if (ret < 0) {
 			samsung_dt_free_map(pctldev, *map, *num_maps);
-			of_node_put(np);
 			return ret;
 		}
 	}
@@ -849,16 +847,12 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 	 * and create pin groups and pin function lists.
 	 */
 	func_cnt = 0;
-	for_each_child_of_node(dev_np, cfg_np) {
-		struct device_node *func_np;
-
+	for_each_child_of_node_scoped(dev_np, cfg_np) {
 		if (!of_get_child_count(cfg_np)) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 							cfg_np, func);
-			if (ret < 0) {
-				of_node_put(cfg_np);
+			if (ret < 0)
 				return ERR_PTR(ret);
-			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
@@ -866,14 +860,11 @@ static struct samsung_pmx_func *samsung_pinctrl_create_functions(
 			continue;
 		}
 
-		for_each_child_of_node(cfg_np, func_np) {
+		for_each_child_of_node_scoped(cfg_np, func_np) {
 			ret = samsung_pinctrl_create_function(dev, drvdata,
 						func_np, func);
-			if (ret < 0) {
-				of_node_put(func_np);
-				of_node_put(cfg_np);
+			if (ret < 0)
 				return ERR_PTR(ret);
-			}
 			if (ret > 0) {
 				++func;
 				++func_cnt;
-- 
2.43.0

