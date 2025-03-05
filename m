Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842325DCF5
	for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Mar 2025 21:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211055; cv=none; b=Baq+TMp/ndUEPyI9LZuCOT9a53p3eDay5ixpvYYYu777PZL7HK0XR49ZboqAIqoIjjiWnd3Wr5FFoqvI2eSLRLz6/7pNce3+WR6p4PtoHwksr3ftvn8liwwdQedJzA8cZBI8ObwL1DcauOSuKLsIZ7j1dKAqZWWPgkqx2wMYXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211055; c=relaxed/simple;
	bh=mXOe6fwHovvLXqqthe9+GQXLrhENIXsJm1doaVUDONk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yw9QThOJm9Z1Jft4MkHlJ4XB2uaDK5xNdSHWfmHrkx73BwqMDx72mnnH4/u8ZJNt1k5f5ZGC+OFFGEv55poagERL4efDbKw9cECjcs5g0YuqEDrdSR3FHzYvHAN2bcQJJkbkCxX7oWPHhKdFhYOSQSjEXOWn9AuzKpLZNPnNQKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QDNLa1CY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QDNLa1CY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ba8bbeae2so7263765e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Mar 2025 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211052; x=1741815852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=;
        b=QDNLa1CYSJG0ftaaWxwOO8iOnNlMzGNDrNM8oZ8NmYDoo7NtA4z1hqdMYu5WoNQw/t
         9JhV7BDL2WaNYD4R4tsUZBA7vK2uKxixfHUBXyJrXqWhYI4N0ZgktK/fUNvqeHk2h0j0
         8jin6A3WHAaTjqXDrz4WuiJjvbv3vDakRdZaBqxEJ2nUDXl6RrivyORTyYqDDJSVvj6s
         JY4NkO1m076d2VqK3ka7Mp75L/wY25tj+bFkmHoLzuIvJvVsdMhLDgkrSq7nUQHKAy2O
         WBatEfdk/nGRKzlVHNaA3pMkjhyALG7pJMjRhB9GOY3ylS+/rY/OXtxPnelp061WHkkn
         FriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211052; x=1741815852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPO+NAejgK8NsdCD8o3hmdGHZSeCFTdR4suxORLeA6Q=;
        b=ghB6ZumJ/cwbFulnzE2iPfsxQdPpOp9xVpviq8NiqiJBe1uw6PU2i9lAwR0sRSlZLc
         KV3R9FeXpBTiarGdZtssiw6qPMvJ/c3LIZuwcDmkecr7Ex5rfRxSRWYZZQ4q5TLkHhCR
         nekiw8MlSlXl/nfIPRl1At6h+VU7dAd6Z/bK4+ugxzNBFTqtxMUIW6ucd+LpqNORFYjR
         4BOVXTNitAsfNBzAF67xXz0xkJWtZCLlAu1ZHtUfF/UtrDYDBusa6v/vMzB0QtJgVifY
         tf0kuWz2IbUmhuSIUgZDS+TDfv72r/HPSHljCJyE1Wlsw2VNa35agKOSYiWmX9IVoh2P
         OMJg==
X-Gm-Message-State: AOJu0YwP17wfvxRJ5bUE473qeoLYBFm2Lx35qWawqzGiGxs4FHlVb6Zv
	rQOhQjHVqjRuMqJ/EnKjfDbRV5r+SCZ5AWTWL3oQzEInq8QboM2WdO7j7r1eHCQ=
X-Gm-Gg: ASbGncu7NwvzPB8d2FUyHTT3bv3pL0RGagdI9oZBdW14XrTytpAODa28ZZxUmYRjiCf
	9v5X7izNLi+Kb0W9OSW46WNzbLzEYQnnrMVURvBvQq5qGovU074OOTBeADC2h9TC892tXEoEZTC
	s9SCRZ4rrIm155lmSVU/iweXUkBCF2rfwfhdf5Hv7tRLTi3jQ9HFTRU2ggsW//TTxPpS87R8RzJ
	r1ZYvLlyqMDANteMgQNzCbgwo7YITIPZKsVPJvvLD0jMZ3jZteZQOarA57VqNGiG6Jm4Tz1R1jp
	RZ0YP917oAi9qDzQAXisKdLnT840Kcax0OtuaJLooBjc9uYvyuGMCncs0G8T
