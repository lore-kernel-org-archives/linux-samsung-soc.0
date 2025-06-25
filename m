Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155FC26980B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861320; cv=none; b=ncqSoFIc8D8YgZ0wCk1fOAf68DErHSRR9V2ZUZkvyWsIDzMSUZJ8KQmwKWyE9+hCW+rrE9TRfzSUZ12saOXBEfF+g356jS5UUv9ujZ42/MXuZCk8Av6i/iPvQdtAHajOrrz1mMR4WrS8qteresktHONV2Lfwhe6SuK1yM02xlEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861320; c=relaxed/simple;
	bh=DlB7Q252ankMqOJ6UIJLWrlxrGtVqX6epo2WRrBN/7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mEMOgkw3G0aHO7hoHubcauZtBjltItqL0u660Vw3gD+dHJJTcdY3nxrYl6+mSO9XGGKDitc0fwrrAZKj69m1tjq2IOQ2GwBp7zOn1fUi6DL5OmCMFsOTNQB5EQg9+PGYd8GBYqkYT7fxCdmkM1ymERK7/mVMD1ZKB1HO/vM/v7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfwENfvP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfwENfvP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-606b39b19b6so1410956a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861317; x=1751466117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=;
        b=KfwENfvPko+uVUHCtZF1p201lEnG2tYVu7x172POP0/VLNrWoLOgAtqqfpXWX90ta9
         +ATle29k3gaayDZCvOARIJFRZdpL39l2CJ7RepXufOecjNEoBz3gC7oXVU/rz3KXclWZ
         IN6xTE4/8CTysRum/rePQX0RBWGWVa70jFSqepBZ7GKZodbKwEJxSNlmkDTKhYsrU7NF
         HnQwG6BimYRjj6fVvYVyBI/haxoevXKUQL8d+WCDNosbzER99H70cjHhMsv8P8CfQ3Jp
         KaJ39FpFBHMhIBR17FLShkwHVvQ3Q/KKT3HF+9eInVP+OilXA+cBS1kXWqj54aNzKlmZ
         M1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861317; x=1751466117;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3GGOIs1M7qewnK0dbN/1VCKv2nwsADPB2kGIBYK9J4=;
        b=t32eaI7vT+clcZ7ZCcRYjLwVe3JdC2tPD3TIYhaArt1toPjaEqAsE3ux2fRFrNExmP
         7FA9D+hD6hf3FM6Iodu5G9UXfS5b1fWdzUrwlLfiwyK0bkWMdnTLFPjU958BPjCAFFI1
         52WhESaoGX7nTIp+DZb/+aetw3K0oMTB5WhkZrKRDQ+EY625iiYCyvmHDbG+gGkOUzU9
         2tHrj87KU+6ZUuJKGIIX4hexeZGcKhUAY+aCwmLD5CSnkF/UlCpaxKefNMDqki7uucyn
         g0JaUTEgoHrZNZHxCeGiFPabs6kQ2CA7mLb+EE6PM+kw8U7f12+HIULYyxh2DKlyFYEA
         74/g==
X-Forwarded-Encrypted: i=1; AJvYcCXPRubB6eLmC84weHFaBNzHrzFHcLfAJXJQd7nII4YFCLlFvJmnmYralC8G78aGlEvGbIcI9cHLCfi0+wdpy9MzrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Oiu3ZI/aJBEVsXzLEfMMFF7OQjIkEtpYG87vOlu6pEt1XBlr
	NEiaOPPZZzqmlB7cossjkW7eUriw30HJQ9OmR1/7CsC1sEoJEB74L3lUVJKPjHBD8zmstyPfZi0
	48mou
X-Gm-Gg: ASbGncumdB1n4/HyyTNkcB3Ze3EtI9g1lNFWG7jPQn8zznjbzcu4HpsOopEZSUY2U0/
	q8jbmAEck0jD6qPaQOelIG21Sl4mCcdhHL+xl+z1MTjuZubR8H6F+msSGypBHDpdQVCebkShbEV
	Hhh0/gDIXSZYLRBZTrsyhnqGezQXAhVrl8v6Ue4xLaZtwntH1egdoA8rms0SZD9OAqasSR59SLi
	Tuol+Hcb5ETrtUdPboUMaH5yjEV7Zzui7kDsiR55uO681KRoCVtVOwMgDuj3j53MJzGiCfJZJLE
	aF+RBsZAlWGpltVKVHWoCbfpvLc0W8kHYhpCgB9hRaBLgFuCdVb3DkM8MHf99Yk3bNmOVkTZM24
	8zvIXHw==
X-Google-Smtp-Source: AGHT+IG/VagrGt6bbb5MQZ1l2HyN6eoH3YHZ865LF4suVMe/z6ykxO6VmgeAkdlRkcs2VpPNynx8Og==
X-Received: by 2002:a05:6402:2714:b0:609:d55e:8a88 with SMTP id 4fb4d7f45d1cf-60c4def71bdmr915957a12.10.1750861316962;
        Wed, 25 Jun 2025 07:21:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4682cfsm2588550a12.39.2025.06.25.07.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
References: <20250612094807.62532-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Align i2c-gpio node names with
 dtschema
Message-Id: <175086131563.117782.7215160413435880072.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:55 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 12 Jun 2025 11:48:08 +0200, Krzysztof Kozlowski wrote:
> New dtschema v2025.6 enforces different naming on I2C nodes thus new
> dtbs_check warnings appeared for I2C GPIO nodes:
> 
>   exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
>     $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
>   exynos4212-tab3-lte8.dtb: i2c-gpio-3 (i2c-gpio):
>     Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'magnetometer@2e' were unexpected)
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: exynos: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/a0c7a6b5f42b29dddfc359717d620e5b1badb9a1
[2/2] ARM: dts: s5pv210: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/a24cd2f207efa73d7ce8089ce4848aea99f48f6e
[3/3] arm64: dts: exynos5433: Align i2c-gpio node names with dtschema
      https://git.kernel.org/krzk/linux/c/42873b118abf3e297e012e52ddcae2e5b1f42214

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

