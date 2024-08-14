Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94571B4C5A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647866; cv=none; b=ttOUgKzlunXTap74CFfKBvNCAjx8M336DrsuAzj2hur+NxGvIiyrzEfhE8KcnMhYiS/10GGmRaLdG/Vfh1QRyoDSmwjVgtJvsLEoLOpz6DIWjXJqF6aU0ti2GVOWDnofjXze9Fsii0kD63T+k47Skcj+sK1xvwT0CmNjafJb1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647866; c=relaxed/simple;
	bh=HKFKyZib5VKnJdUuDJakQAsIhOr5X3HZ7uhakSIt1BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHlcmrlJneAIR7IzXInqqKa3nm1j2cMXJ13YZBs7AMiPzg+Z6lUL8F+ktl8qQ/9Fd//uhRr9zwYxM7QriZg8dXFC1q/Kmw4WhP9/p63UzuKp+Jl5prkcFFPLlwG7loZh8MehBDYUMLd9paCZin635Eyu2ughX5BmJDDEq6AjKtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orDNm7Ao; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orDNm7Ao"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f025bc147so7895339e87.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647863; x=1724252663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ql92g3IlSel/JMsJTBmGL12yP4qS4j4UtrmTRytGT1s=;
        b=orDNm7AoFP7TzEYZEMbQ98x7rfuzflilFXbLB6r46d1feAFzpArl8m16zfVU5FPA15
         cZg/vrgj/fp3bVPG6dvJwXrzHHSYzIGCzaIrYooEEuR5SsdbuekwvCPwcWf8lChYw4IV
         7M9FmYcgwXZKq2q9MlAZB+7yyC9HeLKuBPAnc3VBlLMhGwTKLKpB7zNu6xdtfK0fAjHS
         ux8B/sKDZTzEkOraGkGSAe/3amkAern+B6LCKVJAA+qC1N1roYWoQEpfnOcniJEv4Xwu
         2bAMmwhxOhxpEgdWDR/PWN1Rs83k9vNDZXBn0RBEwf7aT6gvon2tcdkYVkKe8DWVKalD
         DMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647863; x=1724252663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql92g3IlSel/JMsJTBmGL12yP4qS4j4UtrmTRytGT1s=;
        b=sFmR4H3dwVMe+Z79Aw9pA3w5ddl/kCqnPe0KapERJEo/zDkc1pvwDQqTkYn2V6BVtn
         zMKT9egvCgZq92ZWon/yRXiTk9xGATTYsdELbGC9SwEBFaS00K5HX7Dg5JGLbQtArt1o
         PH5pwyP/v5ds3Vk6vNdHmJxbVUOduy5qYOh/ceXpYS0qM27CUqqRGVJIhDz94rtrODjH
         PbORFTQ27Ebya5Toy0aUe+S6/kDyy9oZiXV028VyHqSdGbSybJ74i6lnX1KCL4kVr1hZ
         3VAde/lGCnPbise9Bz7I9UlNbR0V29ghrNgu95ipO3YxcPFxdsnON/FXqMqlkN6A31LN
         qd7A==
X-Forwarded-Encrypted: i=1; AJvYcCW8/kIH0S5OF7dM8JthLYQuk4HLA38OK8WFkq2ywE5Vh0ixhmHk/8P13R1OeFqcOb9BeEjwvXMcqoJxy3DbYcYEjBXcj36pKaZipl+ncxGWpiM=
X-Gm-Message-State: AOJu0Yw9BUQWy79ELpTtprMX4wNlX2CBSio1YTG71o17JUI44SRMJaQa
	0ZO6qTra3az/vAXgB2NGB1UOfTCg93ZoZl9SI4gLdQBB8Va0swgqsY7GFpVa8eA=
X-Google-Smtp-Source: AGHT+IGu3DwjbZr/7noh9P2H71pz2ZOViSHbSyH2U0t4pwvKJvHyX+AJnV0p3bUqSkfSvtJejl7obw==
X-Received: by 2002:a05:6512:239b:b0:52e:fa5f:b6b1 with SMTP id 2adb3069b0e04-532edbd598fmr1593960e87.60.1723647862671;
        Wed, 14 Aug 2024 08:04:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:07 +0200
