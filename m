Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E7C28725E
	for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Sep 2025 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759034099; cv=none; b=B3e2uYmL4ebw5SR9si1JqfYk2gC1qeg/g3xM8030SLnp++NMNNLq/lew1fCsWw7wb7VghwuRXyMYQGuK4h+6O/GaFRvcFkQfe+PXuedxC8fbaIbt4WDRfTA890lf60xWQkugt8p3NqOlclIogH9X2fGjfGvTlJM9cgPSO9s55Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759034099; c=relaxed/simple;
	bh=x/iAMEfhFQ96nT4EsXIin8xHsP3iS1/961id7m6vOAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekMDA0+BD1WyxFc47r5YHR8UPiKcw8a7aJCtDcHm+7I5M1q3AYX9APjPktRiF3xKzi7B/9fb8flypIUl3pwFNQO6ixaZQGaCUg1qbfNRye4rQfrNAu6+duDY91pYXCMEbCpUYNjBGS9TfOnXKy+GyuoWMx48/S0q/htU0mezeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3a+OCW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3a+OCW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033AAC113D0
	for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Sep 2025 04:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759034099;
	bh=x/iAMEfhFQ96nT4EsXIin8xHsP3iS1/961id7m6vOAI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C3a+OCW7agSsSUJrWxa9qUULhZ0/T7cRubYvfrzrcy4VpxNK5YNUm8HtyIu/79O6W
	 F+HCAaeXuYK3Nd39x4U3v2LhI9bm0KVJRCsgz25OnqXkrdqv34ZXXIADvab9oYWdGt
	 njnmTXIoZHJJ506cs91VhvFqYp+G2CMtcmpkWgqAMM4v5lGNgmbB99YghPSXD3ArTe
	 XXD9ePVYafs2DfRwRTeZsoIP/6DhENBCS3M+J7DOL+aADV1reyWHM2Xf+8g37HsJ7v
	 jr/PH4wgK0BPYy1O+p0L3Zsi4CQZwBtE1uxv0S7kqJYb5RPQChcs9taXOgU5PcTGl8
	 npl/XZH8qc4Pw==
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27eed7bdfeeso28380645ad.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Sep 2025 21:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXrnWFMVqN+Pu1Gh2mCC/f+d83mIElzorz5tdgLSi+ZOyfO1qi2gmg7gw2goZFW6E3OMYSkxPqiWI3NtOJqzl0j7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqhe94AgbXeLSGxf0f0+ZmUzRf5g4jS5Y5UTakwOgkws2rCDUy
	cHZFtodFNWy4H8Zh79N/fidLMN75HBy5w/x5+IdiHTJYSL8sdAp9ImRFdXUQHqqLO03FmHsg+dB
	3LPAo5rySuQaRXAT07f/jom1D6p5qkgs=
X-Google-Smtp-Source: AGHT+IEvpC+fZhKriALPhAAHYn0OG8EEAGcMYQkIgjBYmtXlINnzWABnAmfFm/NDNUhpqe9it9R7ngTXVVvTZEYqySk=
X-Received: by 2002:a17:903:298b:b0:24b:270e:56d4 with SMTP id
 d9443c01a7336-27ed6ad0684mr143987145ad.4.1759034098565; Sat, 27 Sep 2025
 21:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928035108.10432-1-make24@iscas.ac.cn>
In-Reply-To: <20250928035108.10432-1-make24@iscas.ac.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 28 Sep 2025 13:34:45 +0900
X-Gmail-Original-Message-ID: <CAJKOXPehQ+nsPk_JsNGCwZdfYCrdJ7c6x-mLgn-VaissiSQycw@mail.gmail.com>
X-Gm-Features: AS18NWBkJsznHwnBuF6ULH6dpVms9-ecEezN84hhkizvBeyEC7vnkdoTdHYfrOk
Message-ID: <CAJKOXPehQ+nsPk_JsNGCwZdfYCrdJ7c6x-mLgn-VaissiSQycw@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: exynos-pmu: fix reference leak in exynos_get_pmu_regmap_by_phandle()
To: Ma Ke <make24@iscas.ac.cn>
Cc: alim.akhtar@samsung.com, semen.protsenko@linaro.org, 
	peter.griffin@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Best regards,
Krzysztof

On Sun, 28 Sept 2025 at 12:51, Ma Ke <make24@iscas.ac.cn> wrote:
>
> In exynos_get_pmu_regmap_by_phandle(), driver_find_device_by_of_node()
> utilizes driver_find_device_by_fwnode() which internally calls
> driver_find_device() to locate the matching device.
> driver_find_device() increments the reference count of the found
> device by calling get_device(), but exynos_get_pmu_regmap_by_phandle()
> fails to call put_device() to decrement the reference count before
> returning. This results in a reference count leak of the device each
> time exynos_get_pmu_regmap_by_phandle() is executed, which may prevent
> the device from being properly released and cause a memory leak.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 0b7c6075022c ("soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU regs")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index a77288f49d24..ed903a2dd416 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -302,6 +302,7 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>  {
>         struct device_node *pmu_np;
>         struct device *dev;
> +       struct regmap *regmap;
>
>         if (propname)
>                 pmu_np = of_parse_phandle(np, propname, 0);
> @@ -325,7 +326,10 @@ struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
>         if (!dev)
>                 return ERR_PTR(-EPROBE_DEFER);
>
> -       return syscon_node_to_regmap(pmu_np);
> +       regmap = syscon_node_to_regmap(pmu_np);
> +       put_device(regmap);
> +
> +       return regmap;
>  }
>  EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
>
> --
> 2.17.1
>
