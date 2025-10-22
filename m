Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B555D336EC2
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761132277; cv=none; b=cs97iZ0UoQc6dxuJFL3LIe5FYYXF1nQfWWL2nfrV3hj9avvqscmylXqsJjZm4xGpQlMZAJZv8hO5/nEvgiva57DzqrW8+CGTdGNd74K/b7gaM+oFBLT0OuXdylM7N4er+uGwG7DgVKWWua5XaZVRjxuFvk1srA60pbazv1c0K0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761132277; c=relaxed/simple;
	bh=4D8tvphMGIr2s84sTEq6X1ry1GAv1OlmyNqaGX6YgUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZyrI+KgHKf+tldraYJ5EbJz3Ja7CcpFoPlqKMPnxcbaUxI/CcMuyy4fVc9Xi800/BiJXcnZLiP6/z0sAYiLj6kyb66zfEjwwHIbKZHUDqsJS7BHMCxAynlyV/gyD3OKZ9gBPKbvEXGvFGvxy6GalyadSgJlvu7CXlTbkywQ0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gK4c788o; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gK4c788o"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so63696455e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 04:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761132274; x=1761737074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NE6ALi4oCIm+yd7a3yOvtFqmufCiCdrMy/7EGT/KVX4=;
        b=gK4c788o2dUERwLeI5fVMForfuiRyVpYluEl/tRSkBoSWiDvE+fhYQHMY4v1RDEHmW
         Pn32t2Z9nrd2ltd0HzveMoV2j44OKM2spAJpQ/kTqrqa96vwz8mjQrHD6yztYlXqy0ek
         UZOiaWSWatF3L5vc7Yq8Shupkx8yzWitt7geBvedGjAczs5gM5KbSAmMo5EPGFA0huQt
         H+ED/Uy9kyRKkag3A5Iu24SLNSwT+4QWusL8lSpn+m86vQHp11JnLcL+XYAHQtTL2k+V
         ewP+h2jtRFI+U9PrZhDMfo5eEyK2v73AAd6S0ZGQJtGgZccm4VWQ9vlhRmuhFsxFzJF0
         p7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761132274; x=1761737074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NE6ALi4oCIm+yd7a3yOvtFqmufCiCdrMy/7EGT/KVX4=;
        b=sprOZAdA31VytvOTrzF6D16RuGfNuyNOXKpHVw0IEB0BepJc5suHPQ8ioywzbHNFYa
         jO7mIBd2vECRX7JfbA7Cv4EHKcOVAZktn57vuAD7aeYw5K/CDGAJbFKQOPubPxnb+Epl
         oXTAA15Sh8ZQAZ1BK+HllVRPPAEGbrTew/p7DHwHC/plFV3vEef/xkRPOFs/lvyNgzn/
         LbJtFGyGbtBv6GBgt6fUP+/jouPLVQgqs01K8ETFaHQbMJJEM1SStk6uwTzkRI+X9tSr
         P9Wzcke+tveAzYJpRq2aPpwdanBwkfKximW6CwKB5aK5EGOoJ6df92Ks99y18bMuvULV
         MEOg==
X-Forwarded-Encrypted: i=1; AJvYcCV5y/hKrVqiHKSgbm9NBPepJoJh9MJw/JZHAG7K+XEuLkm2wxAWJ9E+TjRDEIIombCAIiTPHE/IMwhAy1C7M92v+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoStj1rEUyr6WGu11Sc8R+wKQXBHOzsPuVmJI9zZANwVR2+3Ng
	9eQNQe2nDBU0ElK3uECSRv9DUjAB+UWlN9xCCr7RYgLEaSsu68qabPf++BuKKE4pRY8=
