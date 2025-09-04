Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096733D987
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756993696; cv=none; b=YQDDe2NkvLj1dZe1Qpl1Ga48UACf3+8PaQMGC0ajooxQ0UCHRxmNRuIBOPDnhh9BKtCjC9AXqm3HV7yvGYb/F+8bnuNOJVZaF/0pAGLqaQFhcQi9i2EIy44BYUMiskBC5nuosWQGiXaozMu0j+4shV5snUILIKa31M1NEEjG/0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756993696; c=relaxed/simple;
	bh=5b17D17KCNLnqi/G2Z2dTgyoEWSeb8SG6sPYeTo5izY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DRhxf3/LExXPgBZgfE69oXshRk2qmi1iw47b8j3a7O3cjIwsH/k3TiidwyNjNtFlqK8Qe3Jbb3SWXPfTiIZIlh2HdELCSY4ybeSReHvEOOMWmC8pnaIobiHs6PqL3y5pej68li4T2p0bU5jCLG6UZ8cnhrJt0h9OUsInwACwXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ll3IK9Mz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ll3IK9Mz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61ec2b5cb49so178920a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Sep 2025 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993689; x=1757598489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=;
        b=ll3IK9MzbAsGWBYZYSLZwhueudyH7E5mbvXA6FF7OJ+F5GdVVJ5/9kzlfA7Rs00Zdk
         wWLm4/l8mU3uD17NgaH9Dw9w8gvCt96No8IhNVO5h1BkSzxDdcvRKCVwAZCyUTRTFm9E
         xya6RRwKJVKmRupE+mBQoap7vojfayhu+UxgPYGMb8FY+b/YQNU8UpD4ilz/yqaFI8+t
         WpHkmXptPNt6EfA3sH5G8inCFiDVj2Hz9WEqfEwQEBt7CBpbLue/4Qn6wigdH+A93mJr
         dNGeduqbBTL23LYBgzbYpSnWmDnyfjZD9qbw4LWfpNUP4bTYAdRgYeBjz3ourSxYXFOJ
         3XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993689; x=1757598489;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B5PfVj7z1U9Fq+QcRMWYVttXEzyn9uOL+vv6a+ytkds=;
        b=pShYoXByREU0/6K+RKeHpHYD3P+VB4rBXS14HthB1Eh6TCnwjvjRln+VL/T6Cjl+g+
         VeXGzi4sFv8jCEnRjyc27v6VzuwvbKi31jTS1LaVKgXgV5kh4uUuk2E1HA5yYG9GgKvk
         roas45UIQn/KBiAsj7bo8ugYydPNjUcLTYEsxpuywinF7Clj5I22WDA6aFbI6oSGmv0c
         UU4HYrqksp0qbcaFsH2NG7XEtZJmLEii5n+HzIrVhwyRXnMPHmN+niMcGdCDzZkCW37w
         M1uT4qErznkUq23p73T3/+pffePHHlx0b29mLg/4WfmwocNIJOscW/pD0SHlei3h4jFg
         6kqA==
X-Gm-Message-State: AOJu0YwZfVmVFJScbXq6aLyvVSdWthu3ER+Lzl/SFUObgSD5DJqiIFEt
	DcPuOESb/ux6NeJpobEvrcc1gzkzzIPT6iXBte83LqC80hNPdRJdvkl0fLewQzBqgPg=
X-Gm-Gg: ASbGncufWtkNxsGgPlhmIEvwNkUoUSzcySIph6V7rzf9ru3T/4wsBImy2+T5Yv/fe+R
	NtjpJ4SKd6O3YNygajq0IIjw71PcK+hT4Vs5iHXXYnGa104yJKCJMs+x2ywkwa5SpMz31Ca852C
	UgcxY/5lfelU30Lm05JuNDntPeiBn4GtE04Sja1vY2QMiUIHLiaydEbO05SE/oLCF+MkgOYQewF
	Nfkyn3zfFMA5pHD+iwjKQnF+9ZF66TbZblu9sJ5MtxLLHvRjK7YyNFS3TVGQjP7JPPnKFoPXCaf
	U55UaTg+syYrHjCyJ3UbaGL3JjVt4sqB4ZT4gFAO8c3Xkn2MnysfkbKp/jPiU2io0+k3aAvMgLD
	WaUgDQy0+RLA+R26H2t+PGkC8DgCW3u9DwdYsSCQ=
X-Google-Smtp-Source: AGHT+IFXmHyLiRikp8i7AT0rm9igyDk82338TdO+dG49oonCsmp2DJJwv/hKJNb9HHXBa/ePNM0EKw==
X-Received: by 2002:a05:6402:354c:b0:61c:d7e5:47a3 with SMTP id 4fb4d7f45d1cf-61d0d365421mr10482985a12.3.1756993689530;
        Thu, 04 Sep 2025 06:48:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61edb0fdf1dsm4243221a12.18.2025.09.04.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:48:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250831-usb-v2-0-00b9c0559733@gmail.com>
References: <20250831-usb-v2-0-00b9c0559733@gmail.com>
Subject: Re: [PATCH v2 0/3] clk: samsung: exynos990: Fix USB clock support
Message-Id: <175699368813.172086.8536010951360222334.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 31 Aug 2025 12:13:13 +0000, Denzeel Oliva wrote:
> Small fixes for Exynos990 HSI0 USB clocks:
> 
> Add missing LHS_ACEL clock ID and implementation, plus two missing
> USB clock registers. Without these, USB connections fail with errors
> like device descriptor read timeouts and address response issues.
> 
> These changes ensure proper USB operation by adding critical missing
> clock definitions.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynos990: Add LHS_ACEL clock ID for HSI0 block
      https://git.kernel.org/krzk/linux/c/eb9bc162775cabfc4cf2b37cb0d3c2c2bf4c4b54
[2/3] clk: samsung: exynos990: Add LHS_ACEL gate clock for HSI0 and update CLK_NR_TOP
      https://git.kernel.org/krzk/linux/c/d0563d320b6014a8d56170253fe0aec524658b9f
[3/3] clk: samsung: exynos990: Add missing USB clock registers to HSI0
      https://git.kernel.org/krzk/linux/c/f00a5dc81744250e7a3f843adfe12d7883282c56

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

