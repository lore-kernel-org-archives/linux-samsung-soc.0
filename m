Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059AE4655F
	for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2024 12:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723379598; cv=none; b=Q3P7W4xX0OQy3znx4GjvPM1MdJ/mZXX6t4DBz/CRSdxP8RDhD6gA//VdjDa+nu4uWrY4LEIoHZIrZGrxNw8bSPANybHrgjgxt8pC17zgAgGrV37fOfiborT7XFtvSD4zM9qZ3ciK5Cvk3PohOrbUzF3Ooc79muyrWKzFXEWDMfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723379598; c=relaxed/simple;
	bh=KvQ1j2JJhKF96Zmkv08TrmO02CogVrsd0R9+cWW63rI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tawfD4UUiTm9/XQaraQ7BA0ls52zUiQ0xNTjZJatrTT7qXDAMIvkKjpueBfSUSV1hdOP1SGXScgk4vShAyFCPcMVrgXsjxb7e68B08ttB04WnS7ZwP44cIP8GxZ0OyeT5bd/WDlWifo4aHEXTQVJlOH/9Dj7BHkuS0txiXSRDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gfNE+N/p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gfNE+N/p"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so19802725e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Aug 2024 05:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723379595; x=1723984395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNtzmsLAUjHUFGt4yFs0GHGAPibkEjTPl3+crio9j5w=;
        b=gfNE+N/pSKcZKawhhdtkcyydDQAKI+Is3tDnSSCGso6ONqYs6AIfSxNoDOC2XOERGL
         AGefp5odg+T2VYu8xpRjg8n61HaZd1LSsRTZEJGEK2yCxVhqCJP7zkz/njZF9eygN8Rm
         YSYkxcI9AboGXLKQJo+IPEJElrXB46PcE8DmgXDPFa/BLomtmqAEahbwur5ZmVDOQH29
         Pn/n1GYmjmCsxLnLKrImDjAOov6wHS+yGYjNAErHG0tBqTU/xvHH+eg8Jq1aj+FmD5GS
         mjUQJkxrO80vf75Sjy4lpVIPfVl7xvZ7ckwFFdPx+ImiCtx4hPjE8DYN5qRCaQvhGAiG
         MYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723379595; x=1723984395;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNtzmsLAUjHUFGt4yFs0GHGAPibkEjTPl3+crio9j5w=;
        b=f6cMOT+flekzy9Z4upuftC7Q39EZjZKOnAuYcvO3rR4Ha1VLVwj1DZUPP5apJCSLOg
         c8l+26fGPkmIj+CTpehGe7BnFpfknR7nTM69s4Pnwgpj2X+G9LQebgH2zTT6O7CR9zaL
         98cNhN0A/0WoRn38siBBtdFvAlejFYoDQ4E6D6LHSSfFjfV7zu2RPCzTxwQMb1H8vMdj
         LD3GyMTMMzcZcdMCuxFtUNO/0Q4rZkV9Ja15J7KX0LxVkUWrj1KhSImnT8tqom33GQhu
         QxrTvFw2CLbkDjskq3bqv0i/567FoupgoZUBsfrx3mlvM/Fg0KG8gJ9TKeQ02C7MzpTg
         1Mlw==
X-Gm-Message-State: AOJu0YwpdDo9DbtECBJ7zpVEMNtjJTvML38bB89HdJhvnsYrGDC7+7Yx
	WfCb8lwUA/5Ev0Bw7mU23fFwLnQktx72tvtB/CbG9wyphwQtZBh6B0a3k67qYaw=
X-Google-Smtp-Source: AGHT+IHeSH545tLAiSGZ+Kn/6/EO8IxUAAyxi+TpJ3ZYcwH3qDLKt0hu9wEbSGGrBxFm7gQLt+Hfpw==
X-Received: by 2002:a05:600c:5122:b0:426:5cc7:82f with SMTP id 5b1f17b1804b1-429c3b0179cmr57662965e9.13.1723379594927;
        Sun, 11 Aug 2024 05:33:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c79f345sm148055605e9.39.2024.08.11.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 05:33:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanho Park <chanho61.park@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kwanghoon Son <k.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240809-clk_dpum-v3-3-359decc30fe2@samsung.com>
References: <20240809-clk_dpum-v3-0-359decc30fe2@samsung.com>
 <CGME20240809115500epcas1p458405a51caf1af8e9d4e2f7130b82725@epcas1p4.samsung.com>
 <20240809-clk_dpum-v3-3-359decc30fe2@samsung.com>
Subject: Re: (subset) [PATCH v3 3/3] clk: samsung: exynosautov9: add dpum
 clock support
Message-Id: <172337959331.7186.15471838691665159109.b4-ty@linaro.org>
Date: Sun, 11 Aug 2024 14:33:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 09 Aug 2024 20:54:14 +0900, Kwanghoon Son wrote:
> Add dpum clock for exynosautov9.
> 
> 

Applied, thanks!

[3/3] clk: samsung: exynosautov9: add dpum clock support
      https://git.kernel.org/krzk/linux/c/ae07389413d41995a027aa5fb99938cd9201fb40

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

