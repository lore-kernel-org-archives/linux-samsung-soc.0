Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D9712F5B1;
	Thu, 18 Jul 2024 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721305240; cv=none; b=hH/jDhb9OQ0DCIsY2ssV9eCqZGQYs5AIjtlgoP40Q2zHPbnU63QsrF1oPPkQ7iI0vISdDDBj8MkXNDFnSMc+rUU1wdTG/5PPh3bBGTO3fuJzfSjV7vh8c9pxGDUsFql/j51LNkHjAqBjbyHUuHD/jnX01Zt8ILHKr0k9gfrdKEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721305240; c=relaxed/simple;
	bh=sA/u2TCP1a38oyZeDanTbx75hkI487QXcwqqcjx/DEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQNSb3MPtMlTOygZ3n2Ou+ZdpEhhfjkIpZ+Vvccj3PQBB1bks2CipcxDwhknYh744BTU2UK5WFAVp0OtbopAQfAdd4wtZn1hq9iUbY9jvTgBMSMeUbaVPRR5ZL7eyU1YLm/dKDwRKtTkcUDpXmpA01ZafC1mHLyEXAMEwVoNd6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/WyJPXU; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/WyJPXU"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso459121e87.0;
        Thu, 18 Jul 2024 05:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721305237; x=1721910037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ4ilPxILbxO4PM3J9BDsB30u0mDG+2Cg3jDE/Q8pO8=;
        b=S/WyJPXUkHp65VvhGlsxMkdzd4ujRl86qOnReWy4KfEB/m14fUEF+XZthbMQG54uoV
         JXdUuLmT5MJiVb/a9NGCIwOphWthjTK+zmq+7LucTg7zHpWntB1BN8E+puDi1YmJ7W44
         aooPZIh8z3RfjcDUTnginc9XF9Isxwx3ur0q4hxFHA6N9sB1xeaHSyMoEZphEwBm4k+Y
         MKk1NWe1XFHsPFKRFGxCHxx5tV45gBLLpzUZQrUmo8w/IWC8JE93wFBH3wufYu0OON0W
         17KgGW+AX7/ohzYohva6G0Y7VXVbnrBsVcUxsjQRt2I/gVyGhMShw4hY76wuUfIcpjKt
         DWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721305237; x=1721910037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQ4ilPxILbxO4PM3J9BDsB30u0mDG+2Cg3jDE/Q8pO8=;
        b=AvAiAtzDNyN1vFa2RnS2wPMzPjytV8a4g8nV3JMUleePGMrIfAjc0unnsuy+vwcIbE
         vjOcawcaCL124EgiByIrlwiBrC7R3HLMVWns8o5kjDep9ZsU7cK6VU+DaVEgVG2sTSlG
         d+Ani2h+A6liC+2pMSXheEgWXEdliXbh3iYtdknBLHPU0G1IkJx4gfus6UsjQPJXWXFS
         07/dPgIL3WmZT2aWTSwqPiqSoxkCN+8cfoxr6AShZ36hVnQorvG4h1VdtQ9OmkqLQXyK
         2IQxdfqka7Ccigh6fetoBeyZC8BKTVnDUtCT4P28Ov6dob7ieJbupdiHv9AOJcmdvI9+
         2adg==
X-Forwarded-Encrypted: i=1; AJvYcCWsYYzVN0w02l9tjnj4X14tPu8H7yHk/NyPweiqAoIKgwGq9QRMPWlJpLl7NmwKwXwRglz3stgIFX8/H6Wi004rcu5ZRV25g977mdBZjZ636O4hsH1KDsg1JrqCp4gGEJ/AYLyAwOo3onclG1I=
X-Gm-Message-State: AOJu0YxNtD+6bV28gi/9r9btKobbrNBh4rCSywBMlqgyLHbjx6Tmcy8A
	scGR0anwkCUM6hoy06lvt7cftHbqwqPlUo1HAmX2BrEftWegaXST
X-Google-Smtp-Source: AGHT+IFvO+2iXZ0rthylYYdE66EoKuHxczjlLuKXSgdk4C92u8yD8b3xsnQ38n/zNPS2AbqaORybEg==
X-Received: by 2002:a05:6512:230a:b0:52e:747f:46d9 with SMTP id 2adb3069b0e04-52ee53afba1mr3320505e87.17.1721305236600;
        Thu, 18 Jul 2024 05:20:36 -0700 (PDT)
Received: from [192.168.79.55] ([188.146.251.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24f56ccasm8277722a12.22.2024.07.18.05.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 05:20:36 -0700 (PDT)
Message-ID: <6227c1fb-d769-462a-b79b-abcc15d3db8e@gmail.com>
Date: Thu, 18 Jul 2024 14:20:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: samsung: Don't register clkdev lookup for the
 fixed rate clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
References: <CGME20240510065909eucas1p20067042a45b26e0a58110ff439dcc1b8@eucas1p2.samsung.com>
 <20240510065901.535124-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20240510065901.535124-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.05.2024 08:59, Marek Szyprowski wrote:
> Commit 4d11c62ca8d7 ("clkdev: report over-sized strings when creating
> clkdev entries") revealed that clock lookup is registered for all fixed
> clocks. The mentioned commit added a check if the registered name is not
> too long. This fails for some clocks registered for Exynos542x SoCs family.
> This lookup is a left-over from early common clock framework days, not
> really needed nowadays, so remove it to avoid further issues.

This commit causes a warning to appear during startup on Exynos 4x12:

 > [    0.000000] exynos4_clk_register_finpll: failed to lookup parent clock xusbxti, assuming fin_pll clock frequency is 24MHz
 > [    0.000000] Exynos4x12 clocks: sclk_apll = 400000000, sclk_mpll = 800000000
 >                	sclk_epll = 96000000, sclk_vpll = 108000000, arm_clk = 800000000

The warning seems to come from exynos4_clk_register_finpll in
drivers/clk/samsung/clk-exynos4.c, where clk_get fails with error code -2.

Best regards
Artur
