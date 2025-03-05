Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A521260A4F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211067; cv=none; b=r5SSWWAM9zgUiERO0t7/dZqbLD/uY9GEfO3AJz8AW8JHpOf+bie1b3JjD5bnKDFFPRKxh8jwbrJUgOjwL46x8LjBJTVjdShVot7aCT8yAIswl6dg832ssLC+BbG8w3zn2PTE+z275FBpC64zhhpN7tQ2ipazonRusHvKG3BhvKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211067; c=relaxed/simple;
	bh=2XarLZImY29BpX0xdhMgfGuJC2FYaijyu3RP8qT8JLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Al87OHertSMa+zF+hLrJw+Z5JUVTR+kNVnIMbwd+UeMH2o9NkH/CHzqr8Va05TuXVTHkVAIFC92UP1ZIZCkcEVpGJdB2FQD9fZa8rc5MA7H5htsl44CxU5sBb1WODkH2ia5DMX9TxmqA05wzMSmvXmH1B8p4UJt+cyjojKX4pvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KrV3uIG9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KrV3uIG9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bbf159247so3995555e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211064; x=1741815864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmxpZ09jIu29qEi/AkYcaowgVYj+tE90JBsNORvuC0g=;
        b=KrV3uIG9ww033/vbkjxNlq4nFtMMM1DX56izO/uDQ558AECEYHEBHi9r9VRG4ovxhM
         J3suLE/yW1ItXtwQ63YCjTIWa4RUj4ZDGoRNI1HuA/nnUVKvw9lygOav+SceGyvSEhQ7
         V9EQxJqyJewxqhUiWxwhwRcHwEjuqCqyusKRgtK8L3XWOQIS9aN4KEyTO1HJSjDMpuGK
         0Sr/RGX5JhFlYyr9WmKaKiQdRYJ0GQx7NjgOmNir7JA3nOxV/nydI0OvB8rB57NauBZ6
         9a3lTugXbixpAJIPtj4GSiOF3/sugQhxhCk+SUIZBPiyx3VWkMuLDqOZI/1KwaS3zHBS
         H0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211064; x=1741815864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmxpZ09jIu29qEi/AkYcaowgVYj+tE90JBsNORvuC0g=;
        b=F47tuUaGefz0t7jGolg6H1WSfiPj1AXYAu2EpmvpaSG7BkQETTf9x67aaNBUfX88UT
         rr/i+hzFvM46tFK58RzhnL5Lzvcp1OPQq+3ZrUbbESnU0npxKkIkKUNEOo4p74BF4r2E
         Rk+rTKP2Iih8if/s1/wGmDYsrQwl+3gfICCWQ3Rkk5ZXKs3tSDCju1RFs4/zLTHQQtyh
         p7FE41+3E7kxbsxpVbCLPDm/xFx5jaY+im6HzGvtp9ZEJCUsBdHSaU7RqqUn2mtv1sCr
         6DHC+bm969ELPYUt4tXrKPNZ5+LHDVYFRq4AyhAklUNahHVSmLtQNC2JQIyun1aGmZ2X
         t5nQ==
X-Gm-Message-State: AOJu0YxNr7CGGL7MJf/vCaDNX433NLtCSQU8BwG0cfqOGNFvEgGja7F6
	qgku5nPI5LxpMeKVEBAav1gxOyg8+eMm1lPkwqTstW9Q+vG78fmZBjGGc1dJ5hE=
X-Gm-Gg: ASbGncvW4e/RsA6OBmKZ4wVjfSyb0yP4FZiGUpqO+GByAABEB7jXGIVnsrkGDis7Yww
	/LcL4gXxVMp3tmjWkhidLNvnF+Mqg7/s4dX7hYR+jaSZA/N7/4Xpt4QkcYqpJu6OH1MuB/F4NH6
	TwGL/DJP9cBhm9BhfaCG4633XiUPL2dhDrvrKWGTDWEg9sfBPdDyNz8yHa+FmRJPOmq+H9LSGBB
	UV0ahGkDEnNwfoCh3uN61Q7n7i8iHvF5dRUHPPNpiQcKvXZK/SxQQTfNdy5kuQ+poTZ9mRoe8WN
	Q9exWJnaOmgcZ8KxRqYQ1NjDafqjWDWe32fp8BlngjVfR4ZwuCCdIOcGFb+V
X-Google-Smtp-Source: AGHT+IG6/FOdq+0IiseN+Wq23HMXCjYsagVn2IkOh+9xfLrrk9mTK3zkrn7JtBymNDcg2qggUimm3Q==
X-Received: by 2002:a5d:6da2:0:b0:38f:2ef5:ede9 with SMTP id ffacd0b85a97d-3911f7cb856mr1759396f8f.12.1741211063703;
        Wed, 05 Mar 2025 13:44:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:43 +0100
Subject: [PATCH RFC/RFT 08/12] clk: samsung: exynos990: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-8-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2XarLZImY29BpX0xdhMgfGuJC2FYaijyu3RP8qT8JLg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWdiuhfOVof9WcPcy9OOBKNwinPgtWGHEdi6
 4Wc8O3Uf6iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFnQAKCRDBN2bmhouD
 16cSEACCJ5RRF+v7vfpE3v6kR1prNOGfM8tH0mQXI3ZE2Z+XWwgYIJ1SI2mIO32qJ8ls8qV8JZR
 MzgA8hp2jU4IOxj/3Qu7VE1iAuWyl3+xuad0AZ28farCExV4w953p2NFsa7UdwVf1o+QtuwPi85
 W1VMqNobFrLMD/8Kp2Patwu0MqkQP7XlTOaBLVkyTv0nR7LqQF1pS1UiUMuZ0MclpXEum1mefHm
 i/HyroEkuEos2/ydSLJU4GSWGI1xhupw5tef+azciLnQGt3n/fX8iZzVS6O6PcMQa2J80k544ix
 ec8zTfL+JID2PgAPcpKtUFE4jFSNhsAbZKQQGhQf77auM4gzyv1uaOSlwV5f+V5QtX/tOgIvFZh
 GG6Tw7klVjfHu3oh2zqzeKFzuVJM3SpfjZ371P0rLIWZfZKK2XF8Rho+EmeI6M6wnduQ3WdifPW
 zZa3QQ/XnobI7zVyvmXxMmDOuH+RGCZMdjAk7QtFUWnILCb6h9Bz+KaqZW68djPrQ2xm4xjsmPg
 ZnPJmYj4zaZEaXoLd8/UyD3Aamze/rFvI+c0AL3GscqvDw423yCPBg2I+/kxcxOHm/GUIU4dWKC
 2fneiRIbadDEqwmkL13qXecwX5wy9N2wSppxh+hRZGqtuxXprFIBSCuaqcQtMAtNOkA5N/usoXy
 czkSQ+McHPW/e9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos990.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 76f22a4a4631fadf400420b977f3f59f40f840c7..d00050d8765f25042698cbe6bfa06623931c7414 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -1504,18 +1504,17 @@ static const struct of_device_id exynos990_cmu_of_match[] = {
 	{ },
 };
 
-static struct platform_driver exynos990_cmu_driver __refdata = {
+static struct platform_driver exynos990_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos990-cmu",
 		.of_match_table = exynos990_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos990_cmu_probe,
 };
 
 static int __init exynos990_cmu_init(void)
 {
-	return platform_driver_register(&exynos990_cmu_driver);
+	return platform_driver_probe(&exynos990_cmu_driver, exynos990_cmu_probe);
 }
 
-core_initcall(exynos990_cmu_init);
+subsys_initcall(exynos990_cmu_init);

-- 
2.43.0

