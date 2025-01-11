Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9379D1B86D5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jan 2025 18:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736621648; cv=none; b=tsNvB3xYGkC3srnJpdjdx4hMcB1QFKqLfN8o3yCxkGUs25VVKsujqB+gacReYVeu99ZXMtSXwCtiVCtGQvNGV9lMQK/QR/S1GuEEiHJVI6EZwXOkeR4pRC3CKSB3gyhQMy1+61YHHxPF6x7BbByCl5SIj5ocG9f7rTjQrx/MTEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736621648; c=relaxed/simple;
	bh=DXrQAPF7txiqmoF903YnIFHM8jg3GsgH23ML5WrryKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AoYz1ZLyMn06tDz9MTSAlcLM4IBz5qq/oLb5aZMCmDhAHdXiwXoQnxuuqbCfziTz+bnZKfiDQY6wjqYrVgpxn2T3ZMQooNkSNsPzJLkdhs+WBsESmUEbns+COVJ2oV6wG79s6IDgxCmZ+vkLqzE9vFogT7PjqewY9lclxEtLRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tj4kSDPQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tj4kSDPQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43616bf3358so4187115e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Jan 2025 10:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736621645; x=1737226445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jpeJmNd3SZuuzmsG64ANuW49jVrr7teCJ/vcrUeE7Ig=;
        b=Tj4kSDPQZ9KBDoFOJNzbqc4ZLCawOMGbT/5awAi2Gd1Xls1fkRww80uA3pNiQ4Zabe
         SehZTnu/m7Q3cEJZI44RIHyy9Rkg7NH2Da3XEeEV1ZyFuVJIfjKExm0Ty3nKuzqOQC8b
         eGYH5vCmo4GcVMyOuOP4+4SnC9w1T8oAR1Sj/pM+YKk6fEqyr1eUpSDbvdDqf7JxAx9v
         we9DzJPDQR9zshCZl1P6OYQaLuDb7Ce45tlErAiwHNps/hL4OVeWRulMg1OTtvP6Ff4o
         RLPzRkzLUr1fiY8ra5HEW4Hg1/8blUMvSliGUMeqySQu8mcSgB/mBnHm/BDCSmH+/wM/
         gkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621645; x=1737226445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpeJmNd3SZuuzmsG64ANuW49jVrr7teCJ/vcrUeE7Ig=;
        b=Ep3wR+vhyyUUIszk9AIdzPpF5gYKaR5Tddur9z5sc32nGblncq3h6/+OMnxZy5sZwj
         RHz3hUCHUTX4Ch2HQ9k5OhypfjrSL1s3AutNuI1sC+/I9tkVcXp0D8HvSNCi4o96Sj8A
         YpZh8QH9I2HyjnZkufIFBGwUsmDL9srOh6RfJEAwWGYF9lrJI8rXr0KNW3Zh/wZdUbxu
         fc7pNgdstz6AFtMR0DcXBDD2zLvVKPINUk74FhMoVWk1NHswLJtY4UTEhWHe3Xf6iOfz
         5oSHb7sHI3l6rp/Quo/rovwkTCEHgf0vWvEa1uhy2me8pcHNpQ4nVEtORrFd/gp2eINQ
         esTg==
X-Forwarded-Encrypted: i=1; AJvYcCWvCI4HewBHSHdg6j7FXkiQ5Tot+srXTzFnVX5P5VLqcpSgIXWeevn37Sou+agEWfREshkHA0SMlXOSvVYE40OGbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynBTKxo+sr1RB0+/3a5p21weXi3DKyYYa8AWX5l8az9Cpnyeqm
	Y0/6Wz0JDdb8WXEqyb2cPp0c8+T2seusDidbajwyl+HEMiG/TEjFssAqbUPR4O4=
X-Gm-Gg: ASbGncsEsXYcJ1+9k5C1GAm+TsYPUUBEuCBaMT7jIC1qCICPnb8VRct4AWovtCMDbP2
	ctv3jbp+QU5U8UkyxlA7M2FQqjo4yNBqG5RtjEGUi6akGOodIyMn7mXZs2PEciX9zU1T+uRKVhp
	DYNY/+XRbVevgPScsA0B/SWO9jPszdcK418sI5ar2Omwc9vaBT72QJsozu6lAoJ1hfcwoCSfSSQ
	ScczKMs9RhOyJfXqj4BCTTrmABUzjP8FXNeT+uOIQjgctq+qneaMHPuhcc4eZopS/ZyJC8=
X-Google-Smtp-Source: AGHT+IGhaDDKUbfokl+jU7qgUB7s/J6vYAVw+eGLas1JhElcOU2I0jx8Rxm9e4DElHdlP23nsTC55w==
X-Received: by 2002:a05:600c:63d5:b0:436:ee2e:ef12 with SMTP id 5b1f17b1804b1-436ee2ef108mr32106725e9.5.1736621644668;
        Sat, 11 Jan 2025 10:54:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fc5csm90730145e9.2.2025.01.11.10.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:54:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: samsung: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 11 Jan 2025 19:54:02 +0100
Message-ID: <20250111185402.183793-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/samsung/exynos-usi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exynos-usi.c
index 114352695ac2..1fda8d72f687 100644
--- a/drivers/soc/samsung/exynos-usi.c
+++ b/drivers/soc/samsung/exynos-usi.c
@@ -186,15 +186,11 @@ static int exynos_usi_parse_dt(struct device_node *np, struct exynos_usi *usi)
 		return -EINVAL;
 	usi->mode = mode;
 
-	usi->sysreg = syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");
+	usi->sysreg = syscon_regmap_lookup_by_phandle_args(np, "samsung,sysreg",
+							   1, &usi->sw_conf);
 	if (IS_ERR(usi->sysreg))
 		return PTR_ERR(usi->sysreg);
 
-	ret = of_property_read_u32_index(np, "samsung,sysreg", 1,
-					 &usi->sw_conf);
-	if (ret)
-		return ret;
-
 	usi->clkreq_on = of_property_read_bool(np, "samsung,clkreq-on");
 
 	return 0;
-- 
2.43.0

