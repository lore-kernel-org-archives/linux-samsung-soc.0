Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135A34B18B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915372; cv=none; b=Q77agbFDqM6gSYbEPGrZ5xMPsfXF5B2uXbE14qeU/h5eVXbok82OzyoLimuhw/lLN/OTqMrC/N33oNrEq3cJ7C2F3XMkKQFQIOnktFFHXvdGpBji4hRRiCqhrYQICPaePtQRWaopVOfJ1qRC+mDBzBQ0eJ+to/IDqYXsDAbrMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915372; c=relaxed/simple;
	bh=YpELVcKRbuAd/GhEt+Uw8ZWb+caf7nBbVVxyl3NyrsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJv7ZDwW3eotvJemx8bORg1ESmjamJpkdjlmek3agjb4FyODSQ0nuEBWsWPoGUsF+3OPaaaz/qZOzhfb7e5xlUBWqFBD5L/dQSJiAsZoPAtfRru/b8mxg8Da7WDcMEus7ZbrImplRjKv8uOXK3T0/OkW02Ut5Xq6XGzXTXRFBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CGFOZ52Q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CGFOZ52Q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429b85c3880so2073639f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915367; x=1762520167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2E8O1HVfDYkA0RiCP/aCuaFM9xdalT+JDcjuD9x3xgE=;
        b=CGFOZ52QZfppPMqllIkGiG2tWNJtXKZmTmP0ZY0GXZ/7IvcJC9ERMAslUNcks++BCb
         kad+qbB3/elCH/km+fVV9JDJeuHDFgSv+tMK9HB6YUZVqhzPCDdi0xWQAuBZxr9yeezQ
         4Ajocu3fIvMFMRWA5mKXGOXL6zUHX1pxmdn2foQ7nEqAYfvIJ4Y0C6ivU61IAYCACb45
         PipZk5cQfUBLhzGjMCkirCkAJdewZvDbOI4byWIcELSOTwi5uEOaEvXUdM7cjf7vS5gB
         InJj2f7Riwxc8wghFzL35IBJp2/vChIsQI71fijYL3niPfHNW8/Okc4omk1ago/x3p3H
         rw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915367; x=1762520167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2E8O1HVfDYkA0RiCP/aCuaFM9xdalT+JDcjuD9x3xgE=;
        b=WXNTjK6dI2SmHLbyqIwCHW2mVuKizZb8hvjK9RZGMNYTQmuqLpft0BDLn15WAb96w1
         iBwN5BHB48HcQPctej/FKlilNNbNAkOXSfy4uPB1VjZM/aZWE6V9zOU4gU5AYWIz46Oy
         4/Ji1ON5soywfS6657cu2qCNdRQfHmCyPE9HtXgiwgVOSLsIgsAbz93SuSneM3t+CXxh
         OL/jjZh6akBbGbshQC0bpB0PXr1kTDqOdvdEJBEUbwpzv6jfeQieOy7tdHrqw7ka+zUW
         T+oUWjTKxBqMW6C4VT18d9u9//EbG5+jgssMqH3fIrsXYhnMorwFIl8tMD32WR71XMeM
         NK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAYQWU48KbfnAwn69ziAUasgbcxXTOywZkAiMK0hnOfvB9rvjLN33OcbPaNYUEGzIIM3G1oPJ2HF9xOn5IrvF4qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyccOev2Z9iYaa1yNKzoARqWVWfB/kCe3+DAD0+A8cRdANpKyDL
	zuk6Yr9vSHd/8ynl4VoJchsFKQ/TLWlcvcZuWr8DDfZZ7z8HN9YINoe6ITcBpZpmNCkIa/YXQbF
	g9IdMsGc=
X-Gm-Gg: ASbGncu78jeS2lAjjBWvirziQELqCAoc9WK1MlWEVhcZDLSZ15Nx1hW2aGXkQNOt8Eq
	wCSjygIITtM6LMDCIOdeS8GA6D9m+zXLVQL2Hua1cCeaSHXntkCxSjxQ9Y0TdMrTzRAmETz1qTA
	09qWMsCGJl5CfjOJQ7PWVyZO9LPj4KkAYu1pnTrlYKMz73kF5qefHbnUyYkZQdvMAFNAwhDmXXk
	3MojkMQmQ6WZ57eKg1Id31jyXI3qSPRPAogDiCnAFEKl9XgLGfWKBTHBK8JTlLXmxjPt7pNzgOa
	VH4tzjqXmtebZveGiSe70yMR75e+STJrmljRnEEW17s/oqzvHA/5AsSmFOi/WXbCyL7S+LmV2pT
	eOgUyAn4w1FhQf/NRkExB3gqn0bA7t2smyDDEosYXDmogRpyCsxwX4XdeF7P/EiaFFuaor84HMN
	lGd+aS1hYET/raxh0I6nWs+ITXhXCqmli3GfGEBE7L69ulLKZvwyUX
