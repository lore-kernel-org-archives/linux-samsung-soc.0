Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2609A2264C9;
	Mon, 25 Aug 2025 02:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756090549; cv=none; b=jm1jFV3OZCFqo02u1SsSBABv4+28ZZMGB1RlSGRJYmHnN2dlRyfWdYPkYEWyRZJqUTG8Opl/xCJdXni1Y/5CN4MwjnNINRbCHTJHgyIfhsxg0mwNIafduPd1R9ddO92T1kgDDd67MwAv2qIwNcEYK2wxPQsehT2OS5kImwIouCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756090549; c=relaxed/simple;
	bh=NIyMpKHBZUuqr5ne5L2t7WiYe4nHYXRCk/VKYE7gmyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfavagiFDLMnyw8m4yD4d9mdEnlpn+ltdVuMtksz4wfYSGL3w2rIMH1G7jQsh6pmNAtQ3zA0jyDGBdwO+V9CysykSdltNqLJrxStCn7P71R/JUDsHxRQHkIgx5WGAk7b/wayE/0WjWEaoho+lxdgAy1dnOLtXEfqVjM6UX2mc5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpsZp179; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpsZp179"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b109c4af9eso31091281cf.3;
        Sun, 24 Aug 2025 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756090547; x=1756695347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzpj6K/NK0lfU/oddIPqECK+bzvcazxbWbGc3Ogsvo8=;
        b=WpsZp179PJiOMHo3/ShWvR1HrHQhX2YxpDG+GiU59K0aFRaMtlqzHSITtxlrGEpgLd
         VmBMgufqy+6d6NdNKp2MpoNFXb6h59KCchKWG6UuGGY3zz55nobxG6FlAmB8/SxQQ+Tm
         Jb1lA5UhZKCq7PDXR5cnVP5yUJh9OaupMV076M5yxPyhiJ164vOiEnHX8ffBxZtA+YJI
         FulYJW/U7E7mB42K8jbfGurZxkuZJ5F1XIad1TINjGAaFTmkOEZMiT3IgXGb6KKplflj
         0wrumJ9eL8Oh0ZAkjltCX7j9lFo+Z13ssKWB0Rm7EM4yGrQL497dJ4z6hlMKarVLR1ny
         CsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756090547; x=1756695347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzpj6K/NK0lfU/oddIPqECK+bzvcazxbWbGc3Ogsvo8=;
        b=lm+b8896h20flyuklFotLuZ6aku0Brlj4adWDheCfMnSfuZi0Rv7Qps0swD0BcP0wU
         zajCLL4Fxvwlgla5Xl83lRVlaFfByDqY7GOdJXkIPgZSe4ndp8tzzk5Yh8tseCdcA+kI
         KlmQAxnoJDevmIqguk3fuVGkgFZKZFPj5k25A4370X40cBP0vwMNac11LWs4PHwYixEn
         LNxNGKC/dKHrhYVuYcIqsnnfUUhF/O246UrUIJZ07sVa9xKaQbGFRI8WA/CZA+MLQgCf
         ejmHWTL1stgtZZTLAVWdxjOWBNLkp/qtcGzEJZvBC6y++L09ZLLaH+PEihetkeVnkbIi
         d+eA==
X-Forwarded-Encrypted: i=1; AJvYcCV9375uTloXuz2S1PwEXmLl3Lhz4sm4qrwAq88FyHJEfBcz/dCsw2ejCKeSYr6U3wKlE8AVxxm9e1dTRsk7@vger.kernel.org, AJvYcCVJiqfLov2Ymy6V9UfES8tauJ7OuPoGns8JlFaIO7XWV6mImUOxUtoUxd/8cWm/mDoGegEjnnTAq8BA@vger.kernel.org, AJvYcCWe+y4BrluZ9nxNFB1VNRgHqCK9XMxzAQbFMgk9tqXWWuLoH69v7lfItFnjtZ8BPbF4U85+p7trQrtQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuz8Iaj6tqdy5TfUtGjFN1W/j2c08m3u3n4zLoUniFK4WeSOUv
	iJpyenAxi+dwhOlKrUwEa9ZQ2f44nF+Gb4hWAh6WkIRJhvtRuIXYLu/2mnjmNXmynOM=
X-Gm-Gg: ASbGncvvSxOytLeDxUfnsSplhTjLMGfJ3RUcFLzt2dSaWdAFkfTfyLn4SkxWpEzGvyj
	05Ypeze7Yy3QSQcVwBnvXAoZk/pzgK1dH2dOVxKJfJdA3iN9+gb6W1yq6c0HRxdHYXg2uQXLpoQ
	CLv203AycNUywRT0SlwX/Up4jCjfDiBVP6dQDGZZ6+1FraBzk+sMNZjyntLg/itt2x8T2f5GNO7
	J5ZrNblyPiKExeQNOiBaah6fWUcL3YdUQXDPOeVKDAxn8AQQAnCDQBRQJiBtfn+BTQ2w6iBRG0A
	a73wUqD5p9XHOxmAwkHWLSMgg10SCVc3bosi2F7N+4pAw0eoZaQSU6oAA2/rbI4lZ+mA8m2ABzO
	fCUuRFMH9AoNEt5PON4+gZyCaS7OB2g==
X-Google-Smtp-Source: AGHT+IG5/DhycIBodT+LKCjopALmQuIyavcR0PAsa1w3+0elVBg4MOiYitZhsEpotEOdtxeixBtpJA==
X-Received: by 2002:ac8:5dc9:0:b0:4b0:6ffc:e0d2 with SMTP id d75a77b69052e-4b2aab20aa6mr116269011cf.44.1756090546683;
        Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61adcsm43970491cf.5.2025.08.24.19.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:55:46 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Mon, 25 Aug 2025 02:55:44 +0000
Subject: [PATCH v3 2/4] dt-bindings: clock: exynos990: Extend clocks IDs
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-cmu-top-v3-2-8838641432dc@gmail.com>
References: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
In-Reply-To: <20250825-cmu-top-v3-0-8838641432dc@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756090544; l=806;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=NIyMpKHBZUuqr5ne5L2t7WiYe4nHYXRCk/VKYE7gmyk=;
 b=OeO0Da11Q8lGEHcQ6UoFPu50yHKr9VuWTwjnww1KHCg16TAziCL/MI8cEFZ8z6t4XB5kS6E67
 N1Te+lEvVrfC6uIi9aMAYQVvxmbiSTLQBsYa3MgZZ1zdAZeoS6u9n7M
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=

Add missing clock definitions for DPU and CMUREF.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 include/dt-bindings/clock/samsung,exynos990.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 6b9df09d2..11bdecb19 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -208,6 +208,10 @@
 #define CLK_GOUT_CMU_SSP_BUS		197
 #define CLK_GOUT_CMU_TNR_BUS		198
 #define CLK_GOUT_CMU_VRA_BUS		199
+#define CLK_MOUT_CMU_CMUREF		200
+#define CLK_MOUT_CMU_DPU_BUS		201
+#define CLK_MOUT_CMU_CLK_CMUREF		202
+#define CLK_DOUT_CMU_CMUREF		203
 
 /* CMU_HSI0 */
 #define CLK_MOUT_HSI0_BUS_USER				1

-- 
2.50.1