X-Gm-Gg: ASbGnct4rLyJHk9AFupB4/fFu+PuvYTWkyjJbuEqQ9nz5KIxS02mqLnLMtd6VmcfzUM
	TxzBBCALjaAJ+OWCLo3a92Itzbe/pAbUgDJIKMjotiKxF88UtwZyjEXriMU3AOyD8TMhAoIMK96
	lNbNa+Z08bQDBTxaD0RKi972waUg/JdIv1P8sL9Dv/Ztxr2ZpHeu/iJZ7CQB+pfEJ5m3etkGkus
	1ikrus5dqzxTq9ZhlQRs9ZhYiogwK6lksGxdOPZSboFqxYD0OfIhgxoqoa8KJ94dh4hlVskzQa/
	xlJX2YGf8gQwFkbRA0slSRjsZjTpEg5LlrGTjSXnsMqAWrFrWmhlNt8h78coYCAUx+hUg2RvvrO
	5CY+n34V8u4DDODC3tcYD/inebsdNIPD2Z6ZSkJMSh3NcsK2KdmIn4EGFnf8Nr09Z0fxQpA+MWP
	H5xQqyw+Ltk3igyEpN7/g=
X-Google-Smtp-Source: AGHT+IFHudZFCqpsdF3BziLjxKHgkZc7fTsjSbocAq1uyR2DAIJq/pryZEZ8IbOeeE5y3RSm6MSLNg==
X-Received: by 2002:a05:600c:3e12:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-471178a74demr147513535e9.12.1761132274047;
        Wed, 22 Oct 2025 04:24:34 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a534sm45864405e9.6.2025.10.22.04.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:24:33 -0700 (PDT)
Message-ID: <61813f89-3015-4fdb-a182-5c4159f7bb1e@linaro.org>
Date: Wed, 22 Oct 2025 12:24:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] hwrng: exynos: enable GS101 TRNG support
To: =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org,
 willmcvicker@google.com, kernel-team@android.com,
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/22/25 12:19 PM, Tudor Ambarus wrote:
> Hi,
> 
> I propose the bindings to go through the Samsung tree as well so that we
> can match the compatible with the schema when pulling the DT patch.
> 
> Thanks!
> ta
> 
> ---
> Enable GS101 TRNG support. It works well with the current Exynos850 TRNG
> support. Tested on pixel 6 like this:
> 

the commands started with # and were removed from the cover letter.
I fill them in to avoid a resubmit:

# cat /sys/devices/virtual/misc/hw_random/rng_current> 10141400.rng
> 

dd if=/dev/hwrng bs=100000 count=1 > /dev/null> 1+0 records in
> 1+0 records out
> 100000 bytes (100 kB, 98 KiB) copied, 2.03619 s, 49.1 kB/s
> 

# rngtest -c 1000 < /dev/hwrng> rngtest 6.17
> ...
> rngtest: starting FIPS tests...
> rngtest: bits received from input: 20000032
> rngtest: FIPS 140-2 successes: 1000
> rngtest: FIPS 140-2 failures: 0
> rngtest: FIPS 140-2(2001-10-10) Monobit: 0
> rngtest: FIPS 140-2(2001-10-10) Poker: 0
> rngtest: FIPS 140-2(2001-10-10) Runs: 0
> rngtest: FIPS 140-2(2001-10-10) Long run: 0
> rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
> rngtest: input channel speed: (min=380.570; avg=385.422; max=386.964)Kibits/s
> rngtest: FIPS tests speed: (min=75.092; avg=81.784; max=84.771)Mibits/s
> rngtest: Program run time: 50908949 microseconds
> 
> To: Łukasz Stelmach <l.stelmach@samsung.com>
> To: Olivia Mackall <olivia@selenic.com>
> To: Herbert Xu <herbert@gondor.apana.org.au>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Alim Akhtar <alim.akhtar@samsung.com>
> To: Peter Griffin <peter.griffin@linaro.org>
> To: André Draszik <andre.draszik@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: semen.protsenko@linaro.org
> Cc: willmcvicker@google.com
> Cc: kernel-team@android.com
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> Tudor Ambarus (2):
>       dt-bindings: rng: add google,gs101-trng compatible
>       arm64: dts: exynos: gs101: add TRNG node
> 
>  .../devicetree/bindings/rng/samsung,exynos5250-trng.yaml       | 10 +++++++---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi                   |  9 +++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> ---
> base-commit: 8ebc2add3e2d076adc5cc3e8c9bef268f7f1cb31
> change-id: 20251022-gs101-trng-54b710218424
> 
> Best regards,

