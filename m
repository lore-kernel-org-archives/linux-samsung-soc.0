Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F9844A3E7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405130; cv=none; b=Ua/wEbtL8RDL3eqCoR5JZY1qzVrCRNGpOyxMTqy4B9v3/u3yiwNQyAjbY8kHzZkzn1w8k7SDdY+UD9IW5asnPiBjWAasrAm7WCJTEnF5m7zAvj0mKjvUrn68TIckX9DpXJsHN6ATECBM1oxbpVhH/8S5MgFfIjlMkZTNBbuc+sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405130; c=relaxed/simple;
	bh=wNp5wOIbM4OkByN3NWZoZARJH3K8Lw/flM4b8WOkfCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTbaCbexp3er2dZoGSurpNaFrkJ8pswg9DZrrDoYW0GbGQ3Q48WFyOcV6prviRQ4C5zymZNSJAXI5+/Qv+sScJXETqTgRO7j1pb3fxE2mbrd+YP8sabgxjoyqZAdxlczRqtFwOzcZB8zDyYGBslibOLZkL4iE+vNtKYlI3+dWzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=caAeLGEp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="caAeLGEp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3552115f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789405127; x=1790009927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=caAeLGEpS+wA888wdZ8867NwD4S/fWv6aC6z9tfw4oE9xr9ODyuVVVKrtv2BABqvCE
         1sZYA3KbddyQINaLdmjie02UNDzfy0N2OxwWKZQgfTz2OJeS+04kH6xx6vIaWRgW/HVS
         R4CFNiwjHPO0vZZnVJyBU8Spt/KtUiZQ1PNesvwjxW04j7KPXRubCTTTWj9FSLs1o7I6
         vqHGhquyPixw6WeVU6ky4jmfi+2UoxENONrlHfNhm6xxz8vJgLbc3EnmbT/3FFEnIyq4
         9t+0R6vHq/n8hWesjYMHmjkTyAY036KROa/zFd88POAVaUA4GiGp+SgutSXHxWB7Y60w
         ahEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789405127; x=1790009927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dV48M+3JE0VY/bF+CPkH7qMlBx1w6Neo/WMv+TNH3YM=;
        b=RsuCSk5X2BKVQLeP4Fy7X2o9/c7S3j2LqoRTRwm6RfzkYgo9fegFE822XMqUI4PLLz
         HpN1RxXin9oGwmuWSz5h09fAyPvBVcZ8Vl1++VaIDrTAA2vsJe5b6kKKBkmFcI8bM0hy
         3oGHrp8MVfH57a2VZ3cpv5qCZd1FEuAzI+vKJL+vSQxj1QSB7RGXKC4oHTAZRAggQn4m
         4YqJ++4OKwb0+wFn6Ne4VtDD2JEGYBGPLFE+kjRr0lHdKWaMv71ZU/+aogsEJTpwYnss
         c89FrWTA0C+vSD8HnclD6LqdLpIJYvqjtttPYxm5na+AcHymvaRv48YrRBceggvSp2XW
         +/2g==
X-Forwarded-Encrypted: i=1; AKwUvBwzaQHsPk6NFcAB6cb57du8olFBJNW5SSrWeOxdeWtsczwUVA2vXnaJqbR1hLUE9U+JIgsnm6ousswVnkApaIOPGQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nxNdgTwfqnAIRvEsO7UKAx/ISFfYe25MJYGrytFBtSbcWdb0uI
	1bZV+aI84m+nPwUp0TWq9tYrv0l7RlxG1JRB3xTn2QtapvDhBoUsIgzb4hqI1tMWKms=
X-Gm-Gg: AYBFou1kpkhmCbMRqR3WIddBAYHiLpylAXj4a4CkpbL0EE0obhKmWHo28IPdy61Rhmv
	OGkKq+pWXWRsvDZG02qDmKb7RnljWyk8aVv2Dh8YB/2cJcDAZIZq7PCcEme41C1b1T7Q2he+JdL
	U4VOTEvdMUpPw3LeKaF3Srb6w0ceaOq3JP2PhOWB4BGtj7m6PSLJEssVz9bsRdY2F6aABY8dCA7
	jiU0AjPrjY+ILAGLqn6kYSx7yfsc4jX5dFxdWe5bef9eB0ewvT3GVbZWkD9WJ006UVJcGCwLNR7
	HJeXUr6oODVqk6yXMrPsGFNsSaTcjUswofpvtJZs8jKn+j6e+Z65iK2cC24UPrnNhlVjYpXPC6z
	uKXFlNCnDE4QrbdHEYjKZj3eUF3b9yUIu64400GG8Gvf6rs0+DkZ/tXJQZ3NcKJei+BMzRvlkLC
	8dsrg1JFy+Qwg/vpaWszMuzk3EyL/UykLyyeiXxRzSEFnIbpBiPgLNqQB1m9UVptuac15aQAaze
	UHlK3GjtpTTura4oGAqFDtrnju9d60XzAsaHA7S2yA5kC3A4pQIrpMHj4lw7+c=
X-Received: by 2002:a05:6000:2685:b0:484:4880:449d with SMTP id ffacd0b85a97d-48702aceed7mr5488987f8f.3.1789405126615;
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e81asm29636198f8f.7.2026.09.14.09.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:58:46 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 14 Sep 2026 17:58:44 +0100
Subject: [PATCH v4 1/2] dt-bindings: sram: Document
 samsung,exynos850-acpm-sram
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-exynos850_sram-v4-1-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
In-Reply-To: <20260914-exynos850_sram-v4-0-253871de0f61@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Document "samsung,exynos850-acpm-sram" which represents an SRAM region used
for ACPM communication on Samsung-based SoCs.

The SRAM is consumed as a whole, is not split up using child nodes and
properties related to this are not required, that is why "mmio-sram"
compatible can't be used for ACPM purposes because it requires child nodes
to be declared, which are not needed and make no sense in case of ACPM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index b83fc6831947..b9c4d4f3199b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -43,6 +43,7 @@ properties:
         - qcom,rpm-msg-ram
         - qcom,shikra-imem
         - rockchip,rk3288-pmu-sram
+        - samsung,exynos850-acpm-sram
 
   reg:
     maxItems: 1
@@ -159,6 +160,7 @@ if:
           enum:
             - qcom,rpm-msg-ram
             - rockchip,rk3288-pmu-sram
+            - samsung,exynos850-acpm-sram
 then:
   required:
     - "#address-cells"

-- 
2.51.0

