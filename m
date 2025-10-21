Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B67351FDA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 19:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074836; cv=none; b=IsPn4GQekkZkv59MX8cqAHCotr4X2m0fihsJyZiIfINQ95QQUMVfHT5ECP2j1NdS+EVip2Scw8Q5Oz+qDvStkvPDS0h0KRHIOdVPdcbZoh0hycieFFNO99SbHi1HzNFBiw29u+WFLzdL1z+mADXLgkvU2QAtuRASOjaDAOs3sdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074836; c=relaxed/simple;
	bh=sCX36mBUUD7UPbPD7/zGy00Jms3sN0alcNuZJLzWb5o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=frI25VbZaHQGdfsBiFh3TczEigcwsFEs/v3VfKSLn8nVsLmoe9JAI0nO2NHd0Hv1I4bxkjCyhaXkBXFQTTCJGsbvyxMkMpxJ3lU/NErDFwh5HhKsN1MjciDi/ZSltmqBpSdOQb5W19ubym+dKimHI0QrYV+PHfAUA14UXfqv1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIdZdCSZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIdZdCSZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471810a77c1so5164075e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074832; x=1761679632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=;
        b=hIdZdCSZodnhQJVNtzb8i5NWpR1bSKkvGlmAngh/xj09Pa8YvTs5FYf69of06kTgg1
         Ul1tb6keo2pwz/SMat5cztvuH3bn4q3jss1qg04pgXAkBwHsFmAATyCoIeo/LT0Pflic
         hHi1RIt1fvhzVTSNcW/EZRjOvO63yFNMd2q1aVV0ZjKMxTGTtDJpFJZ17jNZQdKBdWbY
         GdSzvj/vavI9j8jcMu7G5EdMHtaa51hEOyPNZ+gvMV0W9XorX0RZRWBhmN5/lNnppL/U
         S1NVvG0h4mvp4WE2GNdT2f5aDsCGgJSBF7Bgl3CvrtUsu1V3m/Q761fFv0RXOwvVnj0W
         av2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074832; x=1761679632;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2AwA2f/f6W+wFYqRdKOL2857kAZtGdLXYTnjc91Eh8=;
        b=t7pBi/8FvGMAKZdhpoyls6tTNfuCCE1AHIYeu1NRMvs891/uEjY7WLXndWtOrSmVdJ
         g2Sg54BGSQiidWB1dbiAkhHj4PnFJXxh1HhDjZOr3rq78o5unYqnU+tgFujkIyHl7mz4
         KwIOID8dnwTFwMeNBr2QDRFb8yNnMgP2daYubpcfh1Ug0u4ELY60HGpFt3uBOiBdTAJM
         5e4l5hwHy9q5lZVGl0LAUisPY3Ha8/ge0KJUwzOxIYiHUo67awRS4UH+UfS/4ixr6i5u
         BYbY113vtGr96Kf7s0DV6ZnbaT4dZEDPhpsg/EMUAmciQm0cQ4j27B4IAX/jY+iqfpht
         XLog==
X-Forwarded-Encrypted: i=1; AJvYcCWMHslmu3kR56KCOpAJeZquOMOFOpTppfdaIvyhmzrtxqzEkdns72IiRjTB9opSg0kbBwoZAGqPMOVqLJfNsRvCWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yQ/We1fL/8IfBSttXBxs/EzYQ9TBvWnyv1D9D9OwHsiLwNaQ
	RDvdeqXoEtXdETe/V0yei6LlTKfcKHpDido20wflGSpEEmC00FoGWfPQNCunduEtBjE=
X-Gm-Gg: ASbGncsL/Bp/IYD5jhjYR98YI2N+843YcaRc56oWvSQHbl+sZICiErXzQte7CDWXDrG
	h+OTe1lW9nTY9l2xvtKEtcz4juisiDcdwGf436fjws6JB9lENo9SaLEl3+geh2GdP9VwiNb8t22
	Lp1VdqI0Ny3CXlgbafdVmGfMUDnhO1MV6AFKDcxChYd7uMjPWYtg6nWtOaNb7pfVIIeTpUhKBUC
	xeJy6upLSL8uuHQo364KZd7yi5yV+UG/izS46gWXfhb/RNtgUVseRNyl61OxV6IEB5+OCG7PVPt
	D3pC4gSTrdXCSHU4K75BufuVXaQkgYjzAYdP9Jr7dOfKwMKWBjUq30D+DkM0u08Du1AitUBa12J
	PLEqfQxSv3lInqcCq5gvLPRHQfVhuxCqOYWHeNn8aFP3/6OdMVjdV7b4OgBmRc39Ly1rcgRSF1L
	Dk4lz3INCASjjWLBxA
X-Google-Smtp-Source: AGHT+IEAsN4GLGZOi/gLAJB0fdHh2RkmlNERThaNChpJGeL/SOfJubwUVSTNSVXsVki9aW7gKT0ayw==
X-Received: by 2002:a05:600c:3b04:b0:471:12be:744 with SMTP id 5b1f17b1804b1-47117932dd5mr72625585e9.8.1761074831798;
        Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-5-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 5/9] arm64: dts: exynos: gs101: fix sysreg_apm
 reg property
Message-Id: <176107483030.33931.17680247324177119299.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Oct 2025 21:51:34 +0100, Peter Griffin wrote:
> Both the start address and size are incorrect for the apm_sysreg DT
> node. Update to match the TRM (rather than how it was defined downstream).
> 
> 

Applied, thanks!

[5/9] arm64: dts: exynos: gs101: fix sysreg_apm reg property
      https://git.kernel.org/krzk/linux/c/4348c22a4f15dbef1314f1a353d7f053b24e9ace

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