X-Google-Smtp-Source: AGHT+IEM0IizIY6zKHHTUoU/7maB6WNMbu7DQNWYaZmsDz61aQ66cg1D8Vspw9HQMEmMkaFXkgjmuQ==
X-Received: by 2002:a05:6000:4813:b0:429:89c2:d933 with SMTP id ffacd0b85a97d-429bd6a661bmr3174422f8f.36.1761915367453;
        Fri, 31 Oct 2025 05:56:07 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:04 +0000
Subject: [PATCH 05/11] soc: samsung: exynos-chipid: introduce
 match_data->get_chipid_info()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-5-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=4101;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=YpELVcKRbuAd/GhEt+Uw8ZWb+caf7nBbVVxyl3NyrsE=;
 b=UEW6/PQ3Egxk62/OqWjiQypCQ7SA35bhWD5liiLVFOeTb2m9dp8f2u0wl2seB2jO2g9zYq8Fk
 afYP3a8tYFeD0XpzgeLk+q2Cd1vzo0fyR4BP8LIeZPeNIStcCkLZEiC
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Newer SoCs, like GS101, don't have a dedicated Chip ID controller.
The GS101 Chip ID info is available as part of the OTP controller
registers, among other things. For GS101 we will read the Chip ID from
the OTP controller using the nvmem API.

Extend the match_data with a get_chipid_info() method, to allow nvmem
integration.

`struct exynos_chipid_info` is moved to the top of the file to avoid a
forward declaration. The structure is extended with pointers to device
and regmap to allow current implementation to obtain the regmap in the
newly introduced exynos_chipid_get_regmap_chipid_info() method. The
nvmem consumer support that will follow won't use the regmap, and
instead will use the nvmem API. It will need the pointer to the device
to report errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index ab6bdf24a754a0faf974190c1fa1f99735cbef8e..7b1951f28e8d4958ab941af91dab4b0183ceda5f 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -26,17 +26,21 @@
 
 #include "exynos-asv.h"
 
+struct exynos_chipid_info {
+	struct regmap *regmap;
+	struct device *dev;
+	u32 product_id;
+	u32 revision;
+};
+
 struct exynos_chipid_variant {
+	int (*get_chipid_info)(const struct exynos_chipid_variant *data,
+			       struct exynos_chipid_info *exynos_chipid);
 	unsigned int rev_reg;		/* revision register offset */
 	unsigned int main_rev_shift;	/* main revision offset in rev_reg */
 	unsigned int sub_rev_shift;	/* sub revision offset in rev_reg */
 };
 
-struct exynos_chipid_info {
-	u32 product_id;
-	u32 revision;
-};
-
 static const struct exynos_soc_id {
 	const char *name;
 	unsigned int id;
@@ -80,13 +84,19 @@ static const char *product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-static int exynos_chipid_get_chipid_info(struct regmap *regmap,
-		const struct exynos_chipid_variant *data,
+static int exynos_chipid_get_regmap_chipid_info(const struct exynos_chipid_variant *data,
 		struct exynos_chipid_info *exynos_chipid)
 {
 	int ret;
+	struct regmap *regmap;
 	unsigned int val, main_rev, sub_rev;
 
+	regmap = device_node_to_regmap(exynos_chipid->dev->of_node);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	exynos_chipid->regmap = regmap;
+
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &val);
 	if (ret < 0)
 		return ret;
@@ -112,7 +122,6 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct soc_device *soc_dev;
 	struct device_node *root;
-	struct regmap *regmap;
 	int ret;
 
 	data = of_device_get_match_data(dev);
@@ -123,11 +132,9 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (!exynos_chipid)
 		return -ENOMEM;
 
-	regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	exynos_chipid->dev = dev;
 
-	ret = exynos_chipid_get_chipid_info(regmap, data, exynos_chipid);
+	ret = data->get_chipid_info(data, exynos_chipid);
 	if (ret < 0)
 		return ret;
 
@@ -156,7 +163,7 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = exynos_asv_init(dev, regmap);
+	ret = exynos_asv_init(dev, exynos_chipid->regmap);
 	if (ret)
 		goto err;
 
@@ -182,12 +189,14 @@ static void exynos_chipid_remove(struct platform_device *pdev)
 }
 
 static const struct exynos_chipid_variant exynos4210_chipid_data = {
+	.get_chipid_info = exynos_chipid_get_regmap_chipid_info,
 	.rev_reg	= 0x0,
 	.main_rev_shift	= 4,
 	.sub_rev_shift	= 0,
 };
 
 static const struct exynos_chipid_variant exynos850_chipid_data = {
+	.get_chipid_info = exynos_chipid_get_regmap_chipid_info,
 	.rev_reg	= 0x10,
 	.main_rev_shift	= 20,
 	.sub_rev_shift	= 16,

-- 
2.51.1.930.gacf6e81ea2-goog

