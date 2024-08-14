Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824B1B3F33
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647863; cv=none; b=JJyzyICpppYH58C63Xe29JGUD34fr+pjAL3Rsg+XBNtKpyu6yyIEyl/hTWmEk88WvQBuXFs2ZRbIBOTDeMfhENP4RBEaHh/fwx5qsdQ69H5kDHCgTvUrItNtPrUiRcAjsQc9fiyIFlqzcCWdKyrHraTEAwHAxRXAGZQXDnkGGGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647863; c=relaxed/simple;
	bh=MNChZLpbj/MWNGgnwsRcQZFxOn02r/u5ky3hmD/OW5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ea2YltHDeTIbwZfNnz/CR80u58bXJ9LERJr05pDJfjvsN/CLx7qiuHIyH9omtXwrBF1Q1KFJGPYv3cuN3ApwUZVWVPal+M12CtdTZjape4xKEb3unx8q6MggZWnfMMi6vkcXCx+t2UG0UFR6EkJ4aFC1E4/qLtflODtVJ2wg5YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNYfndFp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNYfndFp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so47005415e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723647860; x=1724252660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEeIEqLVY1ZOACq24mYbeXb9wBOy2fSNM9DcJntAJ74=;
        b=kNYfndFplcqaoU0uQe8HW/45LKEDHMEukIBG0zICkmQejdgyyLvHmzUOfo/atPpVDo
         EpwTmijGxf5Dwn7he0KSkSWqsiy7+l++gyfNpwlSJWBQRUdLYgketgpYWbkfilknB7Iw
         8BHu8SjhzZo0e73lNAtTQ1rDoTdJQfGDXpA/cqmctFOl67H5LHyGJpuD0zMv9jE2Gabg
         eD8kcbYnAyg1McBt2lMHhq1+s12Tcg+AlUjjQQw7/KSGB1tjAIFrpmmbQzuV0SvJtjQt
         taG2jfOTC0AQAMudcKC1mwi5vpUyf7TTesjt14tNSO2F/kxYQNNS0OfmQNV8ZNzz/WPn
         FE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647860; x=1724252660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEeIEqLVY1ZOACq24mYbeXb9wBOy2fSNM9DcJntAJ74=;
        b=BVQmg3d4nAJTbS+Wbpdd2mRtbr1BFlPxx9dkicAkLEmDN15uXyR9wW0/Ror/BVuZzq
         7qQbSt/JaazdtSWOzS87Tr4BJLCdsIR5rTILPcM6l1xbX+XPNl5c45p0smOl8UWa+ljL
         NqPWai+/8mK3fgpTN3EB99G3uvRcJAjGUNHFcNiVYgpDs9NsnecpJgHBSU7dRDhdYLNW
         QSO6wQ+e40R53EvZkrUpfMHqKy5q2G4atxtaAT+7CshcnJwuKbifx8Ecp+B14gsH1+fr
         wlkQbFouUEupLst0VONue/2KpAnmgBDTs25QvqOvPgc/ZpukDbfUFtc3ZYeI25EsdDDF
         mbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo4qN7WuHFBFati3OR0+Koba7cRhq50Q4T8a/5nyfnn7IdITKaDc0YZo8aJsxrxPbR0BrSyZE0UQLATnjZ9nrucQtrsGA0EWCZbljv7sZ44Rw=
X-Gm-Message-State: AOJu0Yy1djIc9QdWtWdmZDzMuLG7npcYvJgJh03FxOOwWrVmI+Qmgdp+
	mr1qgl1FDd15iYx12ip5LgRkq2Fyw9QyaanfFSQ8g/2m44BqUcGj6BabBuOkxdE=
X-Google-Smtp-Source: AGHT+IFT+r/UF1JH6FSsBdVJjL7VZm2U3O/9DdLtdnvhN4tdlKULjzOhZLrhWci1h9xgCzKbbXSdTQ==
X-Received: by 2002:a05:600c:45d4:b0:426:641f:25e2 with SMTP id 5b1f17b1804b1-429dd25fa5emr22233205e9.25.1723647860210;
        Wed, 14 Aug 2024 08:04:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm22313425e9.45.2024.08.14.08.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 08:04:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 17:04:06 +0200