Subject: [PATCH 3/7] regulator: max8997: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-3-87151088b883@linaro.org>
References: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
In-Reply-To: <20240814-cleanup-h-of-node-put-regulator-v1-0-87151088b883@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2267;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HKFKyZib5VKnJdUuDJakQAsIhOr5X3HZ7uhakSIt1BE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdp9nwqP+7IBK1IA/FESYOQpVx8C/ZOu7nHN
 dyB7jnGN/iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHaQAKCRDBN2bmhouD
 19D8D/9qJRD6vc6koDrB7DKkh+SqxKz5mPXuv81NfvAKp+tFZIxwGsSE38f242goqHEvg0UqrX9
 dawZdUvXXPprvW8yQUvzaosVLYsXRc6VmfshmGrpqBOk1m7yHeJLDFbwYAvAxMbQSTjub+eHBnN
 R8a14Pkkize/+HCavGbDnRoeJskMzDuMt3Vpdic7fxO7D55FQ1aAT2NLQpMt3rOpCxnc+QNF84g
 PFN22YiJ/B2BWzAydXgdiNxzseufjng+ISc0XK5QCxtC9L9F0gNZnFZ7+iRLRu3rZgRGSJmFYfw
 QlC5J0Iwpm+sxUTvElWmuSTx/LXZhWZ0xVCPWhD92bnWtjRTKG+cPiVf1aKNTycw88Wq1a8dSv9
 PuPlf2Y3RIPsJgfNmgYoy/SarvcQ6DD5hm9lzdz9qRxq4ymiYnDQRj6sF7N0TFXHCnU3UDMyAs3
 t6UaPf5u1/NlLJCcIGwl1GFQnZVvVBESEkXWMWKTDNExWPgxXaM+/1kA56qZF+XzWvG6EEewhVL
 rT1bbgSgbq9UYwRaK3nj1lbQSF64DQqb5o0l5trm4M8Zvwj8zqtICo1+qGYnC1qWdB9aKaiH26S
 LGa+pzCVV7KA/5n8YKfdMYFDfROyoBI8vLci1zwaovbUlNk67VJYY41rGvFg5znsw5ne6eSX6/b
 4rvA8VGg995OeZg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/max8997-regulator.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/max8997-regulator.c b/drivers/regulator/max8997-regulator.c
index cdbfb4561dd8..e77621b6466c 100644
--- a/drivers/regulator/max8997-regulator.c
+++ b/drivers/regulator/max8997-regulator.c
@@ -8,6 +8,7 @@
 // This driver is based on max8998.c
 
 #include <linux/bug.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
@@ -876,7 +877,7 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 					struct max8997_platform_data *pdata)
 {
 	struct max8997_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *pmic_np, *regulators_np, *reg_np;
+	struct device_node *pmic_np, *reg_np;
 	struct max8997_regulator_data *rdata;
 	unsigned int i, dvs_voltage_nr = 1;
 
@@ -886,7 +887,8 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 		return -ENODEV;
 	}
 
-	regulators_np = of_get_child_by_name(pmic_np, "regulators");
+	struct device_node *regulators_np __free(device_node) = of_get_child_by_name(pmic_np,
+										     "regulators");
 	if (!regulators_np) {
 		dev_err(&pdev->dev, "could not find regulators sub-node\n");
 		return -EINVAL;
@@ -898,10 +900,8 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 	rdata = devm_kcalloc(&pdev->dev,
 			     pdata->num_regulators, sizeof(*rdata),
 			     GFP_KERNEL);
-	if (!rdata) {
-		of_node_put(regulators_np);
+	if (!rdata)
 		return -ENOMEM;
-	}
 
 	pdata->regulators = rdata;
 	for_each_child_of_node(regulators_np, reg_np) {
@@ -922,7 +922,6 @@ static int max8997_pmic_dt_parse_pdata(struct platform_device *pdev,
 		rdata->reg_node = reg_np;
 		rdata++;
 	}
-	of_node_put(regulators_np);
 
 	pdata->buck1_gpiodvs = of_property_read_bool(pmic_np, "max8997,pmic-buck1-uses-gpio-dvs");
 	pdata->buck2_gpiodvs = of_property_read_bool(pmic_np, "max8997,pmic-buck2-uses-gpio-dvs");

-- 
2.43.0

