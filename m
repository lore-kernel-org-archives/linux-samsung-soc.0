Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA567D515
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Nov 2025 16:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762274079; cv=none; b=d1WAIww0oyrqF3IwQnwHAbONADZkeVhinI4JUNY8xvN3KydCHlaU3n1E7BoQykVhhAeFRKZ8wUGn3Rry4Afhg09o3GJw+tGJVeb5ESp/+UUmo6S56X9KVy+WoL3UBRuz9I4s4yXwymWDkkchQYc3nCKm0EjD1JvXlYBroe9HMk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762274079; c=relaxed/simple;
	bh=ZCRrsNnGD1S09B2y5p35lTy0oeCos0DFHrUpZ52om0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1jNIwROSM1bkkOQBd1Jc1ezNsjGzkNFoYQCCVnKVLa/SklHtUe3vte7UE2sGgnCORbVktbwfR1MUwCVqxf+BNpppk8bfrjmeCQbam9HSzto2GzynUAQI8UwFSlNojoZSXZoNjU7u83YvKh6Aa/oEiypYUIombNSEyL5545oduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+oOM1zV; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+oOM1zV"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63e330a1360so5947052d50.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2025 08:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762274077; x=1762878877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ddGDx7DY8ZvT+UQbsTdKBb2vYIe/GE/fB2OEWm/nLJk=;
        b=Z+oOM1zVJKti99ORIdAEPWGKiTiHHMt4gN9j9j9VyTpsH0FJke8b/o2PeTufKQf06+
         QMGhAVamfy9AVHbZlkGtLIPCHRWeHsFT3McddFfWJLRpWDPsudiIqN7t0Z5R31nStK1C
         h4/kZfPW17y0TrZn5XYIuiZp4JbVDHMY0DAym3KOad5SqR+Rc1ShRMDog6uwjoQmdI93
         n4XagCCKQCTAi8sjfGYMGeJv7HspXwS5eP/VGlUSxjr/fem8qVnlLs9E9/dCHS7ZI6vg
         HSFZUKhdmFDMfEP3hTCbQxbgSQv0i1NuyaIBP/OEPh8x37Zvb0Tn77bW9bT7nlBGQqZZ
         ssVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762274077; x=1762878877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddGDx7DY8ZvT+UQbsTdKBb2vYIe/GE/fB2OEWm/nLJk=;
        b=BwJPeSNcpv0J93Xal5JI59WXN56biM+91pPZuShTohDuoKMeGHkmy/6IDtJICzPjKC
         2+raJBv9Qg0v5ttntPzhZEX4SiVLRpwAGv/mWfA2308wDPpn/o/AmEEW85vcjzi5GpiI
         tp83C3QJYxIqY/keYd96ZlCrOUpElMbJ+6AzRiDAtnlpcmhD53+FKe3ICW9qgDYIDz4p
         7D2RPpTE0aV3cSvYAiqIkcxAY28kxFApohRuM+O46Hq92lL7fIPDT1gQB5vPRaIo6dCb
         yVAdrWYI86LZ7Uyvht5E57+10xz3HRZgmx1X8B8ADFDe8J71JyAAQVzei5SbGgvRBV3J
         1a1g==
X-Forwarded-Encrypted: i=1; AJvYcCUi8mDV6dqLOmGUxY68PIdwSapx2jem4zAzoPWtB7N/QN2WN9WO+aUhrJA89zv9pmwLisjpGKcFOxNawF0A0+quiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLhlyMArDm6w7FQO1+F23v9OndhvsuE+pe9ueOGw6HDit08Xvs
	rkCjXMksh2GvTAwbO+Am4H4q6/uR9ijMoJvjkVMLU/RInbv3z6KumqiCz1PonOVc0AO80SYvdhu
	BpXM7VuipaBAmbYFLHtGEQ8IWR4b8B3E9Hx/9gHARPQ==
X-Gm-Gg: ASbGncvfFiS6kPnxs8octoHYhdlP/DHhD+tgiHdD53ANz0HrQHQY4F040AN/sD53Whn
	Gb5u0l84iwdpoF2HC4S/udXchoYPVWhXyM8cubfOSXvssN4qtm5MTiiRBCm8ocKDndpc185wDrd
	LrEUa3tEsGFooPoHIplg7pvIPrTbDQwPWJUd5CKRoBxg+/7EYBzn3xL4AY6EXV64bJYe8KAIqNz
	WgJU7kGLkBOpuSmEqlqhuY+6vGgZdYswKa9jI0asfsJZ/K7dqCN4f6v9+S3ZA==
X-Google-Smtp-Source: AGHT+IHbMYmustVhhlT+m6xRfPZ0ZgypdMtcu7VuUMd6mP1bXe2DJ9gFsZnpH6bI4QSialr+pLyKljrmmrvqLPvCmm8=
X-Received: by 2002:a05:690e:23cb:b0:63c:f5a6:f2ef with SMTP id
 956f58d0204a3-63fd35bd9d8mr38659d50.65.1762274076778; Tue, 04 Nov 2025
 08:34:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20251027125521eucas1p206cd5a0dd4c3a80bc8abe7d9a5e61706@eucas1p2.samsung.com>
 <20251027125515.1219940-1-m.szyprowski@samsung.com>
In-Reply-To: <20251027125515.1219940-1-m.szyprowski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Nov 2025 17:34:00 +0100
X-Gm-Features: AWmQ_blmnc7xyq9khBlGTyV4UvzKjRpkE7cFZ6cuEA1Z_dVEpjKnivKnW8fVoDI
Message-ID: <CAPDyKFr3JDgh2c_XVvSdWrzTeiH_aSy2AE3pqW7HC2sWJZsrRQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: samsung: Rework legacy splash-screen
 handover workaround
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 13:55, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Limit the workaround for the lack of the proper splash-screen handover
> handling to the legacy ARM 32bit systems and replace forcing a sync_state
> by explicite power domain shutdown. This approach lets compiler to
> optimize it out on newer ARM 64bit systems.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Fixes: 0745658aebbe ("pmdomain: samsung: Fix splash-screen handover by enforcing a sync_state")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2:
> - removed label check, as this violates ABI
>
> v1: https://lore.kernel.org/all/20251024093603.3484783-1-m.szyprowski@samsung.com/
> ---
>  drivers/pmdomain/samsung/exynos-pm-domains.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
> index f53e1bd24798..5c3aa8983087 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -128,6 +128,15 @@ static int exynos_pd_probe(struct platform_device *pdev)
>         pd->pd.power_on = exynos_pd_power_on;
>         pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
>
> +       /*
> +        * Some Samsung platforms with bootloaders turning on the splash-screen
> +        * and handing it over to the kernel, requires the power-domains to be
> +        * reset during boot.
> +        */
> +       if (IS_ENABLED(CONFIG_ARM) &&
> +           of_device_is_compatible(np, "samsung,exynos4210-pd"))
> +               exynos_pd_power_off(&pd->pd);
> +
>         on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
>
>         pm_genpd_init(&pd->pd, NULL, !on);
> @@ -146,15 +155,6 @@ static int exynos_pd_probe(struct platform_device *pdev)
>                                 parent.np, child.np);
>         }
>
> -       /*
> -        * Some Samsung platforms with bootloaders turning on the splash-screen
> -        * and handing it over to the kernel, requires the power-domains to be
> -        * reset during boot. As a temporary hack to manage this, let's enforce
> -        * a sync_state.
> -        */
> -       if (!ret)
> -               of_genpd_sync_state(np);
> -
>         pm_runtime_enable(dev);
>         return ret;
>  }
> --
> 2.34.1
>
