Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D1E1AE877
	for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637750; cv=none; b=ow+R9EVmdCtDpFGtFAWLDCyWKLZdFIcNWjGkxDOo+VY2tPH3bd7h+wY5IvD6H3zmsTruxJhX9zNcq27mdlBBFuScG3na26tQHhOBXO7R6tjo3Y0+gt3DO+OakQA7fnWUAukPfJAk092/geKciNbjyhJbya2Xn85UBigZbGYiBiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637750; c=relaxed/simple;
	bh=xi1fLpfGfUX4eRrB19iaWWJsrywWFFqGcHHL0PuDem4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BNCplU4xef2IC6tzhdg1Iuo3rgv1whTYq+uv3CNOOLoLTCIZLMNeub0yP8xyRc9VtsDerKMArZIxnUeogyCLRDEAfr9TxE9dizg2DWMQxDzGrpigxismAD8nj3EbmnX704grHuN0SOTUmOAEdDiWWROxALfWzhZdVV10Y2WGzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7ZEfBg8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7ZEfBg8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0413cda0dbso12697166b.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 03:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756637747; x=1757242547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=;
        b=d7ZEfBg8w+/45HKi1OdAwAejyFJwpmygh5Y7puMvIEh43PxrcgBIKbtrbWQ/SKKdzB
         1GvqM4nEBa5w0JE+WgOuQraSM7mp5pNdvf6rRioYh0VttSvrTtRHNVN72sHy+W4yrXqj
         dO4Z6kHDMTrb9VzGRRlK9JDpy9Tr4WQcNWOa7llccqBLeJvMQ3yyJl7JYjCII36d4yid
         0C3/V0lI5i7+cJJwjpsOjQVsMZhi+9d1EnCwaVLjsATtkfWgCgValWscRcpUtywgqbaL
         kZFCwPc6P0i3XL3JGo5Lf5LTdecRWjCUEy3IjcSFytRmU/9xfz/bYEL0WJY70wKoJLin
         /LjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756637747; x=1757242547;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9Ikcisp0DawIJEHv4fsbvQNKoZVQCvvL3i/2eqE6R0=;
        b=LRd/0JX/UJ9o+DaUmA1OLAEUoexTeWb5pevPjufRB9ZDNkG6EoJo7jmzFkCIyz1Kje
         CAweJtdDtq86eyZ92aAV/R24Qansy67R8vmHvJqaLmT0NrHi1jZAsBnwyri+7JSbus6L
         Urs1ZLu8VczP8VrP6r2xlvdtTR0dzkoFGI3DnqUui/s9YNVkWMXgQo7NRAYNPCbGFV6+
         spX8jG79qj21esfJt2KlNjYvK30wUs9+tQRJg5ZNI0mG0mf4iD5sVHK9lzYbqN2gFqbj
         NUM+fgB9HBg08pRw6VzZv48u/pQsURxLsW1NpCARlFJY2uWmiXtmP+G/rJQleRPsHw/v
         X91g==
X-Gm-Message-State: AOJu0YyQr3X0doO+3hEHqVoz0D0QvNRD4a0xmSiFX8RfKllP+MbGbuAe
	rAlzodLQmkBWaojnu4gxpdjU1NAQQQSgF9a0HDedO/rv9RLh2q7rG7hl/hHD+qtpjA8=
X-Gm-Gg: ASbGncs8lks7kCS32tuCCXct9bsOvctkgVWD6RGCIkudhJt1/3KV5fovKKNmpvy8yC+
	AM4aIRpLDuH4V4RuuENo00bgFTC2Delf9W/vhh83/N0Ay+HjnTllOYG4qfbzBSOiFiTCEQynCzA
	xjQ6+Bs3xwZQ+G/jkM8PcVwFBhK+TcuW5E5EonfCDB1AEy88doktkwwih4jgENAcJlWwK/wdiUc
	jpGmufonYceAr9W5um6mfO+026A1w4aY8m6/suKDm9taOMcbKV9JUKs0qOiPDms2E0H4pKZk00O
	WXlg5S3CmrYra9cPoYuoBw/0sGSUSz/cVvoanVoKLCyjv5YISr7EYL2Ospm8VWYOwkEQmiIywlN
	RV+vbnfmNw2TDjY8Zj/xl1+K9Gtu1J4sX94S5xHDFXm/2/NaRuA==
X-Google-Smtp-Source: AGHT+IGQnHEGxYKHduO0rCDVlsbQla5BpUnmcBYqLI8jWWy/4+T75FA5udztvTzcc7SvlOo9rfc4BA==
X-Received: by 2002:a17:907:e8d:b0:afe:d218:3d21 with SMTP id a640c23a62f3a-aff040b2788mr405254066b.4.1756637747009;
        Sun, 31 Aug 2025 03:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm468318066b.88.2025.08.31.03.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:55:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
References: <20250830-fix-cmu-top-v5-0-7c62f608309e@gmail.com>
Subject: Re: [PATCH v5 0/5] clk: samsung: exynos990: CMU_TOP fixes (mux
 regs, widths, factors)
Message-Id: <175663774498.35421.6694005756444857104.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 12:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 30 Aug 2025 16:28:37 +0000, Denzeel Oliva wrote:
> Two small fixes for Exynos990 CMU_TOP:
> 
> Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
> CMUREF mux/div, and update clock IDs.
> Fix mux/div bit widths and replace a few bogus divs with fixed-factor
> clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.
> 
> [...]

Applied, thanks!

[1/5] clk: samsung: exynos990: Use PLL_CON0 for PLL parent muxes
      https://git.kernel.org/krzk/linux/c/19b50ab02eddbbd87ec2f0ad4a5bc93ac1c9b82d
[2/5] clk: samsung: exynos990: Fix CMU_TOP mux/div bit widths
      https://git.kernel.org/krzk/linux/c/ce2eb09b430ddf9d7c9d685bdd81de011bccd4ad
[3/5] clk: samsung: exynos990: Replace bogus divs with fixed-factor clocks
      https://git.kernel.org/krzk/linux/c/a66dabcd2cb8389fd73cab8896fd727fa2ea8d8b
[4/5] dt-bindings: clock: exynos990: Extend clocks IDs
      https://git.kernel.org/krzk/linux/c/76f1e2ee545b3165e1e24293b59414699118266a
[5/5] clk: samsung: exynos990: Add DPU_BUS and CMUREF mux/div and update CLKS_NR_TOP
      https://git.kernel.org/krzk/linux/c/8c82bb53669b1e82435b5a00a170b7c079940b82

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

