Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD720DD52
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328678; cv=none; b=ePUZ2WWyNFGKJ2kcnzAJo9S56fk3N24ngwpw6Xi2b4M2Aebt9Kycdh3gC5oNa0go9V4cfFAoiZi8hv6Tdcdl+rlAyPDi3EzdRRYSM7sca9tYCnh35Cp+Xm1BeNVMQVY9l54lCr+WpFRJcOH/peXNnlYjspK5e1DsHiRRkhZKocY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328678; c=relaxed/simple;
	bh=VSqkKAfAsASQV1wNAEnHQHuaUPvFzGicTvWIh5Er0fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+VbSBgxABXXmQsVzxU4FutFiv+64g9CXIq0ahLBJF/biTwe10h2wwdZ0aRzS0sI3ezb3EXEC0k3YD22adVs4GnmdqNEASXNOhb1FIuuW3Pg2E8eo/wWqkD56hexdOMgMJmho2R1AIy63vToQDR+4STys2XIWdQB3jJPznskJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qCKNjb/I; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qCKNjb/I"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so18963025e9.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761328675; x=1761933475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdUt0RNaR2iDfSWCYFBAweXOdPy+lzj4EhVJE8ZDdzw=;
        b=qCKNjb/I9X/5OZimIEkf7QcbMYNbFdq7qOi1IsLLfTu1W0chklcVXHUGKsJp71kffh
         qVftJcQWh8kraAgKyLx0a09zF1lJk26P7HqmUz+aQ5gVCDvtraxRsat65kVkm5ShVWeO
         1ZOWAdY5SFwvb8fYQ1ggH9jltFzm361f6bIzbyAFoHaVK7INi4yFZ7vwKGuIeRq4kkCG
         FuesT8tPkKYdCSa2Dxj4DHKlouOyy/Aq0re8WNnVlFiDf7lknHUVLZEWSLRTuFU1flQU
         whx/tGYNxpjWhU/8kXd4vcHZqLQDl4iwSXbA3T1iiYvbr9jHtB3pqLtzqbTVLPTkSL+C
         cD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328675; x=1761933475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdUt0RNaR2iDfSWCYFBAweXOdPy+lzj4EhVJE8ZDdzw=;
        b=EB8v+wQOnPoiaOCS5TdTpkJnYONBCYpteWsPzOj7pUmZdjG0KpgY4S35wIGZQablCy
         D/Gre+2+M6n8I2a/wDaQfYm6urylAWqYaXdsKOHSWc142pP5aKFTbSN2aLSIMbbhyUN9
         n3kyExkoa5rjiWthZCx0aV9ysz0Bo4Nzf0607aEgFHXMnlK5KIbwj8ouozxNhvg0JCN5
         VhDRFtuHF/Q1TETEbjwIIVPDt1kiUhpJNa/R5ESV5e5HiTvRsp4aWufh78V0UMouKasW
         y+jO6Vr+qbHyT6cO9GQJO5rQZQntjwXCHlMcg9olwNoU26F/6aFV0Fb8mRcYbhzcp9fC
         yskw==
X-Forwarded-Encrypted: i=1; AJvYcCX5DXqrMWalL2MB6pn8prpk98bFMqQcxeP/jB4VI9223Jf63OC/tujgjbVeeM8NQPZmC5VXI4a760bDse9ojulk3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEmET4/dcCaszPG3jiP/oAP5T7hnavcbk0cabey8O07gGj9Md
	3WgwmDsBOpZaHo6If1ofc9/uIrO3yOMY9LiX1zJSrEip+UwFfaUWInmKi2KFmQ2H1Nk=
X-Gm-Gg: ASbGncunDoFmxJGJwbgLJ5D9rC1p3MfQ+NH8/gvjUxzKS2ZXLnCtUKF5s/KtqeERkHb
	lJB+DF274WT9Bdhbev6z6NiiOAkXErYkf8ddkHBkjMSQ8ZRxSE4xzZcRbwC8agU1QfOo9lEkDta
	YqDhSqSZzP9e/Yt7I0qCzfJoOBRiabzaX2xHLeRy95GBUXC+Q1gQCy0hZqTsTzQjNcFaexfTOh+
	uCcBXtHpGvGNwXNPs195yxGby88r1yF7MPF6ZknADw6VOihKnxYDn0fLKbbgU/hdD+owt7arc25
	JjEGdChzClQgnn9nKU6mvme6niAxFmYcBFbsHfwuYtIUB/DolAxz/HjBAqYA8nJ/9FFVVUtZ/dx
	ZEXWdAYrx8Uly92TUGW9wWzNIeTtIktx8+PiE+6hcqFmcaX18eCNO3tgcIEt6BV6WS3ZJo4Qdro
	tB0zkhVtoOCsOZkTe+s41DRD70jigsccaMHyQZeacxcrL57IR/sZGz
X-Google-Smtp-Source: AGHT+IFsoZFB0tp8+Ix3Ahj2qQkKTO41JFdcnIV2Y9pnCVaB8qxrPU8f/giCj+VPzq5b0sapD/+AIg==
X-Received: by 2002:a05:600c:8215:b0:471:a3b:56d with SMTP id 5b1f17b1804b1-475d2edace1mr37349155e9.34.1761328675489;
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cad4c81dsm104062465e9.0.2025.10.24.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:55 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 24 Oct 2025 17:57:34 +0000
Subject: [PATCH v3 1/2] dt-bindings: rng: add google,gs101-trng compatible
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-gs101-trng-v3-1-5d3403738f39@linaro.org>
References: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
In-Reply-To: <20251024-gs101-trng-v3-0-5d3403738f39@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761328674; l=1416;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=VSqkKAfAsASQV1wNAEnHQHuaUPvFzGicTvWIh5Er0fs=;
 b=TUEcoNwwAwQ353epU4/TqYF+EqZtHiYEB5oZJTslCHQ7ANEPvO/wg0+dwkmN8uBeXDUXaXNFX
 K5fWbcR9GfPAkSc1/TSFsux2yQMkPQd5vyNUQWzGoc0j25Oqei9aMM2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add support for the TRNG found on GS101. It works well with the current
exynos850 TRNG support.

The TRNG controller can be part of a power domain, allow the relevant
property 'power-domains'.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
index 1a71935d8a1906591439c03b7678538e656324b6..699831927932949a433fa5dca767ad366fb76f2c 100644
--- a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
@@ -12,9 +12,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - samsung,exynos5250-trng
-      - samsung,exynos850-trng
+    oneOf:
+      - enum:
+          - samsung,exynos5250-trng
+          - samsung,exynos850-trng
+      - items:
+          - const: google,gs101-trng
+          - const: samsung,exynos850-trng
 
   clocks:
     minItems: 1
@@ -24,6 +28,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 

-- 
2.51.1.851.g4ebd6896fd-goog

