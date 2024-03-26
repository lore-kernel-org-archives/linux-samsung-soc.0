Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE941740
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 09:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711443612; cv=none; b=GuFYw2QxtRUqy4boxXEBQmxNWPebg4VAYWMUc18WLzP9aFN4yaBa0NggbTHoeB/8kn0kOFGryu9lTzBAhAVY1OpSvbA0L090YCpQc8BDi5/2WWhNA3oDWu1xD0HcfFP6ZTmQ0gcX5WCFY4FoWpdI0uv95fnANv/56CH2KjJ+Huc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711443612; c=relaxed/simple;
	bh=aeF2NGTij5If1PKU12QjxNSfCgLheAL5j7HQ6bmibUI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rfdoiI5seJo7cIAzcR+PEk1lGK03SLugVJ6nc0fiOFFDevxdJ6kgtlRYtIrsiSjZqgew2cyVqK1cc3jZEMUjKxxdCRCjEEGq119GGrTaI7Uv9pblwjl6ZDmWmTcTXT7MPVKpVTga2uxu10yiU3GuRW841CAFEG2Dsge+g7DofYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhbUcvXP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhbUcvXP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c2b4850d2so388910a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711443608; x=1712048408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4Nl3F9buqLWWf/KucUiB+H6du4zgHC1jQU4GH+Nt64=;
        b=VhbUcvXP0S1DEmFQ3hIPaQicYrk5YT7mVSDeN/EqmiOK7pfrNhzk6o2rjLNrErTPNs
         TqR47sRnL8g/6Ftnuk+EPAGqaafus2/dT0CD+6qlw0dlHBQLuFeAfi/qRzbq2+p8zJ3d
         xrrwNo9ZzDlDNA6M9SotqRtYg8ei8m6ms6C9qTvoBUtD1i1E4jcqK0MGkUidLjc4sbGo
         jJP0sGtUOWTjxfc0QZKW7ZzmhZf/SPZSxzkgSJs7FOD0jIba3nlw6yiXZLgoeG6GqnHN
         HTphWr1FZTR4QxnEWZYv9CiasG2dkQfB0mbnIsGcvlWhuHj8QBjZifGbMCpXoXwEzQPK
         C53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711443608; x=1712048408;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4Nl3F9buqLWWf/KucUiB+H6du4zgHC1jQU4GH+Nt64=;
        b=C/uWMWrR158e8BK4WxQTHvPC3yOuOrHxITtlbHkXgQaz/ViiJldK7/uAgAzO08jl7F
         V9xM96b4qkcJ2WWlTrTu0dvMlUWu/+CCd/BXAhy2dd3CNUAd1XiDjk9QTO3TIcR92Izo
         71bd40Ok7BcARWx392eXGrPf93qFCCC6IBfdv60uixnHyQS/4CcbeodW6ept+uzZiVvZ
         LxgN7LHWNP47hJWOqsnlGVXez0kr40UXGOyChdCZcQOOrhtIvyldn42T1hCmPD5FFRkN
         Zp8/TnR+sZq3VtJiNCbsat3vlxvpoegKlwmMesaNDCrfHnVaR/zopeRC0Zw4nISY35x/
         JB+g==
X-Forwarded-Encrypted: i=1; AJvYcCWY6Yr580hN1yRHf1HQPBcJ/NPkGlTCQE6rFZ+S7pEmlbcHheUZs8VNUoiO+Pa37H52VIPBX4vhNnlBRCB8u/SgxtZHnUNFEI2fBbLJLZmNHDo=
X-Gm-Message-State: AOJu0YyvnnKxiryKJkLlUSRFSuXyHj1O3hvz4sCWEZNZAvubuObJNNt3
	qHu2rewCxNVTdO/i3ruluJXT/F+sl7gxS9FsLcjEMQzkvs9q/WAWZQzpNSgg25c=
X-Google-Smtp-Source: AGHT+IGHbr/J30tOPNsBgLbO6NK9FwXqFdmdVip9nvl59imBHyDVqix+jCYmkJwMT7KQ8cMPh+dvZA==
X-Received: by 2002:a17:907:7246:b0:a4d:f7ec:65bd with SMTP id ds6-20020a170907724600b00a4df7ec65bdmr437983ejc.41.1711443607808;
        Tue, 26 Mar 2024 02:00:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906845900b00a4673706b4dsm4010129ejy.78.2024.03.26.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 02:00:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240301015118.30072-1-semen.protsenko@linaro.org>
References: <20240301015118.30072-1-semen.protsenko@linaro.org>
Subject: Re: [PATCH v4 1/3] clk: samsung: Implement manual PLL control for
 ARM64 SoCs
Message-Id: <171144360581.95110.13664376466376764034.b4-ty@linaro.org>
Date: Tue, 26 Mar 2024 10:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 29 Feb 2024 19:51:16 -0600, Sam Protsenko wrote:
> Some ARM64 Exynos chips are capable to control PLL clocks automatically.
> For those chips, whether the PLL is controlled automatically or manually
> is chosen in PLL_CON1 register with next bits:
> 
>     [28]  ENABLE_AUTOMATIC_CLKGATING
>     [1]   MANUAL_PLL_CTRL
>     [0]   AUTO_PLL_CTRL
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: Implement manual PLL control for ARM64 SoCs
      https://git.kernel.org/krzk/linux/c/7fa37084061fef80dab81bc062c6ec0fa8c26b2d
[2/3] clk: samsung: exynos850: Add CMU_CPUCL0 and CMU_CPUCL1
      https://git.kernel.org/krzk/linux/c/dedf87341ad66fa6889fedcf610b6941d2d3bcb6
[3/3] arm64: dts: exynos: Add CPU clocks for Exynos850
      https://git.kernel.org/krzk/linux/c/704094c5981287c85dfdb0bf53abdfcdcc1f8597

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