X-Google-Smtp-Source: AGHT+IGU5f4CFfN52Eji+qJBgn9yLo2zeYNv+sZvVOANxwUJnTo17xDP6bdyENJM47mSh3r+31a2Bg==
X-Received: by 2002:a05:6000:1f88:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3911f7b2c38mr1483785f8f.8.1741211052257;
        Wed, 05 Mar 2025 13:44:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:38 +0100
Subject: [PATCH RFC/RFT 03/12] clk: samsung: exynos5433: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-3-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mXOe6fwHovvLXqqthe9+GQXLrhENIXsJm1doaVUDONk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWYud3+m8P2UJvxkM+EHo/GfYaZm7KB6mDdI
 9TVoiHY0OiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmAAKCRDBN2bmhouD
 13+nEACPnS35jbBP3i9U7AQvyLAnMz3XKRsQifaM7t8yYT6AfyoMEXcp3pG5SLgA3pVqv5ha1lv
 52C5BQr5kJ6P+NK9X0dkjtP92H2u6fubKR2rg4Dtk6RupP1xgdAAXdd+3jyjGRSFD+i2da9QjAj
 +JxhgxtCX5WjGFM51N5aJ3ryOAAq9f0m7Y67sD+co88ThBlWXrI/6wvaRIQjEvdQ5Vjsp37FrsL
 VNW+Gz4IC21imJje2I1Q48V4M662YCurNx/VWRN+ESe/k9MHsqChh+8K4Av79mQHcgmjePUSY1j
 72r+YZiq9GiMZeZT4ed2j9HdTDA5DvHfFdXu7ekCZLrQPzWd3+yI+5Tb2L0wW+VOlIWU1BMGqyc
 PpqlZBgckDKYZnyH7Kx4HqZFkCZNbW08ekfhT6LGncLMBtadr4GdO7hpI3xy2V4IQ9mZhPxUyHE
 xj8x/9xy8bmBGu0aF7ZUxm4ufQUsB/AMRM0PQ0fnMDVfOnyvURmH9bGkcz7qp6z3klJvx/J7I5j
 YjMpjDQZGoJjcDqu6G+J3NYY6iNrYgQJq8W+W5oQTIEyuzuIs4B+l9O3xH14ysWXH+v+TqoRhWp
 Uv1n9ppucj8g5zRIepffyZg3m8837UyxgsFw+qWvdQEUyLBKnCjPnXMVSo8SwNPQvwoJPQWbjVw
 zZz63fp1bPZnPGA==
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
 drivers/clk/samsung/clk-exynos5433.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 609d31a7aa5247e6318884609d1e651001616b73..d18b4f7b96b66e48fb94b86b663443ec691e968d 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5555,18 +5555,17 @@ static const struct dev_pm_ops exynos5433_cmu_pm_ops = {
 				     pm_runtime_force_resume)
 };
 
-static struct platform_driver exynos5433_cmu_driver __refdata = {
+static struct platform_driver exynos5433_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos5433-cmu",
 		.of_match_table = exynos5433_cmu_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &exynos5433_cmu_pm_ops,
 	},
-	.probe = exynos5433_cmu_probe,
 };
 
 static int __init exynos5433_cmu_init(void)
 {
-	return platform_driver_register(&exynos5433_cmu_driver);
+	return platform_driver_probe(&exynos5433_cmu_driver, exynos5433_cmu_probe);
 }
-core_initcall(exynos5433_cmu_init);
+subsys_initcall(exynos5433_cmu_init);

-- 
2.43.0