Subject: [PATCH 2/7] regulator: bd96801: Use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-cleanup-h-of-node-put-regulator-v1-2-87151088b883@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MNChZLpbj/MWNGgnwsRcQZFxOn02r/u5ky3hmD/OW5o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvMdoruzUKLXQwbjGAbagYQRMvAI3PsR0rLQ3V
 3/d6GTLP6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrzHaAAKCRDBN2bmhouD
 15VjD/915tQj7Qr/6BMFohsF8gAVyxOqUm4K+gtazmjt00iFyD/Orfef6dj8ZvNjvrJrWRq0W6+
 pXjE8qpNUNa3Wtgo1JPy609NgdDYqcR6/3EBi4BBlVji++M7tWPG8JemQgwc15rdWMtB6Ej5oRR
 DoRO21/y2QoVbOuEVt5K4oYn8lg2O5nPVWJzm0s7WsrbIw79DqJtci8BU2nhPlcV2rhlm+YLWb9
 Xxbr8HfPE9lqPCO8iz0Smvz1f9I8gr7DBJjOJ6a6Dfc7TVqyXLBKi2bZBtYq7b25f4OtgR/6KNP
 7lHQ+3ZT1uKR5aZ80FYXj43Ll2njZERAWhYqVgkdqjE2Rcxnf9mKckvPYGWAe+e+J2kKY8SwUyt
 L/oPBj6Dyh5PB+bwMVtnLjPYdFKFRjQyW+KUHTcrznWlxtndQX9DO/Cdrbyou4pskzambf/W3fw
 9oE4f8Y3tT6tN/IEraEh6FcVLI4fGays5v52k8T9k+cN5Wn8jTY7OHGeXZnJCWTsM7+z5RhkG90
 gWRIcBmRA3lPQ8WxbBbf/UFT9szAjyaOqDffANjGHs9xlq/l5pV7iLsusIm0ngvcEe8tzJMpat/
 npiHx9Q1S1L9u4zZTdkec/mDGVOYm2xjr63eWgQZ/39CNwG5b+dpRTgbmh8W6mrxj23NAbZtGuX
 wtbSUQR6cYuCv7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h and use scoped
for_each_child_of_node_scoped() to reduce error handling and make the
code a bit simpler.  Add also brackets {} over outer for loop for code
readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/bd96801-regulator.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index ec5b1a6b19e8..9876cc05867e 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -34,6 +34,7 @@
  * conflict in your downstream driver ;)
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -453,15 +454,14 @@ static int bd96801_walk_regulator_dt(struct device *dev, struct regmap *regmap,
 				     int num)
 {
 	int i, ret;
-	struct device_node *np;
-	struct device_node *nproot = dev->parent->of_node;
 
-	nproot = of_get_child_by_name(nproot, "regulators");
+	struct device_node *nproot __free(device_node) =
+		of_get_child_by_name(dev->parent->of_node, "regulators");
 	if (!nproot) {
 		dev_err(dev, "failed to find regulators node\n");
 		return -ENODEV;
 	}
-	for_each_child_of_node(nproot, np)
+	for_each_child_of_node_scoped(nproot, np) {
 		for (i = 0; i < num; i++) {
 			if (!of_node_name_eq(np, data[i].desc.of_match))
 				continue;
@@ -476,11 +476,9 @@ static int bd96801_walk_regulator_dt(struct device *dev, struct regmap *regmap,
 				dev_err(dev,
 					"Initializing voltages for %s failed\n",
 					data[i].desc.name);
-				of_node_put(np);
-				of_node_put(nproot);
-
 				return ret;
 			}
+
 			if (of_property_read_bool(np, "rohm,keep-on-stby")) {
 				ret = regmap_set_bits(regmap,
 						      BD96801_ALWAYS_ON_REG,
@@ -489,14 +487,11 @@ static int bd96801_walk_regulator_dt(struct device *dev, struct regmap *regmap,
 					dev_err(dev,
 						"failed to set %s on-at-stby\n",
 						data[i].desc.name);
-					of_node_put(np);
-					of_node_put(nproot);
-
 					return ret;
 				}
 			}
 		}
-	of_node_put(nproot);
+	}
 
 	return 0;
 }

-- 
2.43.0

